package com.teststuffs.teststuffs.testjson;

import org.json.JSONObject;

public class TestIsNull {

    public static void main(String[] args) throws Exception {
        String s = "{\n" +
                "    \"totalSize\": 1,\n" +
                "    \"done\": true,\n" +
                "    \"records\": [\n" +
                "        {\n" +
                "            \"attributes\": {\n" +
                "                \"type\": \"Order\",\n" +
                "                \"url\": \"/services/data/v52.0/sobjects/Order/80168000001Y7ZrAAK\"\n" +
                "            },\n" +
                "            \"Id\": \"80168000001Y7ZrAAK\",\n" +
                "            \"vlocity_cmt__OrchestrationPlanId__c\": \"a3068000000CZGhAAO\"\n" +
                "        }\n" +
                "    ]\n" +
                "}";

        JSONObject obj = new JSONObject(s);
        System.out.println(!obj.isNull("vlocity_cmt__OrchestrationPlanId__c"));

        System.out.println(!obj.isNull("records"));


    }
}


