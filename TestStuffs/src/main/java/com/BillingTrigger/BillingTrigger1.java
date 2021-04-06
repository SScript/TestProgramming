package com.BillingTrigger;

import java.io.*;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class BillingTrigger1 {

    protected static JSONObject obj;
    protected static JSONObject orderdata_;
    protected static JSONObject orderdata;
    protected static JSONArray orderdataitems;
    protected static JSONObject itemdata;
    protected static JSONObject itemattrdata;
    protected static JSONObject jsonData = new JSONObject();
    protected static JSONArray orderAtrrItems = new JSONArray();
    protected static boolean isOrderItems = true;

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/BillTriggerInput.json");
        String longJsonString = IOUtils.toString(fis, "UTF-8");
        orderdata_ = new JSONObject(longJsonString);
        orderdata = orderdata_.getJSONObject("Order");
        orderdataitems = new JSONArray();

        String paymentMode = GetOrderFieldFirstLEvelValue("PaymentMode", true);
        String orderedServiceType = "";

        // OrderItems var nebūt
        try {
            orderdataitems = orderdata.getJSONArray("OrderItems");
        } catch (Exception e) {
            isOrderItems = false;
        }

        // ORD_PRODUCTCATEGORY -> jdev kodā šis ir ielikts un strādā
        //SetOrderProductTypeList(excludeStrs, containsOrEquals);

        // TriggerBilling gadījumā ir prasība likt visus parametrus, ja mav vērtība, tad liek tukšu ""
        jsonData
                .put("orderid", GetOrderFieldFirstLEvelValue("OrderId", true))
                .put("orderno", GetOrderFieldFirstLEvelValue("OrderNumber", true))
                //.put("serviceno", GetOrderItemLevelValue("SplitPayment", "ServiceId"))
                .put("orderdate", FormatDate(GetOrderFieldFirstLEvelValue("OrderDate", true)))
                .put("ordernotes", GetOrderFieldFirstLEvelValue("Notes", false))
                //.put("caller", GetOrderFieldFirstLEvelValue("Requester", true));
                .put("caller", "SOATEST");

        try {
            //String val = GetOrderFieldFirstLEvelValue("PaymentMode");
            switch (paymentMode) {
                case "Split Payment":
                    orderAtrrItems.put(new JSONObject().put("ORD_PAYMENT_TYPE", "SP"));
                    jsonData.put("serviceno", GetOrderItemLevelValue("SplitPayment", "ServiceId"));
                    break;
                case "Full Payment":
                    orderAtrrItems.put(new JSONObject().put("ORD_PAYMENT_TYPE", "FP"));
                    orderAtrrItems.put(new JSONObject().put("serviceno", GetOrderFieldFirstLEvelValue("OrderNumber", true)));
                    jsonData.put("serviceno", GetOrderFieldFirstLEvelValue("OrderNumber", true));
                    break;
                default:
                    orderAtrrItems.put(new JSONObject().put("ORD_PAYMENT_TYPE", ""));
                    orderAtrrItems.put(new JSONObject().put("serviceno", ""));
                    break;
            }
        } catch (Exception e) {
            orderAtrrItems.put(new JSONObject().put("ORD_PAYMENT_TYPE", ""));
            orderAtrrItems.put(new JSONObject().put("serviceno", ""));
        }

        orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("Insurance")).put("key", "ORD_INSURANCE_FLAG"));
        orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("Warranty")).put("key", "ORD_WARRANTY_FLAG"));
        orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("PersonalLiabilityInsurance")).put("key", "ORD_CTA_FLAG"));

        orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_CTA_SUM"));

        // saliekam atribūtus
        orderAtrrItems.put(GetOrderFirstLevelAtrrValue("AccountNo", "ORD_CUSTOMERNO", true));
        orderAtrrItems.put(GetOrderFirstLevelAtrrValue("BillAccountNumber", "ORD_BILLINGACCOUNTNO", true));

        // vajag tikai ciparu, kas ir līdz "-" simbolam
        String s = GetOrderFieldFirstLEvelValue("DownPaymentBillNo", false);
        if (!"".equals(s)) {
            if (s.contains("-")) {
                orderAtrrItems.put(new JSONObject().put("value", s.substring(0, s.indexOf("-"))).put("key", "ORD_DP_BILL_NO"));
            } else {
                orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_DP_BILL_NO"));
            }
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_DP_BILL_NO"));
        }

        orderAtrrItems.put(GetOrderFirstLevelAtrrValue("MonthDelay", "ORD_MONTH_DELAY", false));

        // jābūt formātā ‘DD/MM/YYYY’. Ienākošias - YYYY-MM-DD.
        s = GetOrderFieldFirstLEvelValue("BillActivationDate", false);
        if (!"".equals(s)) {
            orderAtrrItems.put(new JSONObject().put("value", FormatDateShort(s)).put("key", "ORD_BILLING_ACTIVATION_DATE"));
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_BILLING_ACTIVATION_DATE"));
        }
        //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("BillActivationDate", "ORD_BILLING_ACTIVATION_DATE"));

        //If OrderedService is null or not send, then use default value - 'Split payment'
        s = GetOrderFieldFirstLEvelValue("OrderedService", false);
        if (!"".equals(s)) {
            orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ORDEREDSERVICE"));
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "Split payment").put("key", "ORD_ORDEREDSERVICE"));
        }
        //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("OrderedService", "ORD_ORDEREDSERVICE"));

        orderAtrrItems.put(GetOrderFirstLevelAtrrValue("OrderedServiceType", "ORD_ORDEREDSERVICETYPE", false));
        orderedServiceType = GetOrderFieldFirstLEvelValue("OrderedServiceType", true);

        // (SOAIP-1110) Ja <OrderedServiceType> = 'Change'
        if ("Change".equals(orderedServiceType) && isOrderItems) {
            //orderAtrrItems.put(ProcessIfOrderedServiceTypeIsChange("PaymentD  elayPercents", "ORD_PAYMENT_DELAY_PERCENT", false)); // (SOAIP-1110)
            ProcessIfOrderedServiceTypeIsChange("ORD_CE_CANCEL_FLAG");
        } else {
            //ORD_CE_CANCEL_FLAG = ""
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_CE_CANCEL_FLAG"));
        }


        orderAtrrItems.put(GetOrderFirstLevelAtrrValue("RemovalReason", "ORD_REASON_ID", false));
        // CE Restructuring.PaymentDelayPercents
        GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Atlikšanas procenti", "ORD_PAYMENT_DELAY_PERCENT");
        // CE Restructuring.PaymentDelayMonths
        GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Atlikšanas mēnešu skaits", "ORD_PAYMENT_DELAY_MONTHS");
        // CE Restructuring.RepayMonths
        GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Uzkrāto summu izmaksa mēnešos", "ORD_REPAY_MONTHS");

        GetOrderItemLevelAtrrValue("SplitPayment", "OrderItemId", "ORD_ORDERITEMID", true);
        //GetOrderItemLevelAtrrValue("SplitPayment", "ServiceId", "serviceno");
        GetOrderItemLevelAtrrValue("SplitPayment", "OneTimeCharge", "ORD_FIRST_PAYMENT", true);
        GetOrderItemLevelOrderTotalSumm("ConsumerGoods", "OneTimeCharge", "ORD_INSTALLMENT_SUM"); //(SOAIP-1012)

        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_MONTHS");
        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_INSURANCE_MONTHS");
        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_WARRANTY_MONTHS");
        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Total Insurance", "ORD_INSURANCE_SUM");
        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Insurance", "ORD_INSURANCE_MONTHS_DELAY");
        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Total Warranty", "ORD_WARRANTY_SUM");
        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Warranty Delayed Months", "ORD_WARRANTY_MONTHS_DELAY");

        GetOrderItemLevelAtrrDinamicValue("PersonalLiabilityInsurance", "Term", "ORD_CTA_MONTHS");
        GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Warranty Delayed Months", "ORD_CTA_MONTHS_DELAY");

        GetOrderItemLevelAtrrValue("Shipping", "AccountingCode", "ORD_COURIERPRODUCTID", false);
        GetOrderItemLevelAtrrValue("Shipping", "OneTimeCharge", "ORD_COURIERCHARGE", false);

        jsonData.put("orderdetails", orderAtrrItems);

        System.out.println(jsonData.toString());
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/resBillTrigger.json"),
                jsonData.toString(), Charset.forName("UTF-8"));
    }

    private static void ProcessIfOrderedServiceTypeIsChange(String key) {
        /*
        (SOAIP-1110) Ja <OrderedServiceType> = 'Change' un ir kaut viens OrderItem ar <OrderItemSubType> = 'Delete Insurance/Warranty' un:
        a. Orderī ir šādi OrderItem  gan ar <ProductType> = 'Warranty', gan ar <ProductType> = 'Insurance' (jāņem vērā tikai tiek OrderItem, kuriem <OrderItemSubType> = 'Delete Insurance/Warranty'),
            tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'WI';
        b. ja atbilstošiem OrderItem  <ProductType> ir tikai 'Warranty', tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'W';
        b. ja atbilstošiem OrderItem  <ProductType> ir tikai 'Insurance', tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'I'.
        Ja ir cits <OrderedServiceType> vai nav OrderItem ar atbilstošu <OrderItemSubType>, tad tiek pievienots dinamiskais parametrs ar key =ORD_CE_CANCEL_FLAG un tukšu vērtību.
        */
        String val = "";

        int itemcount = orderdataitems.length();
        int counterW = 0;
        int counterI = 0;
        String orderItemSubType = "";
        Boolean isFoundOrderItemSubType = false;
        String productType = "";

        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            try {
                orderItemSubType = GetJsonObjectStringValue(itemdata.get("OrderSubType"));
                if ("Delete Insurance/Warranty".equals(orderItemSubType)) {
                    isFoundOrderItemSubType = true;
                    break;
                }
            } catch (Exception e) {}
        }

        // ir kaut viens OrderItem ar <OrderSubType> = 'Delete Insurance/Warranty'
        if (isFoundOrderItemSubType) {
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                productType = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if ("Warranty".equals(productType)) {
                    counterW++;
                }
                if ("Insurance".equals(productType)) {
                    counterI++;
                }
            }
        }

        if (counterW > 0 && counterI > 0) {val = "WI";}
        if (counterW > 0 && counterI == 0) {val = "W";}
        if (counterW == 0 && counterI > 0) {val = "I";}

        orderAtrrItems.put(new JSONObject().put("value", val).put("key", key));
    }

    private static String GetOrderItemLevelValue(String productType, String atrribute) {
        boolean foundinitemsvalue = false;
        String value = "";

        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // meklējam atbilsošo item pēc productType
            String ProductType = "";
            int counter = 0;
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                ProductType = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (productType.equals(ProductType)) {
                    try {
                        value = GetJsonObjectStringValue(itemdata.get(atrribute));
                        foundinitemsvalue = true;
                        break;
                    } catch (Exception e) {
                        value = "";
                    }
                }
            }
            if (!foundinitemsvalue) {
                return "";
            }
        } else {
            return "";
        }
        return value;
    }

    private static String FormatDate(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        String dd1 = d.substring(8, 10);
        String mm1 = d.substring(5, 7);
        String yy1 = d.substring(0, 4);
        String time = d.substring(11, 19);
        //System.out.println(dd1 + "/" + mm1 + "/" + yy1 + " " + time);
        return dd1 + "/" + mm1 + "/" + yy1 + " " + time;
    }

    private static String FormatDateShort(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        String dd1 = d.substring(8, 10);
        String mm1 = d.substring(5, 7);
        String yy1 = d.substring(0, 4);
        return dd1 + "/" + mm1 + "/" + yy1;
    }

    private static String GetOrderProductTypeList() {
        String res = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            String productTypeValue = "";
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                if (isEmptyOrNull(res)) {
                    res = GetJsonObjectStringValue(itemdata.get("ProductType"));
                } else {
                    res = res + "," + GetJsonObjectStringValue(itemdata.get("ProductType"));
                }
            }
        }
        return res;
    }

    private static String GetIsOrderItem(String val) {
        String res = "N";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            String productTypeValue = "";
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                productTypeValue = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (val.equals(productTypeValue)) {
                    res = "Y";
                    break;
                }
            }
        }
        return res;
    }

    /**
     * Order pirmā līmeņa parametrs
     * Ja ir, tad agriež vērtību, ja nav parametra, tad vērtība ir tukšums
     *
     * @return
     */
    private static String GetOrderFieldFirstLEvelValue(String field, Boolean mandatory) throws Exception{
        String res = "";
        try {
            res = GetJsonObjectStringValue(orderdata.get(field));
        } catch (Exception e) {
            res = "";
        }
        if (mandatory && isEmptyOrNull(res)) {
            throw new Exception("Field " + field + " is mandatory");
        } else {
            return res;
        }
    }

    /**
     * Order pirmā līmeņa atribūtu parametrs
     *
     * @return
     */
    private static JSONObject GetOrderFirstLevelAtrrValue(String field, String key, Boolean mandatory) throws Exception {
        String val = "";
        try {
            val = GetJsonObjectStringValue(orderdata.get(field));
        } catch (Exception e) {
            val = "";
        }
        if (mandatory && isEmptyOrNull(val)) {
            throw new Exception("Field " + field + " is mandatory");
        }
        return new JSONObject().put("value", val).put("key", key);
    }

    /**
     * Order pirmā līmeņa atribūtu parametrs
     *
     * @return
     */
    private static void GetOrderItemLevelAtrrValue(String productType, String field, String key, Boolean mandatory)
            throws Exception
    {
        boolean foundinitemsvalue = false;
        // ja ir padoti orderitems
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // meklējam atbilsošo item pēc productType
            String productTypeValue = "";
            String val = "";
            String newkey = "";
            int counter = 0;
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                productTypeValue = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (productType.equals(productTypeValue)) {
                    if ("Shipping".equals(productType) && counter > 0) {
                        newkey = key + "_" + counter;
                    } else {
                        newkey = key;
                    }
                    try {
                        val = GetJsonObjectStringValue(itemdata.get(field));
                        foundinitemsvalue = true;
                    } catch (Exception e) {
                        val = "";
                        foundinitemsvalue = true;
                    }
                    // ja obligāts un tukšs, tad error
                    if (mandatory && isEmptyOrNull(val)) {
                        throw new Exception("Field " + field + " is mandatory");
                    } else {
                        orderAtrrItems.put(new JSONObject().put("value", val).put("key", newkey));
                    }
                    if ("Shipping".equals(productType)) {
                        counter++;
                    }
                }
            }

            if (!foundinitemsvalue) {
                //if ("Shipping".equals(productType)) {
                //    orderAtrrItems.put(new JSONObject().put("value", "").put("key", key + "_1"));
                //} else {
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                //}
            }

        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
    }

    private static String GetOrderItemLevelValue(String productType, String atrribute, Boolean mandatory) {
        boolean foundinitemsvalue = false;
        String value = "";

        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // meklējam atbilsošo item pēc productType
            String ProductType = "";
            int counter = 0;
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                ProductType = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (productType.equals(ProductType)) {
                    try {
                        value = GetJsonObjectStringValue(itemdata.get(atrribute));
                        foundinitemsvalue = true;
                        break;
                    } catch (Exception e) {
                        value = "";
                    }
                }
            }
            if (!foundinitemsvalue) {
                return "";
            }
        } else {
            return "";
        }
        return value;
    }

    private static void GetOrderItemLevelAtrrDinamicValue(String productType, String atrribute, String key) {
        boolean foundValue = false;
        boolean addEmptyValue = false;
        boolean isFoundProdType = false;
        Map<String, String> nameMatch = new HashMap<>();

        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // meklējam atbilsošo item pēc productType
            String ProductType = "";
            String atrrname = "";
            int counter = 0;
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                ProductType = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (productType.equals(ProductType)) {
                    isFoundProdType = true;
                    try {
                        JSONObject atrr = itemdata.getJSONObject("JSONAttribute");
                        Iterator<String> keys = atrr.keys();
                        while (keys.hasNext()) {
                            String nkey = keys.next();
                            JSONArray a = atrr.getJSONArray(nkey);
                            int itemattrcount = a.length();
                            String val = "";
                            String newkey = "";
                            for (int j = 0; j < itemattrcount; j++) {
                                itemattrdata = a.getJSONObject(j);
                                String datatypr = GetJsonObjectStringValue(itemattrdata.get("valuedatatype__c"));
                                String valp = GetJsonObjectStringValue(itemattrdata.get("attributedisplayname__c"));
                                if (atrribute.equals(valp)) {
                                    if ("Picklist".equals(datatypr)) {
                                        try {
                                            val = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo")
                                                    .getJSONObject("selectedItem").get("value"));
                                            foundValue = true;
                                        } catch (Exception e) {
                                            val = "";
                                            addEmptyValue = true;
                                        }
                                    } else {
                                        try {
                                            val = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo").get("value"));
                                            foundValue = true;
                                        } catch (Exception e) {
                                            val = "";
                                            addEmptyValue = true;
                                        }
                                    }
                                    if (counter > 0) {
                                        newkey = key + "_" + counter;
                                    } else {
                                        newkey = key;
                                    }

                                    //If any amount parameter (say ORD_WARRANTY_SUM) is 0, there is no need to send 0. You can pass: “”.
                                    if ("ORD_WARRANTY_SUM".equals(key) && "0".equals(val)) {
                                        val = "";
                                    }
                                    orderAtrrItems.put(new JSONObject().put("value", val).put("key", newkey));
                                    counter++;
                                }
                            }
                        } // end of -> while (keys.hasNext()) {
                        if (!foundValue && !addEmptyValue) {
                            if (!nameMatch.containsKey(key)) {
                                orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                                nameMatch.put(key, "");
                            }
                        }
                    } catch (Exception e) {
                        orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                    }
                } // --- end of if (productType.equals(ProductType)) {
            } // --- end of -> for (int i = 0; i < itemcount; i++)
            // var būt, ka neatrod ProductType, tad arī vaig pielikt tukšu
            if (!isFoundProdType && !nameMatch.containsKey(key)) {
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
            }
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
    }

    private static String GetJsonObjectStringValue(Object objvalue) {
        String valToXml = "";
        try {
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
        } catch (Exception e) {
            valToXml = "";
        }

        return valToXml;
    }

    private static void GetOrderItemLevelOrderTotalSumm(String productType, String field, String key) {
        Double res = 0d;
        String v = "";
        // ja ir padoti orderitems
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // mekljam atbilsoo item pc productType
            String productTypeValue = "";
            String val = "";
            String newkey = "";
            int counter = 0;
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                productTypeValue = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (productType.equals(productTypeValue)) {

                    try {
                        v = GetJsonObjectStringValue(itemdata.get(field));
                        if (!isEmptyOrNull(v)) {
                            res = res + new Double(v);
                        }
                    } catch (Exception e) {
                        v = "";
                    }
                }
            }
            if (res > 0) {
                orderAtrrItems.put(new JSONObject().put("value", String.format("%.2f", res)).put("key", key));
            } else {
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
            }
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
