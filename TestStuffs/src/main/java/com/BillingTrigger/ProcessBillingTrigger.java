package com.BillingTrigger;

import org.json.JSONObject;

/**
 * SOAIP-1978 - viss pārtaisīts pa jaunam
 */
public class ProcessBillingTrigger {
    public Resp ProcessJsonData(String jsonDataStr, String excludeStrs, String containsOrEquals) throws Exception {
        Resp result = new Resp();
        JSONObject orderdatafull;
        JSONObject orderdata;

        orderdatafull = new JSONObject(jsonDataStr);
        // skatamies vai vaig pa jaunam -> ja wave = 3; savādāk pa vecam
        int wave = 2;
        try {
            wave = orderdatafull.getInt("Wave");
        } catch (Exception e) {
            wave = 2;
        }


        // pa jaunam
        if (wave == 3) {

        } else {
            // pavecam

        }


        try {
            orderdata = orderdatafull.getJSONObject("Order");
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
                result = pe.ProcessForElectricity();
                break;
            default:// Split payment
                ProcessSplitPayment ps = new ProcessSplitPayment(jsonDataStr, excludeStrs, containsOrEquals);
                result = ps.ProcessForSplitPayment();
                break;
        }
        return result;
    }

}
