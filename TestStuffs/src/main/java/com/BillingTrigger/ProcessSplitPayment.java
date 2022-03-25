package com.BillingTrigger;

import org.json.JSONObject;

public class ProcessSplitPayment extends JSonDataFunctions {

    public Resp ProcessForSplitPayment(JSONObject data) throws Exception {
        Resp result = new Resp();
        JSONObject jsonData = new JSONObject();

        jsonData
                .put("orderid", GetDefaultValue(data, "OrderId", true));

        return result;
    }
}
