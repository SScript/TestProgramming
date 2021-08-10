package com.loadxsd;

import org.w3c.dom.*;

import java.io.*;
import javax.xml.bind.JAXBContext;
import javax.xml.parsers.*;

//import org.ecli

public class LoadXSDTest {

    public static void main(String[] args) throws Exception {
        // no neta dabūjam XSD stream
        StringBuilder response = new StringBuilder();

        NodeList nList = getNodeList(response);


    }

    public static NodeList getNodeList(StringBuilder response) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        ByteArrayInputStream input = new ByteArrayInputStream(response.toString().getBytes("UTF-8"));
        Document doc = builder.parse(input);
        doc.getDocumentElement().normalize();
        //System.err.println("Root element :" + doc.getDocumentElement().getNodeName());

        return doc.getElementsByTagName("ns1:cData");
    }

}
