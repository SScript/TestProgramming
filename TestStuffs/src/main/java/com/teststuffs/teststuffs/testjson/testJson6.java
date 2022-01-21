package com.teststuffs.teststuffs.testjson;

import org.json.JSONArray;
import org.json.JSONObject;

public class testJson6 {
    public static void main(String[] args) {
        String data = "[\"CE701362760LV\", \"CE701362760LV\"]";
        JSONObject d = new JSONObject();
        JSONArray o = new JSONArray(data);
        d.put("secret", "secret").put("size", "150x100").put("parcels", o);
        System.out.println(d.toString());

        JSONObject obj = new JSONObject();
        JSONArray data1 = new JSONArray();
        data1.put("event").put("date").put("location").put("next_office");
        obj.put("secret", "secretkey").put("id", "CE100005322LV").put("fields", data1);
        System.out.println(obj.toString());
    }
}
