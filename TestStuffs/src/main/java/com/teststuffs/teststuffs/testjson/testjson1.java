package com.teststuffs.teststuffs.testjson;

import org.json.JSONArray;
import org.json.JSONObject;

public class testjson1 {

    public static void main(String[] args) {
        JSONObject jsonData = new JSONObject("{\n"
                + "    \"Result\": \"Success\",\n"
                + "    \"Resultcode\": 1\n"
                + "}");

        JSONArray jsonData1 = new JSONArray("[\n"
                + "    {\n"
                + "        \"message\": \"Session expired or invalid\",\n"
                + "        \"errorCode\": \"INVALID_SESSION_ID\"\n"
                + "    }\n"
                + "]");
        JSONObject o1 = (JSONObject)jsonData1.get(0);
        String r2 = GetJsonAtrrObjectStringValue(o1.get("message"));
        String r3 = GetJsonAtrrObjectStringValue(o1.get("errorCode"));
        
        String r1 = GetJsonAtrrObjectStringValue(jsonData.get("Resultcode"));

        System.out.println(r1);
        System.out.println(r2);
        System.out.println(r3);
    }

    private static String GetJsonAtrrObjectStringValue(Object objvalue) {
        String valToXml = "";
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

        return valToXml;
    }
}
