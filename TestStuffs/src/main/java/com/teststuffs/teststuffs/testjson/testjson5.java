package com.teststuffs.teststuffs.testjson;

import org.json.JSONObject;

public class testjson5 {
    public static void main(String[] args) {
        JSONObject jsonData = new JSONObject();
        jsonData.put("OrderNumber", "a1").put("OrderID", "code").put("isOk", Boolean.valueOf("true"));
        System.out.println(jsonData.toString());
    }
}
