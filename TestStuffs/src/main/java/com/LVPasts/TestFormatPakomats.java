package com.LVPasts;

import org.json.*;

public class TestFormatPakomats {

    public static void main(String[] args) throws Exception {
        JSONObject obj = new JSONObject();
        JSONObject applications = new JSONObject();
/*
        applications.put("My-ID-792376",
                new JSONObject().put("when", GetJsonAtrrObjectStringValue(data.get("when")))
                        .put("time_from", GetJsonAtrrObjectStringValue(data.get("time_from")))
                        .put("time_to", GetJsonAtrrObjectStringValue(data.get("time_to")))
                        .put("phone", GetJsonAtrrObjectStringValue(data.get("phone")))
                        .put("email", GetJsonAtrrObjectStringValue(data.get("email")))
                        .put("address", GetJsonAtrrObjectStringValue(data.get("country_id")))
                        .put("pallet_count", GetJsonAtrrObjectStringValue(data.get("country_id")))
                        .put("parcel_count", GetJsonAtrrObjectStringValue(data.get("country_id")))
                        .put("transport", GetJsonAtrrObjectStringValue(data.get("country_id")))
                        .put("comments", GetJsonAtrrObjectStringValue(data.get("station_id"))))
        ;

        obj.put("secret", GetJsonAtrrObjectStringValue(data.get("secret")));
        obj.put("applications", applications);


*/
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
}
