package com.teststuffs.teststuffs.testjson;

import org.json.*;

public class testjsonarr {
    public static void main(String[] args) throws Exception {

        String d = "{\"result\":{\"My-ID-792376\":true}}";
        JSONObject obj = new JSONObject(d);
        JSONObject o1 = obj.getJSONObject("result");
        Object o = o1.get("My-ID-792376");
        if (o instanceof String) {
            if ("True".equalsIgnoreCase((String)o)) {
                System.out.println(o);
            }
        }





    }

    public static String GetJsonAtrrObjectStringValue(JSONObject obj, String objName) {
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

    public static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
