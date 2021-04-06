package com;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class VlocityTo1C {

    protected static JSONObject data;
    protected static JSONObject datalevel;
    protected static JSONArray productitems;
    protected static JSONObject productdata;
    protected static JSONObject itemattrdata;
    protected static JSONObject jsonData = new JSONObject();
    protected static JSONArray productItems = new JSONArray();

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/VlocityTo1C.json");
        String longJsonString = IOUtils.toString(fis, "UTF-8");
        data = new JSONObject(longJsonString);
        datalevel = data.getJSONObject("SendActionRequest");
        
        jsonData.put("OrderNumber", GetJsonObjectStringValue(datalevel.get("OrderNumber")));
        jsonData.put("OrderId", GetJsonObjectStringValue(datalevel.get("OrderId")));
        jsonData.put("Action", GetJsonObjectStringValue(datalevel.get("Action")));
        
        try {
            // ja ir masīvs
            productitems = datalevel.getJSONArray("Products");
            for (int i = 0; i<productitems.length(); i++) {
                productdata = productitems.getJSONObject(i);
                productItems.put(
                    new JSONObject()
                            .put("OrderItemID", GetJsonObjectStringValue(productdata.get("OrderItemID")))
                            .put("ProductID", GetJsonObjectStringValue(productdata.get("ProductID")))
                            .put("Quantity", GetJsonObjectStringValue(productdata.get("Quantity")))
            );
            }
        } catch (Exception e) {
            // mēģinam vienu objektu
            productdata = datalevel.getJSONObject("Products");
            productItems.put(
                    new JSONObject()
                            .put("OrderItemID", GetJsonObjectStringValue(productdata.get("OrderItemID")))
                            .put("ProductID", GetJsonObjectStringValue(productdata.get("ProductID")))
                            .put("Quantity", GetJsonObjectStringValue(productdata.get("Quantity")))
            );
        }

        jsonData.put("Products", productItems);

        System.out.println(jsonData.toString());
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/VlocityTo1CRes.json"),
                jsonData.toString(), Charset.forName("UTF-8"));
    }

 
    private static String GetJsonObjectStringValue(Object objvalue) {
        String valToXml = "";
        try {
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
