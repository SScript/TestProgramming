package com.iCross;

import java.io.*;
import java.nio.charset.Charset;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.URL;
import java.net.URLEncoder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

public class ChangesinNotification1070_xml {

    protected static JSONObject obj;

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/iCross/ChangesinNotification1070_xml_in.xml");
        String jsonDataStr = IOUtils.toString(fis, "UTF-8");

        StringBuilder sb = new StringBuilder();

        JSONObject jsonData = XML.toJSONObject(jsonDataStr.replaceAll("tem:", "").replaceAll("ns0:", ""));

        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/iCross/ChangesinNotification1070_xml_res.json"),
            jsonData.toString(), Charset.forName("UTF-8"));
        
        JSONArray objarr = null;
        try {
                Object itemObj = jsonData.getJSONObject("TemporaryObjectList").get("Object");
                if (itemObj instanceof JSONArray) {
                    objarr = (JSONArray) itemObj;
                }
                if (itemObj instanceof JSONObject) {

                    objarr = new JSONArray();
                    objarr.put(itemObj);
                }
            } catch (Exception e) {
                objarr = null;
            }
        JSONObject objdata = null;
        
        
        
        objdata = objarr.getJSONObject(0);
        System.out.println(objdata.toString());
        
        String serviceNumber = objdata.getString("ServiceID");
        System.out.println(serviceNumber);
        
        System.out.println(String.valueOf(sb.toString()));
        
    }


    private static String GetJsonObjectStringValue(JSONObject obj, String field) {
        String valToXml = "";
        Object objvalue = null;
        try {
            objvalue = obj.get(field);
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
        } catch (Exception e) {
            valToXml = "";
        }

        return valToXml;
    }


    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().isEmpty())) {
            return true;
        }
        return false;
    }

    private static boolean isNull(Object obj) {
        if (null == obj) {
            return true;
        }
        return false;
    }

}
