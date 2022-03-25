package com.LVPasts;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStreamReader;
import java.io.DataOutputStream;

import java.io.FileOutputStream;
import java.io.InputStream;

import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;

import java.nio.charset.StandardCharsets;

import java.security.SecureRandom;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.util.Base64;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;

import org.json.JSONArray;
import org.json.JSONObject;

public class CallLVPasts {

    public static void main(String[] args) throws Exception {
        String ep = "https://127.0.0.1:4433/postOfficeApi";
        String secret = "";
        String lpdata = "";

        Resp result = new Resp();
        String newurl = ep.replaceAll(" ", "%20");
        try {
            if (isEmptyOrNull(lpdata)) {
                result = ProcessLPRest_1(newurl, 3000, 30000, "");
            } else {
                result = ProcessLPRest_1(newurl, 3000, 3000, FormatLPRestStr_stickers(secret, lpdata));
            }
            result.respCode = "1";
            result.respMsg = "OK";
            //result.respPdf = new String(Base64.getEncoder().encode(result.ResponseStr.getBytes()));

        } catch (Exception e) {
            System.out.println(e.getMessage());
            result.respCode = "SOA_203[001]";
            result.respMsg = e.getMessage();
        }

    }
    public static Resp ProcessLPRest_1(String urlstr, int connTimeout, int readTimeout, String data) throws Exception {

        HttpURLConnection httpCon = null;
        HttpsURLConnection httpsCon = null;
        BufferedReader in = null;
        DataOutputStream wr = null;
        Resp result = new Resp();

        SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
        sslContext.init(null, null,  new SecureRandom());

        String newurl = urlstr.replaceAll(" ", "%20");
        URL url = new URL(newurl);

        //Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("vproxy3", 8080));


        //httpsCon = (HttpsURLConnection) url.openConnection(proxy);
        httpsCon = (HttpsURLConnection) url.openConnection();
        httpsCon.setSSLSocketFactory(sslContext.getSocketFactory());

        httpsCon.setRequestMethod("POST");

        byte[] postDataBytes = null;
        if (!isEmptyOrNull(data)) {
            httpsCon.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
            postDataBytes = data.getBytes("UTF-8");
            httpsCon.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        } else {
            httpsCon.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        }
        httpsCon.setConnectTimeout(connTimeout);
        httpsCon.setReadTimeout(readTimeout);

        httpsCon.setRequestProperty("Accept", "application/pdf");
        httpsCon.setHostnameVerifier(new HostnameVerifier() {
            @Override
            public boolean verify(String hostname, SSLSession sslSession) {
                return true;
            }
        });
        //httpsCon.setRequestProperty("Charset", "UTF-8");
        //httpsCon.setRequestProperty("Accept-Charset", "UTF-8");
        httpsCon.setDoOutput(true);
        if (!isEmptyOrNull(data)) {
            httpsCon.getOutputStream().write(postDataBytes);
        }

        StringBuffer response = new StringBuffer();
        String inputLine = "";
        result.respCodeO = String.valueOf(httpsCon.getResponseCode());
        result.SenJsonStr = data;

        if (httpsCon.getResponseCode() != 200) {

            in = new BufferedReader(new InputStreamReader(httpsCon.getErrorStream()));
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            result.respCode = "UNICORN SOA_203[001] " + String.valueOf(httpsCon.getResponseCode());
            result.respMsg = response.toString();
            try {
                JSONObject o1 = new JSONObject(response.toString());
                //JSONObject o1 = (JSONObject) obj.get(0);
                String r2 = GetJsonAtrrObjectStringValue(o1, "responseCode");
                String r3 = GetJsonAtrrObjectStringValue(o1, "responseMsg");
                result.ResponseStr = response.toString();
                result.respCode = "SOA_203[001]";
                result.respMsg = r3 + " : " + r2;
            } catch (Exception e) {
                result.respMsg = "Global Error: " + e.getMessage() + " : " + response.toString();
            }
        } else {
            if (urlstr.contains("stickers")) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                InputStream is = null;
                is = httpsCon.getInputStream();
                byte[] byteChunk = new byte[4096]; // Or whatever size you want to read in at a time.
                int n;
                while ((n = is.read(byteChunk)) > 0) {
                    baos.write(byteChunk, 0, n);
                }
                //baos.writeTo(new FileOutputStream("yes1.pdf"));  // šeit ieglabāju pa tiešo failā - pdf atveras
                byte[] ss = baos.toByteArray();
                baos.close();
                result.ResponseStr = ss.toString();
                System.out.println(result.ResponseStr);
                result.respPdf = new String(Base64.getEncoder().encode(ss));
                //byte[] ss = response.toString().getBytes(StandardCharsets.UTF_8);
            } else {
                in = new BufferedReader(new InputStreamReader(httpsCon.getInputStream(), "UTF-8"));
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                result.ResponseStr = response.toString();
                System.out.println(result.ResponseStr);
            }
            try {
                JSONObject res = new JSONObject(response.toString());
                if (result.ResponseStr.contains("error")) {
                    // ResponseStr: {"error":"Unknown user"}
                    result.respCode = "SOA_142[015]";
                    result.respMsg = "Kļūda no Latvijas Pasts: " + res.getString("error");
                }
            } catch (Exception e1) {
                result.respCode = "SOA_142[015]";
                result.respMsg = "Can not read return message 1";
            }

        }
        return result;
    }
    private static String FormatLPRestStr_stickers(String secret, String data) throws Exception {
        JSONObject d = new JSONObject();
        JSONArray o = new JSONArray(data);
        d.put("secret", secret).put("size", "150x100").put("parcels", o);

        return jsonToURLEncoding(d);
    }

    public static String jsonToURLEncoding(JSONObject json) {
        String output = "";
        String[] keys = JSONObject.getNames(json);
        for (String currKey : keys)
            output += jsonToURLEncodingAux(json.get(currKey), currKey);

        return output.substring(0, output.length()-1);
    }

    private static String jsonToURLEncodingAux(Object json, String prefix) {
        String output = "";
        if (json instanceof JSONObject) {
            JSONObject obj = (JSONObject)json;
            String[] keys = JSONObject.getNames(obj);
            for (String currKey : keys) {
                String subPrefix = prefix + "[" + currKey + "]";
                output += jsonToURLEncodingAux(obj.get(currKey), subPrefix);
            }
        } else if (json instanceof JSONArray) {
            JSONArray jsonArr = (JSONArray) json;
            int arrLen = jsonArr.length();

            for (int i = 0; i < arrLen; i++) {
                String subPrefix = prefix + "[" + i + "]";
                Object child = jsonArr.get(i);
                output += jsonToURLEncodingAux(child, subPrefix);
            }
        } else {
            output = prefix + "=" + json.toString() + "&";
        }

        return output;
    }

    public static String formatDate(String dateVal) throws Exception {
        if (!isEmptyOrNull(dateVal)) {
            try {
                String dd11 = dateVal.substring(8, 10);
                String mm11 = dateVal.substring(5, 7);
                String yy11 = dateVal.substring(0, 4);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                LocalDate dateTime = LocalDate.parse(dd11 + "/" + mm11 + "/" + yy11, formatter);
                return yy11 + "-" + mm11 + "-" + dd11;
            } catch (Exception e) {
                throw new Exception("Incorect date format");
            }
        } else {
            return "";
        }
    }

    private static String GetJsonAtrrObjectStringValue(JSONObject obj, String objName) {
        String valToXml = "";
        Object objvalue = null;
        try {
            objvalue = obj.get(objName);
            if (objvalue instanceof Boolean) {
                Boolean boolToUse = ((Boolean) objvalue).booleanValue();
                valToXml = boolToUse.toString();
            } else if (objvalue instanceof Integer || objvalue instanceof Long) {
                long intToUse = ((Number) objvalue).longValue();
                valToXml = String.valueOf(intToUse);
            } else if (objvalue instanceof Float || objvalue instanceof Double) {
                double floatToUse = ((Number) objvalue).doubleValue();
                valToXml = String.valueOf(floatToUse);
            } else if (JSONObject.NULL.equals(objvalue)) {
                valToXml = "";
            } else {
                valToXml = ((String) objvalue).toString();
            }
        } catch (Exception e) {valToXml = "";}

        return valToXml;
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }

}
