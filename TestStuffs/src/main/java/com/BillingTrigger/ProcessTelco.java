package com.BillingTrigger;

public class ProcessTelco extends JSonDataFunctions {

    public ProcessTelco(String inFullData) throws Exception {
        super(inFullData);
        ProcessForTelco();
    }

    public Resp ProcessForTelco() throws Exception {
        Resp result = new Resp();


        String s = GetOrderItemFieldLevel3(
                "Telco", "Telco",
                "Offer",
                "OrderedServiceType",
                false);
        addFieldToOutDetailsDataData(s, "ORD_ORDEREDSERVICETYPE");


        result.SendJsonStr = getFullOutJsonData().toString();
        return result;
    }
}
