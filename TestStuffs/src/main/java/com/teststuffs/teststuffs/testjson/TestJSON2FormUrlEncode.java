package com.teststuffs.teststuffs.testjson;

import org.json.JSONObject;
import java.util.*;


public class TestJSON2FormUrlEncode {
    public static void main(String[] args) throws Exception {
        String json = "{\n" +
                " \"secret\":\"SECRET-KEY\",\n" +
                " \"applications\":{\n" +
                "    \"My-ID-792376\":{\n" +
                "        \"when\": \"2019-11-29\",\n" +
                "        \"time_from\": \"13:08\",\n" +
                "        \"time_to\": \"18:00\",\n" +
                "        \"phone\": \"22222222\",\n" +
                "        \"email\": \"abc@pasts.lv\",\n" +
                "        \"address\": \"Ziemeļu iela 10, Lidosta\",\n" +
                "        \"pallet_count\": \"0\",\n" +
                "        \"parcel_count\": \"0\",\n" +
                "        \"transport\": \"Vieglais kravas buss\",\n" +
                "        \"comments\": \"Komentāri\"\n" +
                "        }\n" +
                "    }\n" +
                "}";

        String res = convertJson(new JSONObject(json));

        System.out.println(res);

    }


    public static String convertJson(JSONObject data) {
        Map<String,String> arguments = new HashMap<>();

        String[] fieldnames = JSONObject.getNames(data);
        for (int i = 0; i < data.length(); i++) {
            System.out.println(i);
            if (data.optJSONObject(fieldnames[i]) == null) { // single element
                System.out.println("single");
            } else {
                // ir objekts
                System.out.println("not single");


            }
        }
        return "";
    }
}
