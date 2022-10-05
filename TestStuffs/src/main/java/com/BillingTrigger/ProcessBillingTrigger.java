package com.BillingTrigger;

import org.json.JSONObject;


public class ProcessBillingTrigger {
    public Resp ProcessJsonData(String jsonDataStr, String excludeStrs, String containsOrEquals, String caller) throws Exception {
        Resp result = new Resp();
        Resp resultOld = new Resp();
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

        String orderedService = "Split payment";
        try {
            orderedService = orderdata.getString("OrderedService");
            result.OrderedServiceOrigin = orderedService;
        } catch (Exception e) {
            orderedService = "Split payment";
            result.OrderedServiceOrigin = "";
        }

        //orderedService = "telco";
        BillingTrigger4 b4 = new BillingTrigger4();
        String env = "LOCAL";
        System.out.println("orderedService: " + orderedService);
        switch (orderedService.toUpperCase()) {
            case "TELCO":
                ProcessTelco pt = new ProcessTelco(jsonDataStr, env);
                result = pt.ProcessForTelco();
                System.out.println("--> SendJsonStr1: " + result.SendJsonStr1);
                System.out.println("--> SendJsonStr2: " + result.SendJsonStr2);
                System.out.println("--> SendJsonStr3: " + result.SendJsonStr3);
                System.out.println("--> SendJsonStr4: " + result.SendJsonStr4);
                break;
            case "ELECTRICITY":
                // jaunais
                System.out.println("Pa jaunam:");
                ProcessElectricity pe = new ProcessElectricity(jsonDataStr, env);
                result = pe.ProcessForElectricity();
                System.out.println("--> SendJsonStr: " + result.SendJsonStr);

                // pa vecam
                System.out.println("Pa vecam:");
                resultOld = b4.ProcessJsonData(orderdata.toString());
                System.out.println("--> SendJsonStr: " + resultOld.SendJsonStr);
                break;
            default:// Split payment
                // jaunais
                ProcessSplitPayment ps = new ProcessSplitPayment(jsonDataStr, excludeStrs, containsOrEquals, env);
                result = ps.ProcessForSplitPayment();
                System.out.println("--> SendJsonStr: " + result.SendJsonStr);

                // pa vecam
                resultOld = b4.ProcessJsonData(orderdata.toString());
                System.out.println("--> SendJsonStr: " + resultOld.SendJsonStr);
                break;
        }
        return result;
    }

}
