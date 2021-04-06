package com.Siebel;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class AsseTetailsFromSiebel {

    protected static JSONObject data;

    public static void main(String[] args) throws Exception {

        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/Siebel/SiebelData1.json");
        String longJsonString = IOUtils.toString(fis, "UTF-8");
        data = new JSONObject(longJsonString);

        String res = FormatOutPutXML(data.toString());

        System.out.println(res);
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/Siebel/resSiebelResp1.xml"),
                res, Charset.forName("UTF-8"));

    }

    private static String FormatOutPutXML(String response) {
        StringBuilder sb = new StringBuilder();
        JSONObject data = new JSONObject(response);
        sb.append("<root>");
        
        JSONObject data1 = data.getJSONObject("SiebelMessage").getJSONObject("LTKAssetDT");

        // dati no pirmā līmeņa
        sb.append(getLTKAssetDTBlockInfo(data1));

        JSONArray objarr = null;
        try {
            Object itemObj = data1.get("LTKAssetDT");
            if (itemObj instanceof JSONArray) {
                objarr = (JSONArray) itemObj;
            }
            if (itemObj instanceof JSONObject) {

                objarr = new JSONArray();
                objarr.put(itemObj);
            }
            sb.append(getLTKAssetDTBlockFullInfo(objarr));
        } catch (Exception e) {
            objarr = null;
        }
        sb.append("</root>");

        return sb.toString();
    }

    private static String getLTKAssetDTBlockFullInfo(JSONArray objarr) {
        JSONObject itematrrdata = null;
        JSONObject itemdata = null;

        StringBuilder sb = new StringBuilder();

        int itemcount = objarr.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = objarr.getJSONObject(i);
            sb.append(getLTKAssetDTBlockInfo(itemdata));

            // skatamies rekursīvi vai ir papildus LTKAssetDT
            JSONArray objarr1 = null;
            try {
                Object itemObj = itemdata.get("LTKAssetDT");
                if (itemObj instanceof JSONArray) {
                    objarr1 = (JSONArray) itemObj;
                }
                if (itemObj instanceof JSONObject) {

                    objarr1 = new JSONArray();
                    objarr1.put(itemObj);
                }
                sb.append(getLTKAssetDTBlockFullInfo(objarr1));
            } catch (Exception e) {
                objarr1 = null;
            }
        }

        return sb.toString();
    }

    private static String getLTKAssetDTBlockInfo(JSONObject itemdata) {
        JSONObject itematrrdata = null;
        StringBuilder sb = new StringBuilder();

        sb.append("<Assets>");

        sb.append("<StartDate>");
        sb.append(GetJsonObjectStringValue(itemdata, "StartDate"));
        sb.append("</StartDate>");
        sb.append("<ServiceNumber>");
        sb.append(GetJsonObjectStringValue(itemdata, "SerialNumber"));
        sb.append("</ServiceNumber>");
        sb.append("<ProductName>");
        sb.append(GetJsonObjectStringValue(itemdata, "ProductName"));
        sb.append("</ProductName>");

        //LTKAssetXADT
        JSONArray objatrr = null;
        try {
            Object itemObj = itemdata.get("LTKAssetXADT");
            if (itemObj instanceof JSONArray) {
                objatrr = (JSONArray) itemObj;
            }
            if (itemObj instanceof JSONObject) {
                objatrr = new JSONArray();
                objatrr.put(itemObj);
            }
        } catch (Exception e) {
            objatrr = null;
        }

        if (objatrr != null) {
            int itemattrcount = objatrr.length();
            StringBuilder sba = new StringBuilder();
            for (int j = 0; j < itemattrcount; j++) {
                itematrrdata = objatrr.getJSONObject(j);
                sba.append(GetJsonObjectStringValue(itematrrdata, "Name"));
                sba.append(" - ");
                sba.append(GetJsonObjectStringValue(itematrrdata, "Value"));
                sba.append("; ");
            }

            sb.append("<Attributes>");
            sb.append(sba.substring(0, sba.length() - 2));
            sb.append("</Attributes>");
        } else {
            sb.append("<Attributes></Attributes>");
        }
        sb.append("</Assets>");

        return sb.toString();
    }

    private static String GetJsonObjectStringValue(JSONObject data, String objname) {
        String valToXml = "";
        try {
            Object objvalue = data.get(objname);
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
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }

}
