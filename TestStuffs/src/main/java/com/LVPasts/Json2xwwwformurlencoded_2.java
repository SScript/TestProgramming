package com.LVPasts;

import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.nio.charset.Charset;

public class Json2xwwwformurlencoded_2 {

    public static void main(String[] args) throws Exception {

        JSONObject obj = new JSONObject();
        JSONArray parcels = new JSONArray();
        JSONObject data = new JSONObject();

        data.put("when", "aaa")
                .put("time_from", "aaa")
                .put("time_to", "aaa")
                .put("phone", "aaa")
                .put("email", "aaa")
                .put("address", "aaa")
                .put("pallet_count", "aaa")
                .put("parcel_count", "aaa")
                .put("transport", "aaa")
                .put("comments", "aaa");

        data.put("ooooooo", "ooooo");

        obj.put("secret", "secret");
        obj.put("parcels", parcels.put(data));

        System.out.println(obj.toString());
        System.out.println(jsonToURLEncoding(obj));
        String filename = "2.json";
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/LVPasts/Res_" + filename),
                obj.toString(), Charset.forName("UTF-8"));

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
