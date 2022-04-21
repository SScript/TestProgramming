package com.BillingTrigger;

import org.json.JSONArray;
import org.json.JSONObject;

public class JSonDataFunctions extends JSonDataFunctionsBase {

    public JSonDataFunctions(String inFullData) throws Exception {
        super(inFullData);
        // ielasa kopējos datus
        ProcessDefaultData();
        ProcessDefaultAtrributeData();
    }

    public void ProcessDefaultData() throws Exception {
        JSONObject fullData = getOrderDataFull();
        JSONObject orderData = getOrderData();
        addFieldToOutDataData("orderid", GetJsonObjectStringValue(orderData, "OrderId", true));
        addFieldToOutDataData("orderno", GetJsonObjectStringValue(orderData, "OrderNumber", true));
        addFieldToOutDataData("orderdate", FormatDate(GetJsonObjectStringValue(orderData, "OrderDate", true)));
        addFieldToOutDataData("ordernotes", GetJsonObjectStringValue(orderData, "Notes", false));
        addFieldToOutDataData("caller", GetJsonObjectStringValue(fullData, "Requester", true));


    }

    public void ProcessDefaultAtrributeData() throws Exception {
        JSONObject orderData = getOrderData();

        addFieldToOutDetailsDataData("Split payment", "ORD_ORDEREDSERVICE");
    }

    public String GetDefaultValue(Object data, String fieldName, boolean mandatory) throws Exception {
        String result = "";
        //ņem lauku uzreiz no objekta
        if (data instanceof JSONObject) {
            return GetJsonObjectStringValue((JSONObject)data, fieldName, mandatory);
        }

        // jāskatās iekš orderitemiem
        if (data instanceof JSONArray) {

        }
        return result;
    }

}
