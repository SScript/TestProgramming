package com.BillingTrigger;

import org.json.JSONObject;

/**
 * SOAIP-1978 - viss pārtaisīts pa jaunam
 */
<<<<<<< HEAD:TestStuffs/src/main/java/com/BillingTrigger/BillingTriggerProcess.java
public class BillingTriggerProcess {
=======
public class ProcessBillingTrigger {
>>>>>>> 0d36bc622f6e8b9e7e66b40d56e3b97df6df411a:TestStuffs/src/main/java/com/BillingTrigger/ProcessBillingTrigger.java

    public Resp ProcessJsonData(String jsonDataStr, String excludeStrs, String containsOrEquals) throws Exception {
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

        //orderedService = "telco";
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
                ProcessSplitPayment ps = new ProcessSplitPayment(jsonDataStr, excludeStrs, containsOrEquals);
                result = ps.ProcessForSplitPayment();
                break;
        }
        return result;
    }

}
