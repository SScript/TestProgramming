package com.teststuffs.teststuffs.testjson;

import org.json.JSONObject;
import org.json.JSONArray;

public class CreateVlocityJson_1 {
    public static void main(String[] args) throws Exception { 
        /** 
         
         {  "OrderId": "8023N000002BrbYYY",  
         * "OrderNumber": "12345",  
         * "OrderItems": [    
         * {      
         * "OrderItemID": "8023N000002Brb1QAC",     
         * "ServiceNumber": "DLMS63443672",      
         * "BillAccountNumber": "5425552",      
         * "BillActivationDate": "2020-07-21",       
         * "Status": "Billing Activated",      
         * "Description": ""    }  ]}
         
         
         **/
        JSONObject jsonData = new JSONObject();
        jsonData.put("OrderId", "8023N000002BrbYYY").put("OrderNumber", "12345");
        JSONArray orderItems = new JSONArray();
        orderItems.put(
                new JSONObject()
                        .put("OrderItemID", "8023N000002Brb1QAC")
                        .put("ServiceNumber", "DLMS63443672")
                        .put("BillAccountNumber", "5425552")
                        .put("BillActivationDate", "2020-07-21")
                        .put("Status", "Billing Activated")
                        .put("Description", "")
        );
        orderItems.put(
                new JSONObject()
                        .put("OrderItemID", "8023N000002Brb1QAC!!!!!")
                        .put("ServiceNumber", "DLMS63443672")
                        .put("BillAccountNumber", "5425552")
                        .put("BillActivationDate", "2020-07-21")
                        .put("Status", "Billing Activated")
                        .put("Description", "")
        );
        jsonData.put("OrderItems", orderItems);
        
        System.out.println(jsonData.toString());
        
        //String vlocityRes = "{\"resultCode\": \"1\",\"resultText\": \"OK\"}";
        //JSONObject res = new JSONObject(vlocityRes);
        //System.out.println(res.getString("resultCode"));
        //System.out.println(res.getString("resultText"));
    }
}
