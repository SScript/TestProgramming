package com.VID;
import java.io.*;
import java.net.*;
import java.security.SecureRandom;
import java.text.*;
import java.util.*;

import javax.net.ssl.*;
import javax.xml.namespace.QName;
import javax.xml.soap.*;
import javax.xml.ws.handler.MessageContext;
import javax.xml.ws.handler.soap.*;

import org.w3c.dom.DOMException;

public class SoapConnectionHandler implements SOAPHandler<SOAPMessageContext> {
    private Date dateCreated = null;
    private Date dateExpires = null;

    private Date stsDate = null;
    private Node assertion = null;

    private String messageUUID = null;

    private LoginRequest loginRequest = null;

    private boolean uuidIsEquals = false;

    public SoapConnectionHandler(LoginRequest login) {
        this.loginRequest = login;
    }

    private HttpsURLConnection getConnection() throws Exception {
        SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
        sslContext.init(null, null,  new SecureRandom());

        URL _url = new URL(this.loginRequest.getStsUrl());
        HttpsURLConnection connection = (HttpsURLConnection) _url.openConnection();
        connection.setSSLSocketFactory(DummeTrustManager.getSSLSocketFactory());
        //connection.setSSLSocketFactory(sslContext.getSocketFactory());
        connection.setHostnameVerifier(new DummeHostnameVerifier());
        return connection;
    }

    public void login() throws Exception {
        this.requestStsDate();

        HttpsURLConnection connection = this.getConnection();

        connection.setRequestMethod("POST");
        connection.addRequestProperty("Content-Type", "application/soap+xml; charset=utf-8");

        connection.setDoOutput(true);
        connection.setDoInput(true);
        connection.setConnectTimeout(600);
        connection.connect();

        OutputStream out = connection.getOutputStream();

        this.messageUUID = this.loginRequest.doLogin(out, this.stsDate);

        out.close();

        int code = connection.getResponseCode();

        if (code == HttpURLConnection.HTTP_OK) {
            SOAPMessage response = MessageFactory.newInstance(SOAPConstants.SOAP_1_2_PROTOCOL).createMessage(new MimeHeaders(), connection.getInputStream());
            // response.writeTo(System.out);
            this.checkResponseAssertion(response);
        } else {
            String message = "";

            if (code == HttpURLConnection.HTTP_INTERNAL_ERROR) {
                String soap_ns = "http://www.w3.org/2003/05/soap-envelope";
                SOAPMessage fault_message = MessageFactory.newInstance(SOAPConstants.SOAP_1_2_PROTOCOL).createMessage(new MimeHeaders(),
                        connection.getErrorStream());
                SOAPElement fault = (SOAPElement) fault_message.getSOAPBody().getElementsByTagNameNS(soap_ns, "Fault").item(0);
                SOAPElement subcode = (SOAPElement) fault.getElementsByTagNameNS(soap_ns, "Subcode").item(0);
                String value = subcode.getElementsByTagNameNS(soap_ns, "Value").item(0).getTextContent();
                String text = fault.getElementsByTagNameNS(soap_ns, "Text").item(0).getTextContent();
                message += value + " {" + text + "}";

                throw new Exception(message);
            }
            throw new Exception("Unable to login HTTP-" + code);
        }
        connection.disconnect();
    }

    private void checkResponseAssertion(SOAPMessage message) throws DOMException, SOAPException, ParseException {
        Node tmp_assertion = (Node) message.getSOAPBody().getElementsByTagNameNS("urn:oasis:names:tc:SAML:1.0:assertion", "Assertion").item(0);

        if (null != tmp_assertion) {
            String life_time_ns = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd";
            Node created = (Node) message.getSOAPBody().getElementsByTagNameNS(life_time_ns, "Created").item(0);
            Node expires = (Node) message.getSOAPBody().getElementsByTagNameNS(life_time_ns, "Expires").item(0);

            if (null != created && null != expires) {
                SimpleDateFormat ZULU = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.ROOT);
                this.dateCreated = ZULU.parse(created.getTextContent());
                this.dateExpires = ZULU.parse(expires.getTextContent());
                Node relates_to = (Node) message.getSOAPHeader().getElementsByTagNameNS("http://www.w3.org/2005/08/addressing", "RelatesTo").item(0);

                if (null != relates_to) {
                    this.uuidIsEquals = this.messageUUID.equals(relates_to.getTextContent());
                }

            }
            this.assertion = tmp_assertion;
        }
    }

    // should be known but for testing we will retrieve it from STS server!
    private void requestStsDate() {
        javax.net.ssl.HttpsURLConnection connection = null;
        try {
            connection = this.getConnection();
            //connection.setHostnameVerifier(new HostnameVerifier() {
            //    @Override
            //    public boolean verify(String hostname, SSLSession sslSession) {
            //        return true;
            //    }
            //});
            connection.connect();

            SimpleDateFormat dateParser = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss", Locale.ROOT);
            this.stsDate = dateParser.parse(connection.getHeaderField("Date"));
        } catch (Exception e) {
            this.stsDate = null;
            e.printStackTrace();
        } finally {
            if (connection != null)
                connection.disconnect();
        }
    }

    public boolean isValid() {
        if (this.uuidIsEquals && null != this.dateCreated && null != this.stsDate && null != this.dateExpires) {
            return this.dateCreated.compareTo(this.stsDate) >= 0 && this.dateExpires.compareTo(this.stsDate) > 0;
        }
        return false;
    }

    /* ================SOAPHandler<SOAPMessageContext>===================== */

    @Override
    public boolean handleMessage(SOAPMessageContext context) {
        try {
            Boolean out_indicator = (Boolean) context.get(MessageContext.MESSAGE_OUTBOUND_PROPERTY);

            if (out_indicator.booleanValue()) {

                SOAPMessage message = context.getMessage();
                SOAPEnvelope envelope = message.getSOAPPart().getEnvelope();

                envelope.addNamespaceDeclaration("a", "http://www.w3.org/2005/08/addressing");
                envelope.addNamespaceDeclaration("u", "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd");

                SOAPHeader header = message.getSOAPPart().getEnvelope().getHeader();

                if (null == header) {
                    header = message.getSOAPPart().getEnvelope().addHeader();
                }

                SOAPElement security = header.addChildElement("Security", "o",
                        "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd");
                ((SOAPHeaderElement) security).setMustUnderstand(true);

                // Timestamp
                SOAPElement timestamp = security.addChildElement("Timestamp", "u");
                timestamp.addAttribute(envelope.createName("Id", "u", ""), "_0");

                SOAPElement created = timestamp.addChildElement("Created", "u");
                created.addTextNode(Tools.getCreatedTime(this.stsDate));

                SOAPElement expires = timestamp.addChildElement("Expires", "u");
                expires.addTextNode(Tools.getExpiresTime(this.stsDate));

                if (this.assertion != null) {
                    Node n = (Node) security.getOwnerDocument().importNode(this.assertion, true);
                    security.appendChild(n);
                }
                // message.writeTo(System.out);
            }
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean handleFault(SOAPMessageContext context) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public void close(MessageContext context) {}

    @Override
    public Set<QName> getHeaders() {
        QName securityHeader = new QName("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd", "Security", "wsse");
        HashSet<QName> headers = new HashSet<>();
        headers.add(securityHeader);
        securityHeader = new QName("http://www.w3.org/2005/08/addressing", "Action", "a");
        headers.add(securityHeader);

        return headers;
    }

}