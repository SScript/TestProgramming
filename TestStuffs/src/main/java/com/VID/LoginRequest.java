package com.VID;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.cert.CertificateEncodingException;
import java.util.*;

import javax.xml.crypto.MarshalException;
import javax.xml.crypto.dsig.XMLSignatureException;
import javax.xml.soap.*;

import org.w3c.dom.DOMException;

public abstract class LoginRequest {
    public static final String OASIS_200401_WSS_WSSECURITY_SECEXT_1_0_NS = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";
    public static final String OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd";
    public static final String ADDRESSING_NS = "http://www.w3.org/2005/08/addressing";

    private String destination = null;
    private String sts = null;

    public String getStsUrl() {
        return this.sts;
    }

    public LoginRequest(String destination, String sts) {
        this.destination = destination;
        this.sts = sts;
    }

    public String doLogin(OutputStream os, Date stsDate) throws Exception {
        String message_id = "urn:uuid:" + UUID.randomUUID().toString();
        SOAPMessage soapMessage = MessageFactory.newInstance(SOAPConstants.SOAP_1_2_PROTOCOL).createMessage();
        SOAPPart soapPart = soapMessage.getSOAPPart();

        SOAPEnvelope soapEnvelope = soapPart.getEnvelope();
        soapEnvelope.addNamespaceDeclaration("a", ADDRESSING_NS);
        soapEnvelope.addNamespaceDeclaration("u", OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS);

        SOAPHeader header = soapEnvelope.getHeader();

        SOAPElement action = header.addChildElement("Action", "a", ADDRESSING_NS);
        action.setTextContent("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue");
        ((SOAPHeaderElement) action).setMustUnderstand(true);

        SOAPElement messageID = header.addChildElement("MessageID", "a", ADDRESSING_NS);
        messageID.setTextContent(message_id);

        SOAPElement replyTo = header.addChildElement("ReplyTo", "a", ADDRESSING_NS);
        SOAPElement address = replyTo.addChildElement("Address", "a", ADDRESSING_NS);
        address.setTextContent("http://www.w3.org/2005/08/addressing/anonymous");

        SOAPElement to = header.addChildElement("To", "a", ADDRESSING_NS);
        to.addAttribute(soapEnvelope.createName("Id", "u", OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS), "_1");
        ((SOAPHeaderElement) to).setMustUnderstand(true);
        to.setTextContent(this.sts);

        SOAPElement security = header.addChildElement("Security", "o", OASIS_200401_WSS_WSSECURITY_SECEXT_1_0_NS);
        ((SOAPHeaderElement) security).setMustUnderstand(true);

        // // Timestamp
        SOAPElement timestampElement = security.addChildElement("Timestamp", "u", OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS);
        timestampElement.addAttribute(soapEnvelope.createName("Id", "u", OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS), "_0");

        SOAPElement createdElem = timestampElement.addChildElement("Created", "u", OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS);
        createdElem.addTextNode(Tools.getCreatedTime(stsDate));
        SOAPElement expiresElem = timestampElement.addChildElement("Expires", "u", OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS);
        expiresElem.addTextNode(Tools.getExpiresTime(stsDate));

        this.addTocken(soapEnvelope, security);

        // body
        SOAPBody body = soapEnvelope.getBody();

        SOAPElement requestSecurityToken = body.addChildElement("RequestSecurityToken", "trust", "http://docs.oasis-open.org/ws-sx/ws-trust/200512");
        SOAPElement requestType = requestSecurityToken.addChildElement("RequestType", "trust");
        requestType.setTextContent("http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue");

        SOAPElement appliesTo = requestSecurityToken.addChildElement("AppliesTo", "wsp", "http://schemas.xmlsoap.org/ws/2004/09/policy");
        SOAPElement endpointReference = appliesTo.addChildElement("EndpointReference", "a", ADDRESSING_NS);
        SOAPElement app_address = endpointReference.addChildElement("Address", "a", ADDRESSING_NS);
        app_address.setTextContent(this.destination);

        // SOAPElement tokenType = requestSecurityToken.addChildElement("TokenType", "trust");
        // tokenType.setTextContent("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1");

        SOAPElement keyType = requestSecurityToken.addChildElement("KeyType", "trust");
        keyType.setTextContent("http://docs.oasis-open.org/ws-sx/ws-trust/200512/Bearer");

        this.writeTo(soapMessage, os);

        return message_id;
    }

    public abstract void addTocken(SOAPEnvelope envelope, SOAPElement security)
            throws SOAPException, CertificateEncodingException, DOMException, UnsupportedEncodingException, MarshalException, XMLSignatureException;

    void writeTo(SOAPMessage message, OutputStream out) throws Exception {
        message.writeTo(out);
        System.out.println(out.toString());
    }

}
