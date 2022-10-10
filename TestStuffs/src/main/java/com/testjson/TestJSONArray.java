package com.testjson;
import org.json.*;

public class TestJSONArray {

    public static void main(String[] args) throws Exception {

        JSONObject newJsonData = new JSONObject();
        JSONArray arr = new JSONArray();
        JSONArray arr1 = new JSONArray();

        newJsonData.put("Requester", "requster1");
        newJsonData.put("serviceNumber", "Number1");
        newJsonData.put("projectName", "Name1");

        arr.put(newJsonData);

        newJsonData = new JSONObject();
        newJsonData.put("Requester", "requster2");
        newJsonData.put("serviceNumber", "Number2");
        newJsonData.put("projectName", "Name2");
        arr.put(newJsonData);


        arr1.put(newJsonData);

        arr.put(arr1);

        System.out.println(arr.toString());
    }

}
