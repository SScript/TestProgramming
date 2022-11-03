package com.VID;

import java.io.*;
import java.security.*;
import java.security.cert.*;
import java.util.*;

import javax.xml.bind.DatatypeConverter;
import javax.xml.crypto.*;
import javax.xml.crypto.dom.DOMStructure;
import javax.xml.crypto.dsig.*;
import javax.xml.crypto.dsig.dom.DOMSignContext;
import javax.xml.crypto.dsig.keyinfo.*;
import javax.xml.crypto.dsig.spec.*;
import javax.xml.parsers.*;
import javax.xml.soap.*;

import org.w3c.dom.*;

public class X509LoginRequest extends LoginRequest {
    public static final String OASIS_200401_WSS_X509_TOKEN_PROFILE_NS = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3";

    private X509Certificate certificate;
    private PrivateKey privateKey;

    public X509LoginRequest(String path, String alias, char[] password, String destination, String sts)
            throws KeyStoreException, NoSuchAlgorithmException, CertificateException, FileNotFoundException, IOException, UnrecoverableEntryException {
        super(destination, sts);

        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(new FileInputStream(path), password);
        KeyStore.PrivateKeyEntry keyEntry = (KeyStore.PrivateKeyEntry) ks.getEntry(alias, new KeyStore.PasswordProtection(password));
        this.certificate = (X509Certificate) keyEntry.getCertificate();
        this.privateKey = keyEntry.getPrivateKey();
    }
    String tockenId = null;

    @Override
    public void addTocken(SOAPEnvelope envelope, SOAPElement security)
            throws SOAPException, CertificateEncodingException, DOMException, UnsupportedEncodingException, MarshalException {
        SOAPElement basic_security_token = security.addChildElement("BinarySecurityToken", "o");
        this.tockenId = "uuid-" + UUID.randomUUID().toString() + "-2";

        basic_security_token.addAttribute(envelope.createName("Id", "u", ""), this.tockenId);
        basic_security_token.addAttribute(envelope.createName("ValueType"), OASIS_200401_WSS_X509_TOKEN_PROFILE_NS);
        basic_security_token.addAttribute(envelope.createName("EncodingType"),
                "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary");

        basic_security_token.setTextContent(DatatypeConverter.printBase64Binary(this.certificate.getEncoded()));
    }

    @Override
    void writeTo(SOAPMessage message, OutputStream out) throws Exception {
        XMLSignatureFactory sigFactory = XMLSignatureFactory.getInstance();

        List<Transform> trans = new ArrayList<>();
        trans.add(sigFactory.newTransform(CanonicalizationMethod.EXCLUSIVE, (TransformParameterSpec) null));

        List<Reference> references = new ArrayList<>();
        references.add(sigFactory.newReference("#_0", sigFactory.newDigestMethod(DigestMethod.SHA1, null), trans, null, null));
        references.add(sigFactory.newReference("#_1", sigFactory.newDigestMethod(DigestMethod.SHA1, null), trans, null, null));

        SignedInfo si = sigFactory.newSignedInfo(sigFactory.newCanonicalizationMethod(CanonicalizationMethod.EXCLUSIVE, (C14NMethodParameterSpec) null),
                sigFactory.newSignatureMethod(SignatureMethod.RSA_SHA1, null), references);

        SOAPHeader header = message.getSOAPHeader();
        SOAPElement security = this.getSecurity(header);

        DOMSignContext dsc = new DOMSignContext(this.privateKey, security);
        dsc.putNamespacePrefix(XMLSignature.XMLNS, "ds");
        dsc.setIdAttributeNS(getTimestamp(header), OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS, "Id");
        dsc.setIdAttributeNS(getTo(header), OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS, "Id");

        // Create the XMLSignature, but don't sign it yet.
        XMLSignature signature = sigFactory.newXMLSignature(si, getSecurityTokenReferenceKeyInfo(sigFactory, ("#" + this.tockenId)));

        signature.sign(dsc);
        message.writeTo(out);
        //message.writeTo(System.out);
    }

    private KeyInfo getSecurityTokenReferenceKeyInfo(XMLSignatureFactory sigFactory, String id) throws ParserConfigurationException {

        DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
        Document document = docBuilder.newDocument();

        Element secRef = document.createElementNS(OASIS_200401_WSS_WSSECURITY_SECEXT_1_0_NS, "SecurityTokenReference");
        secRef.setPrefix("o");
        Element ref = (Element) secRef.appendChild(document.createElementNS(OASIS_200401_WSS_WSSECURITY_SECEXT_1_0_NS, "Reference"));
        ref.setPrefix("o");
        ref.setAttributeNS(null, "ValueType", OASIS_200401_WSS_X509_TOKEN_PROFILE_NS);
        ref.setAttributeNS(null, "URI", id);

        XMLStructure structure = new DOMStructure(secRef);
        KeyInfoFactory kif = sigFactory.getKeyInfoFactory();
        KeyInfo ki = kif.newKeyInfo(java.util.Collections.singletonList(structure));
        return ki;
    }

    private SOAPElement getTo(SOAPHeader header) {
        SOAPElement to = (SOAPElement) header.getElementsByTagNameNS(ADDRESSING_NS, "To").item(0);
        return to;
    }

    private SOAPElement getSecurity(SOAPHeader header) {
        SOAPElement security = (SOAPElement) header.getElementsByTagNameNS(OASIS_200401_WSS_WSSECURITY_SECEXT_1_0_NS, "Security").item(0);
        return security;
    }

    private SOAPElement getTimestamp(SOAPHeader header) {
        SOAPElement security = this.getSecurity(header);
        SOAPElement timetamp = (SOAPElement) security.getElementsByTagNameNS(OASIS_200401_WSS_WSSECURITY_UTILITY_1_0_NS, "Timestamp").item(0);
        return timetamp;
    }

}
