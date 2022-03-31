package com.BillingTrigger;

import org.json.JSONObject;

import java.lang.invoke.SwitchPoint;
import java.util.Locale;

/**
 * SOAIP-1978 - viss pārtaisīts pa jaunam
 */
public class BillingTrigger5 {

    public Resp ProcessJsonData(String jsonDataStr) throws Exception {
        Resp result = new Resp();
        JSONObject orderdata_;
        JSONObject orderdata;

        orderdata_ = new JSONObject(jsonDataStr);
        try {
            orderdata = orderdata_.getJSONObject("Order");
        } catch (Exception e) {
            //throw new Exception("Field " + field + " is mandatory");
            result.RetCode = "SOA_164[005]";
            result.RetMsg = "Nav padota \"Order\" daļa.";
            return result;
        }

        String orderedService = "";
        try {
            orderedService = orderdata.getString("OrderedService");
            result.OrderedServiceOrigin = orderedService;
        } catch (Exception e) {result.OrderedServiceOrigin = "";}

        orderedService = "telco";
        switch (orderedService.toUpperCase()) {
            case "TELCO":
                ProcessTelco pt = new ProcessTelco(jsonDataStr);
                result = pt.ProcessForTelco();
                break;
            case "ELECTRICITY":
                ProcessElectricity pe = new ProcessElectricity(jsonDataStr);
                result = pe.ProcessForElectricity(orderdata);
                break;
            default:// Split payment
                ProcessSplitPayment ps = new ProcessSplitPayment(jsonDataStr);
                result = ps.ProcessForSplitPayment(orderdata);
                break;
        }
        return result;
    }

}
