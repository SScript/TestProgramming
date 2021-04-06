package com.teststuffs.teststuffs.testjson;

import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;

public class testjson4 {

    public static void main(String[] args) {
        JSONObject jsonData = new JSONObject(
                "   {\"Order\": {\n"
                + "      \"OrderItems\": [\n"
                + "         {\n"
                + "            \"RecurringCharge\": 0,\n"
                + "            \"ItemBillingAccountNumber\": \"3337373\",\n"
                + "            \"ItemBillingAddressKey\": \"103399850\",\n"
                + "            \"AccountingCode\": \"\",\n"
                + "            \"ProductType\": \"ConsumerGoods\",\n"
                + "            \"ItemServiceAddressKey\": \"0013N00000WQoeKQAT\",\n"
                + "            \"OneTimeCharge\": 144,\n"
                + "            \"RootOrderItemId\": \"8023N000002GWQbQAO\",\n"
                + "            \"OrderItemId\": \"8023N000002GWQbQAO\",\n"
                + "            \"Name\": \"Xiaomi Amazfit Pace Orange\"\n"
                + "         }\n"
                + "      ],\n"
                + "      \"BillAccountNumber\": \"3337373\",\n"
                + "      \"AccountNo\": \"13448885\",\n"
                + "      \"OrderedServiceType\": \"Installation\",\n"
                + "      \"BillActivationDate\": \"2020-10-01\",\n"
                + "      \"OrderNumber\": \"00005780\",\n"
                + "      \"DownPaymentBillNo\": \"80292833\",\n"
                + "      \"AddressKey\": \"103399850\",\n"
                + "      \"OrderId\": \"8013N000001QT7fQAG\",\n"
                + "      \"PaymentMode\": \"Split Payment\",\n"
                + "      \"OrderDate\": \"2020-10-01T10:07:33.000Z\"\n"
                + "   },\n"
                + "   \"Requester\": \"VLOCITY\",\n"
                + "   \"ApiKey\": \"5aWA7LX8fPfMqarm\"\n"
                + "}");
        JSONObject itemdata = null;
        JSONArray datar = null;

        JSONObject a1 = jsonData.getJSONObject("Order");
        Object a = a1.get("OrderItems");

        if (a instanceof JSONArray) {
            datar = (JSONArray) a;
        }
        if (a instanceof JSONObject) {
            datar = new JSONArray();
            datar.put(a);
        }

        int itemcount = datar.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = datar.getJSONObject(i);
            Iterator<String> keys = itemdata.keys();

            while (keys.hasNext()) {
                String nkey = keys.next();
                System.out.println(nkey);
                Object objvalue = itemdata.get(nkey);

                if (JSONObject.NULL.equals(objvalue)) {
                    itemdata.put(nkey, "N0");
                } else {
                    if (objvalue instanceof String) {
                        String val = ((String) objvalue).toString();
                        if (isEmptyOrNull(val)) {
                            itemdata.put(nkey, "N1");
                        }
                    }
                }
            }

        }

        System.out.println(jsonData.toString());
    }

    private static String GetJsonAtrrObjectStringValue(Object objvalue) {
        String valToXml = "";
        if (objvalue instanceof Boolean) {
            Boolean boolToUse = ((Boolean) objvalue).booleanValue();
            valToXml = boolToUse.toString();
        } else if (objvalue instanceof Integer || objvalue instanceof Long) {
            long intToUse = ((Number) objvalue).longValue();
            valToXml = String.valueOf(intToUse);
        } else if (objvalue instanceof Float || objvalue instanceof Double) {
            double floatToUse = ((Number) objvalue).doubleValue();
            valToXml = String.valueOf(floatToUse);
        } else if (JSONObject.NULL.equals(objvalue)) {
            valToXml = "";
        } else {
            valToXml = ((String) objvalue).toString();
        }

        return valToXml;
    }

    public static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }

}
