package com.teststuffs.teststuffs.testjson;

import org.json.JSONArray;
import org.json.JSONObject;

public class testjson {
    public static void main(String[] args) {
        JSONObject jsonData = new JSONObject();
        //jsonData.put("aaa", new JSONObject().put("bb", "value1").put("c\"c", "value2"));
        //JSONArray aa = new JSONArray();
        //JSONArray clients = new JSONArray();
        //clients.put(new JSONObject().put("vards", "v1"));
        //clients.put(new JSONObject().put("vards", "v2"));
        //jsonData.put("Clients", clients);
        jsonData.put("Id", "a1").put("resultCode", "code").put("resultMsg", "");
        System.out.println(jsonData.toString());
        
        
        
        String a = 
                "{  \"Id\" : \"8013O000000YJ1kQAG\",  \"resultCode\" : \"SOA_154[001]\",  \"resultText\" : \"ESP service returned error: 1. Darījuma \\\"ESP/ListOfOrder/v1-0\\\" apstrādes laikā tika konstatētas kļūdas! Darījums netika iesūtīts. (The 'source' element is invalid - The value '' is invalid according to its datatype 'RequiredLength30Type' - The actual length is less than the MinLength value. The actual length is less than the MinLength value.)\"}";
        JSONObject jsonData1 = new JSONObject(a);
        //System.out.println(jsonData1.toString());
        
    }
}
