/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SimpleTests;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**
 *
 * @author vladislavs.rudans
 */
public class TestApplication {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try{
            stopProcessing("167", " http://vvdz-dis-test.fms.lan:8001/Eclaims820FileService/Eclaims820ServicePort");
        }catch(Exception ex){
            System.out.println("Exception " + ex.getMessage());
        }
        
    }
    
    
        public static void stopProcessing(String eclaimId, String endpointURL) throws MalformedURLException,
            IOException {

        //Code to make a webservice HTTP request
        String responseString = "";
        String outputString = "";
	System.out.println("stopProcessing" + endpointURL);

        URL url = new URL(endpointURL);
        URLConnection connection = url.openConnection();

        HttpURLConnection httpConn = (HttpURLConnection) connection;
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        StringBuilder sb = new StringBuilder();

        sb.append(" <soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope/\" xmlns:ecl=\"http://eclaimPackage/\">\n");
        sb.append(" <soapenv:Header/>\n");
        sb.append(" <soapenv:Body>\n");
        sb.append(" <ecl:endEclaimsProcessing>\n");
        sb.append(" <arg0>" + eclaimId + "</arg0>\n");
        sb.append(" </ecl:endEclaimsProcessing>\n");
        sb.append(" </soapenv:Body>\n");
        sb.append(" </soapenv:Envelope>");

        StringBuilder sb1 = new StringBuilder();
        sb1.append("<soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:ecl=\"http://eclaimPackage/\">\n" +
"   <soap:Header/>\n" +
"   <soap:Body>\n" +
"      <ecl:endEclaimsProcessing>\n" +
"         <arg0>167</arg0>\n" +
"      </ecl:endEclaimsProcessing>\n" +
"   </soap:Body>\n" +
"</soap:Envelope>");
        byte[] buffer = new byte[sb1.length()];

        buffer = sb1.toString().getBytes();
        bout.write(buffer);
        byte[] b = bout.toByteArray();
        
        String SOAPAction
                = "endEclaimsProcessingRequest";
        // Set the appropriate HTTP parameters.
        httpConn.setRequestProperty("Content-Length",
                String.valueOf(b.length));
//        
        httpConn.setRequestProperty("Content-Type", "application/soap+xml;charset=UTF-8");

//        httpConn.setRequestProperty("SOAPAction", "");
        httpConn.setRequestMethod("POST");

        httpConn.setDoOutput(true);
        httpConn.setDoInput(true);
        System.out.println("---------------");
        
        //Write the content of the request to the outputstream of the HTTP Connection.
        try (OutputStream out = httpConn.getOutputStream()) {
            //Write the content of the request to the outputstream of the HTTP Connection.
            out.write(b);
            out.close();
        }

        //Read the response.
        InputStreamReader isr
                = new InputStreamReader(httpConn.getInputStream());
        BufferedReader in = new BufferedReader(isr);
//        informationLabel.setText("Parakstīts dokuments ir saglabats ...");
        //Write the SOAP message response to a String.
        while ((responseString = in.readLine()) != null) {
            System.out.println("END ");
            outputString = outputString + responseString;
            System.out.println("END " +outputString);
        }
        
    }    
 

    
}
