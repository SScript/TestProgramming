package com.BillingTrigger;

import org.json.JSONObject;

public class ProcessTelco extends JSonDataFunctions {

    public ProcessTelco(String inFullData) throws Exception {
        super(inFullData);
        ProcessForTelco();
    }

    public Resp ProcessForTelco() {
        Resp result = new Resp();




        result.SendJsonStr = getFullOutJsonData().toString();

        return result;
    }
}
