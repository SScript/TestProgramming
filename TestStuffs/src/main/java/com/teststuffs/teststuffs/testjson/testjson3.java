package com.teststuffs.teststuffs.testjson;

import org.json.JSONArray;
import org.json.JSONObject;

public class testjson3 {

    public static void main(String[] args) {
        JSONObject jsonData = new JSONObject("{\n"
                + "    \"Result\": \"\",\n"
                + "    \"Resultcode\": null"
                + "}");
        String aaa = jsonData.toString();
        aaa = aaa.replace("\"\"", "\"EMPTY_STRING\"").replace("null", "\"VALUE_NULL\"");
        System.out.println(aaa);
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
