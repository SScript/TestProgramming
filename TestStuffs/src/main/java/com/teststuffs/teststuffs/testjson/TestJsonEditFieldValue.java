package com.teststuffs.teststuffs.testjson;

import org.json.JSONObject;

public class TestJsonEditFieldValue {

    public static void main(String[] args) {
        String jsonData = "{\"ErrorCode\":\"aaa\",\"orderno\":\"00249408\"}";

        JSONObject obj = new JSONObject(jsonData);
        System.out.println(obj.toString());
        obj.put("ErrorCode", "Sammie");
        System.out.println(obj.toString());

    }
}
