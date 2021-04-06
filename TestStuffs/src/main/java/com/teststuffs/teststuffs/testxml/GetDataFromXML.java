package com.teststuffs.teststuffs.testxml;

import java.io.StringReader;
import javax.xml.parsers.*;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

public class GetDataFromXML {
    
   
   public static String xmlStr = "<SelectPAPSMessageAttribsResponse>" +
"      <part>" +
"         <SelectPAPSMessageAttribsOutputCollection>" +
"            <SelectPAPSMessageAttribsOutput>" +
"               <id>14687053</id>" +
"               <message_id>231159</message_id>" +
"               <name>REPLAY_MONTHS</name>" +
"               <value>8</value>" +
"            </SelectPAPSMessageAttribsOutput>" +
"            <SelectPAPSMessageAttribsOutput>" +
"               <id>14687054</id>" +
"               <message_id>231159</message_id>" +
"               <name>ACCOUNT_NUMBER</name>" +
"               <value>2612557</value>" +
"            </SelectPAPSMessageAttribsOutput>" +
"            <SelectPAPSMessageAttribsOutput>" +
"               <id>14687051</id>" +
"               <message_id>231159</message_id>" +
"               <name>PAYMENT_DELAY_MONTHS</name>" +
"               <value>3</value>" +
"            </SelectPAPSMessageAttribsOutput>" +
"            <SelectPAPSMessageAttribsOutput>" +
"               <id>14687052</id>" +
"               <message_id>231159</message_id>" +
"               <name>PAYMENT_DELAY_PERCENT</name>" +
"               <value>50</value>" +
"            </SelectPAPSMessageAttribsOutput>" +
"         </SelectPAPSMessageAttribsOutputCollection>" +
"      </part>" +
"   </SelectPAPSMessageAttribsResponse>";
   public static void main(String[] args) 
    {
        //Use method to convert XML string content to XML Document object
        Document doc = convertStringToXMLDocument( xmlStr );
         
        //Verify XML document is build correctly
        System.out.println(doc.getFirstChild().getNodeName());
        Node n = doc.getFirstChild();
        Element eElement = (Element) n;
        NodeList rList = eElement.getElementsByTagName("SelectPAPSMessageAttribsOutput");
        
        System.out.println(doc.getFirstChild());
        System.out.println(rList.getLength());
        Node nNodeRow;
        Element eElementRow;
        for (int temp = 0; temp < rList.getLength(); temp++) {
            nNodeRow = rList.item(temp);
            eElementRow = (Element) nNodeRow;
            NodeList aa = eElementRow.getElementsByTagName("name");
            NodeList bb = eElementRow.getElementsByTagName("value");
            //System.err.println("aa: " + aa.getLength());
            Node nNode1 = aa.item(0);
            Node nNode2 = bb.item(0);
            System.out.println(nNode1.getTextContent());
            System.out.println(nNode2.getTextContent());
        }
    }
 
    private static Document convertStringToXMLDocument(String xmlString) 
    {
        //Parser that produces DOM object trees from XML content
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
         
        //API to obtain DOM Document instance
        DocumentBuilder builder = null;
        try
        {
            //Create DocumentBuilder with default configuration
            builder = factory.newDocumentBuilder();
             
            //Parse the content to Document object
            Document doc = builder.parse(new InputSource(new StringReader(xmlString)));
            return doc;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return null;
    }
}
