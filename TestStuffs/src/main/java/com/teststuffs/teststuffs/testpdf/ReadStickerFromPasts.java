package com.teststuffs.teststuffs.testpdf;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.DataOutputStream;

import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;

import java.security.SecureRandom;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.util.Base64;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;

import org.json.JSONArray;
import org.json.JSONObject;

public class ReadStickerFromPasts {
    public static void main(String[] args) throws Exception {
        //https://express.pasts.lv/parcelsDocumentsApi/stickers
        String data = "size=150x100&secret=a6463887eDc24Fc0a934b483F14604D4&parcels[0]=CE713858162LV";
        String newurl = "https://127.0.0.1:4433/parcelsDocumentsApi/stickers";

        HttpURLConnection httpCon = null;
        HttpsURLConnection httpsCon = null;
        BufferedReader in = null;
        DataOutputStream wr = null;

        SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
        sslContext.init(null, null,  new SecureRandom());

        //String newurl = urlstr.replaceAll(" ", "%20");
        URL url = new URL(newurl);

        //Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("vproxy3", 8080));
        byte[] postDataBytes = data.getBytes("UTF-8");

        //httpsCon = (HttpsURLConnection) url.openConnection(proxy);
        httpsCon = (HttpsURLConnection) url.openConnection();

        httpsCon.setSSLSocketFactory(sslContext.getSocketFactory());

        httpsCon.setRequestMethod("POST");
        httpsCon.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
        httpsCon.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        httpsCon.setConnectTimeout(3000);
        httpsCon.setReadTimeout(3000);
        httpsCon.setRequestProperty("Accept", "application/pdf");
        //httpsCon.setRequestProperty("Charset", "UTF-8");
        //httpsCon.setRequestProperty("Accept-Charset", "UTF-8");
        httpsCon.setDoOutput(true);
        httpsCon.getOutputStream().write(postDataBytes);

        StringBuffer response = new StringBuffer();
        String inputLine = "";
        String respCodeO = String.valueOf(httpsCon.getResponseCode());
        String SenJsonStr = data;

        in = new BufferedReader(new InputStreamReader(httpsCon.getInputStream(), "UTF-8"));
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        //Success result: {  "responseCode":"failure",  "responseMsg":"<the error message>"}
        String res = response.toString();
        String aa = "";




    }
}
