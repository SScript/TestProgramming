package com.teststuffs.teststuffs.testjson;

import org.json.*;

import java.util.HashMap;

public class TestPastsStickerAns {

    public static void main(String[] args) throws Exception {
        JSONArray o =  new JSONArray("[{\"event\":\"TNLO1\",\"date\":\"2021-12-16 13:28:18\"},{\"event\":\"TN060\",\"date\":\"2021-12-16 13:29:03\"}]");
        int itemcount = o.length();
        HashMap<String, String> mapValues = new HashMap<>();
        mapValues.put("TNLO1", "En route");
        JSONObject obj = null;

        if (itemcount == 1) {
            obj = o.getJSONObject(0);
            System.out.println(obj.get("event"));
        } else {
            String val = "";
            String val1 = "";
            for (int i = 0; i < itemcount; i++) {
                obj = o.getJSONObject(i);
                val = GetJsonAtrrObjectStringValue(obj.get("event"));
                val1 = mapValues.get(val);
                if (
                        "En route".equalsIgnoreCase(val1) ||
                                "Pickup".equalsIgnoreCase(val1) ||
                                "Return to Sender".equalsIgnoreCase(val1)
                ) {
                    System.out.println("Not Delivered. Nepilnīgs sūtījums");
                }
            }

        }

    }

    public static String GetJsonAtrrObjectStringValue(Object objvalue) {
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
