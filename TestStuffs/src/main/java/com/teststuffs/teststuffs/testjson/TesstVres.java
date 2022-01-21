package com.teststuffs.teststuffs.testjson;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;

import java.io.FileInputStream;

public class TesstVres {

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/teststuffs/teststuffs/testjson/vres.json");
        String longJsonString = IOUtils.toString(fis, "UTF-8");

        JSONObject data = new JSONObject(longJsonString);
        JSONObject objres = data.getJSONObject("response");
        String a = GetJsonAtrrObjectStringValue(objres.get("response"));


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
