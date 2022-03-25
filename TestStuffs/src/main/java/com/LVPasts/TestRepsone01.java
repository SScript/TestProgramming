package com.LVPasts;

import org.json.JSONObject;

public class TestRepsone01 {
    public static void main(String[] args) throws Exception {
        //String res = "{\"Internal-ID-1\":{\"phone\":\"T\\u0101lru\\u0146a numuram j\\u0101b\\u016bt 2xxxxxxx form\\u0101t\\u0101\"}}";
        String res = "[{\"country_id\":\"Valsts nav pareizi nor\\u0101d\\u012bta (j\\u0101nor\\u0101da Latvija)\"}] ";
        JSONObject obj = new JSONObject(res);

        Object o = obj.get("Internal-ID-1");
        String ss = "";

        String[] fieldnames = JSONObject.getNames((JSONObject)o);
        for (int i = 0; i < ((JSONObject)o).length(); i++) {
            ss = ss + fieldnames[i] + ": " + GetJsonObjectStringValue(((JSONObject)o), fieldnames[i]) + "; ";
        }
        System.out.println(ss);
    }

    public static String GetJsonObjectStringValue(JSONObject obj, String objName) {
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
}


