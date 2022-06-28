package com.BillingTrigger;

import java.io.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.charset.Charset;
import java.util.*;
import java.util.stream.Collectors;

import jdk.nashorn.internal.scripts.JS;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class BillingTrigger4_1 {

    protected JSONObject obj;
    protected JSONObject orderdata_;
    protected JSONObject orderdata;
    protected JSONArray orderdataitems;
    protected JSONObject itemdata;
    protected JSONObject itemattrdata;
    protected JSONObject jsonData = new JSONObject();
    protected JSONArray orderAtrrItems = new JSONArray();
    protected boolean isOrderItems = true;
    protected boolean isAddressFound = false;
    protected String AccountAddressId = "";

    public Resp ProcessJsonData(String jsonDataStr) throws Exception {
        Resp result = new Resp();

        orderdata_ = new JSONObject(jsonDataStr);
        orderdata = orderdata_.getJSONObject("Order");
        orderdataitems = new JSONArray();

        String paymentMode = GetOrderFieldFirstLEvelValue("PaymentMode", true);
        String orderedServiceType = "";

        String s = "";

        // OrderItems var nebūt
        try {
            orderdataitems = orderdata.getJSONArray("OrderItems");
        } catch (Exception e) {
            isOrderItems = false;
        }

        // TriggerBilling gadījumā ir prasība likt visus parametrus, ja mav vērtība, tad liek tukšu ""
        //jsonData
        //        .put("orderid", GetOrderFieldFirstLEvelValue("OrderId", true))
        //        .put("orderno", GetOrderFieldFirstLEvelValue("OrderNumber", true))
        //        .put("orderdate", FormatDate(GetOrderFieldFirstLEvelValue("OrderDate", true)))
        //        .put("ordernotes", GetOrderFieldFirstLEvelValue("Notes", false))
                //.put("caller", GetOrderFieldFirstLEvelValue("Requester", true));
       //         .put("caller", "SOATEST");

        //If OrderedService is null or not send, then use default value - 'Split payment'
        String orderedService = GetOrderFieldFirstLEvelValue("OrderedService", false);
        //if (!"".equals(orderedService)) {
        //    orderAtrrItems.put(new JSONObject().put("value", orderedService).put("key", "ORD_ORDEREDSERVICE"));
        //} else {
        //    orderAtrrItems.put(new JSONObject().put("value", "Split payment").put("key", "ORD_ORDEREDSERVICE"));
        //    orderedService = "Split payment";
        //}

        // pārbaudam adresi
        isAddressFound = false;
        if (!"Split payment".equalsIgnoreCase(orderedService)) {
            // priekš Electricity - <ItemServiceAddressKey>
            AccountAddressId = GetItemServiceAddressKey();
        } else {
            // "AddressKey" nav obligāts
            AccountAddressId = GetOrderFieldFirstLEvelValue("AddressKey", false);
        }
        //try {
        //    if (!isEmptyOrNull(AccountAddressId)) {
        //        //GetOrderAddressData();
        //        if (!isAddressFound && !"Split payment".equalsIgnoreCase(orderedService)) {
        //            //result.RetCode = "SOA_164[003]";
        //            //result.RetMsg = "Adrese : " + AccountAddressId + " nav atrasta.";
        //            //return result;
        //            isAddressFound = false;
        //        }
        //    }
        //} catch (Exception e) {
        //}

        // Ja <OrderedService> = 'Split Payment' (SOAIP-1413), tad un <PaymentMode> ir :
        if ("Split payment".equalsIgnoreCase(orderedService)) {
            //SetOrderProductTypeList("Additional insurance, warranty, Split Payment", "1");

            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_CTA_SUM"));

            try {
                switch (paymentMode) {
                    case "Split Payment":
                        //orderAtrrItems.put(new JSONObject().put("value", "SP").put("key", "ORD_PAYMENT_TYPE"));
                        jsonData.put("serviceno", GetOrderItemLevelValue("SplitPayment", "ServiceId"));
                        break;
                    case "Full Payment":
                        //orderAtrrItems.put(new JSONObject().put("value", "FP").put("key", "ORD_PAYMENT_TYPE"));
                        //orderAtrrItems.put(new JSONObject().put("value", GetOrderFieldFirstLEvelValue("OrderNumber", true)).put("key", "serviceno"));
                        //jsonData.put("serviceno", GetOrderFieldFirstLEvelValue("OrderNumber", true));
                        // SOAIP-1950 full payment gadījumā vajadzēja serviceno padot Vlocity header līmenī
                        break;
                    default:
                        //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_PAYMENT_TYPE"));
                        jsonData.put("serviceno", "");
                        break;
                }
            } catch (Exception e) {
                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_PAYMENT_TYPE"));
                //jsonData.put("serviceno", "");
            }

            //GetOrderItemLevelOrderTotalSumm("ConsumerGoods", "OneTimeCharge", "ORD_INSTALLMENT_SUM"); //(SOAIP-1012)
            //if (isOrderItems) {
            //    orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("Insurance")).put("key", "ORD_INSURANCE_FLAG"));
            //    orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("Warranty")).put("key", "ORD_WARRANTY_FLAG"));
            //    orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("PersonalLiabilityInsurance")).put("key", "ORD_CTA_FLAG"));
            //}

            // vajag tikai ciparu, kas ir līdz "-" simbolam
            //s = GetOrderFieldFirstLEvelValue("DownPaymentBillNo", false);
            //if (!"".equals(s)) {
            //    if (s.contains("-")) {
            //        orderAtrrItems.put(new JSONObject().put("value", s.substring(0, s.indexOf("-"))).put("key", "ORD_DP_BILL_NO"));
            //    } else {
            //        orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_DP_BILL_NO"));
            //    }
            //} else {
            //    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_DP_BILL_NO"));
            //}

        } else {
            //s = GetOrderItemFieldRootObject(
            //        "Electricity", "Electricity",
            //        "RootObject",
            //        "ServiceId",
            //        false);
            //orderAtrrItems.put(new JSONObject().put("value", isEmptyOrNull(s) ? "" : s).put("key", "serviceno"));
        }

        // saliekam atribūtus
        //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("AccountNo", "ORD_CUSTOMERNO", true));
        //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("BillAccountNumber", "ORD_BILLINGACCOUNTNO", true));

        // jābūt formātā ‘DD/MM/YYYY’. Ienākošias - YYYY-MM-DD.
        if ("Split payment".equalsIgnoreCase(orderedService)) {
            //s = GetOrderFieldFirstLEvelValue("BillActivationDate", true);
        } else {
            // jānem no "Electricity.RootObject.BillActivationDate"
            //s = GetOrderItemFieldRootObject(
            //        "Electricity", "Electricity",
           //         "RootObject",
            //        "BillActivationDate",
            //        true);
        }
        if (!"".equals(s)) {
            //orderAtrrItems.put(new JSONObject().put("value", FormatDateShort(s)).put("key", "ORD_BILLING_ACTIVATION_DATE"));
        } else {
            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_BILLING_ACTIVATION_DATE"));
        }

        //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("OrderedService", "ORD_ORDEREDSERVICE"));
        //SOAIP-1821 : DT. Trigger billing (SOA_164) - ja <OrderedService> ir 'Split Payment' , tad tiek pievienota tukša struktūra "orderOffers".
        //if ("Split payment".toUpperCase().equals(orderedService.toUpperCase())) {
          //jsonData.put("orderOffers", ProcessOrderPricing());
        //}

        if ("Split payment".toUpperCase().equals(orderedService.toUpperCase())) {
            //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("OrderedServiceType", "ORD_ORDEREDSERVICETYPE", false));
           // orderedServiceType = GetOrderFieldFirstLEvelValue("OrderedServiceType", true);

            // (SOAIP-1110) Ja <OrderedServiceType> = 'Change'
            if ("Change".equals(orderedServiceType) && isOrderItems) {
                //ProcessIfOrderedServiceTypeIsChange("ORD_CE_CANCEL_FLAG");
            } else {
                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_CE_CANCEL_FLAG"));
            }

        }else {
            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_CE_CANCEL_FLAG"));
            //s = GetOrderItemFieldRootObject(
            //        "Electricity", "Electricity",
            //        "RootObject",
            //        "OrderedServiceType",
            //        false);
            //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ORDEREDSERVICETYPE"));
        }

        //"RemovalReason", "ORD_REASON_ID"
        if ("Split payment".equalsIgnoreCase(orderedService)) {
            //s = GetOrderFieldFirstLEvelValue("RemovalReason", false);
        } else {
            // jānem no "Electricity.RootObject.BillActivationDate"
            //s = GetOrderItemFieldRootObject(
            //        "Electricity", "Electricity",
            //        "RootObject",
            //        "RemovalReason",
           //         false);
        }
        if (!"".equals(s)) {
            //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_REASON_ID"));
        } else {
            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_REASON_ID"));
        }

        //"OrderItemId", "ORD_ORDERITEMID"
        if ("Split payment".equalsIgnoreCase(orderedService)) {
            //GetOrderItemLevelAtrrValue("SplitPayment", "OrderItemId", "ORD_ORDERITEMID", true);
            //s = GetOrderFieldFirstLEvelValue("OrderItemId", true);
        } else {
            // jānem no "Electricity.RootObject.BillActivationDate"
            //s = GetOrderItemFieldRootObject(
            //        "Electricity", "Electricity",
            //        "RootObject",
            //        "OrderItemId",
            //        true);
            if (!"".equals(s)) {
                //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ORDERITEMID"));
            } else {
                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_ORDERITEMID"));
            }
        }
        //-----------
        if ("Split payment".equalsIgnoreCase(orderedService)) {
            // CE Restructuring.PaymentDelayPercents
            //GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Atlikšanas procenti", "ORD_PAYMENT_DELAY_PERCENT");
            // CE Restructuring.PaymentDelayMonths
            //GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Atlikšanas mēnešu skaits", "ORD_PAYMENT_DELAY_MONTHS");
            // CE Restructuring.RepayMonths
            //GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Uzkrāto summu izmaksa mēnešos", "ORD_REPAY_MONTHS");

            //GetOrderItemLevelAtrrValue("Shipping", "AccountingCode", "ORD_COURIERPRODUCTID", false);
            //GetOrderItemLevelAtrrValue("Shipping", "OneTimeCharge", "ORD_COURIERCHARGE", false);
            //GetOrderItemLevelAtrrDinamicValue("PersonalLiabilityInsurance", "Term", "ORD_CTA_MONTHS");
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Warranty Delayed Months", "ORD_CTA_MONTHS_DELAY");
            //GetOrderItemLevelAtrrValue("SplitPayment", "OneTimeCharge", "ORD_FIRST_PAYMENT", true);
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_MONTHS");
            //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("MonthDelay", "ORD_MONTH_DELAY", false));
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_INSURANCE_MONTHS");
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_WARRANTY_MONTHS");
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Total Insurance", "ORD_INSURANCE_SUM");
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Delayed Months-Insurance", "ORD_INSURANCE_MONTHS_DELAY");
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Total Warranty", "ORD_WARRANTY_SUM");
            //GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Delayed Months-Warranty", "ORD_WARRANTY_MONTHS_DELAY");

        }


        if (!"Split payment".equalsIgnoreCase(orderedService) && isOrderItems) {
            //orderedServiceType = GetJsonObjectStringValue((JSONObject) orderdataitems.get(0), "OrderedServiceType", false);
            //GetOrderItemLevelWithActionVAlue("ORD_PAYMENT_METHOD", "ORD_PAYMENT_METHOD", "Remove".equalsIgnoreCase(orderedServiceType));
            //GetOrderItemLevelWithActionVAlue("ORD_PRICE_TYPE", "ORD_PRICE_TYPE", "Remove".equalsIgnoreCase(orderedServiceType));
            //GetOrderItemLevelWithActionVAlue("ORD_LINE_ID", "ORD_LINE_ID", "Remove".equalsIgnoreCase(orderedServiceType));
            //GetOrderItemLevelWithActionVAlue("ORD_PRICE_ID", "ORD_PRICE_ID", "Remove".equalsIgnoreCase(orderedServiceType));
            //GetOrderItemLevelWithActionVAlue("ORD_CONTRACT_LENGTH", "ORD_CONTRACT_LENGTH", "Remove".equalsIgnoreCase(orderedServiceType));
            // "ORD_PRICE_KWH"
            // If <OrderedService> nav 'Split Payment', tad tiek pievienots dinamiskais parametrs ar key = 'ORD_PRICE_KWH'
            // un value - tiek noteikta no OrderItem ar <ProductSubType> = 'Plan' un ar <OrderItemAction> = 'ADD', OrderPricing ieraksta ar <Source> = 'Base':
            //ja VATExclusive = 'N', tad value = round(<OrderItem.OrderPricing.Amount> devide with (1.<OrderItem.OrderPricing.VatRate>),2)
            //pretejā gadijumā - value = <OrderItem.OrderPricing.Amount>
            //s = GetORD_PRICE_KWHValue();
            //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_PRICE_KWH"));
        }

        if ("Electricity".equalsIgnoreCase(orderedService)) {
            // jānem no "Electricity.RootObject.BillActivationDate"
            //s = GetOrderItemFieldAtrrrObject(
           //         "Electricity", "Electricity",
            //        "TechnicalObject",
            //        "ATT_ELE_CONSUMP",
            //        false);
            //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_AVG_CONS_KWH"));
            //s = GetOrderItemFieldAtrrrObject(
            //        "Electricity", "Electricity",
            //        "TechnicalObject",
            //        "ATT_ELE_ST_TRF",
            //        false);
            //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ST_TP_CODE"));
            //s = GetOrderItemFieldAtrrrObject(
            //        "Electricity", "Electricity",
            //        "TechnicalObject",
            //        "ATT_ELE_INCURRENT_VAL",
           //         false);
            //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_AMPERAGE"));
            //s = GetOrderItemFieldAtrrrObject(
            //        "Electricity", "Electricity",
            //        "TechnicalObject",
            //        "ORD_PRICE_KWH",
            //        false);
            //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_PRICE_KWH"));
        }
        //-----------

        jsonData.put("orderdetails", orderAtrrItems);
        result.SendJsonStr = jsonData.toString();

        return result;
    }

    private JSONArray GetJSONArrObj(JSONObject data, String arrName) {
        JSONArray result = new JSONArray();
        try {
            Object orderdataitems_o = data.get(arrName);
            if (orderdataitems_o instanceof JSONArray) {
                result = (JSONArray) orderdataitems_o;
            }
            if (orderdataitems_o instanceof JSONObject) {
                result.put(orderdataitems_o);
            }
        } catch (Exception e) {
        }

        return result;
    }

    private String GetORD_PRICE_KWHValue() throws Exception {
        String result = "";
        String productSubTypeValue = "";
        String orderItemActionValue = "";
        String orderPricingSourceValue = "";
        String vATExclusiveValue = "";
        String vATRateValue = "";
        String s = "";

        JSONObject itemdat = null;
        JSONObject objOrdPricing = null;

        // value - tiek noteikta no OrderItem ar <ProductSubType> = 'Plan' un ar <OrderItemAction> = 'ADD', OrderPricing ieraksta ar <Source> = 'Base':
        // ja VATExclusive = 'N', tad value = round(<OrderItem.OrderPricing.Amount> devide with (1.<OrderItem.OrderPricing.VatRate>),2)
        // pretejā gadijumā - value = <OrderItem.OrderPricing.Amount>
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdat = orderdataitems.getJSONObject(i);
            productSubTypeValue =  GetJsonObjectStringValue(itemdat, "ProductSubType", false);
            orderItemActionValue = GetJsonObjectStringValue(itemdat, "OrderItemAction", false);
            vATExclusiveValue = GetJsonObjectStringValue(itemdat, "VATExclusive", false);
            vATRateValue = GetJsonObjectStringValue(itemdat, "VATRate", false);

            try {objOrdPricing = itemdata.getJSONObject("OrderPricing");} catch (Exception e) {}
            if (null != objOrdPricing) {
                orderPricingSourceValue = GetJsonObjectStringValue(objOrdPricing, "Source", false);
                s = GetJsonObjectStringValue(objOrdPricing, "VATExclusive", false);
                vATExclusiveValue = isEmptyOrNull(s) ? vATExclusiveValue : s;
                s = GetJsonObjectStringValue(objOrdPricing, "VATRate", false);
                vATRateValue= isEmptyOrNull(s) ? vATRateValue : s;
            }
            if ("Plan".equalsIgnoreCase(productSubTypeValue) && "ADD".equalsIgnoreCase(orderItemActionValue) && "Base".equalsIgnoreCase(orderPricingSourceValue)) {
                // ja VATExclusive = 'N', tad value = round(<OrderItem.OrderPricing.Amount> devide with (1.<OrderItem.OrderPricing.VatRate>),2)
                if ("N".equalsIgnoreCase(vATExclusiveValue)) {
                    s = GetJsonObjectStringValue(objOrdPricing, "Amount", false);
                    if (!isEmptyOrNull(s) && !"0".equalsIgnoreCase(s)) {
                        BigDecimal b = new BigDecimal(s);
                        BigDecimal v = new BigDecimal(vATRateValue);
                        String s1 = "1." + v;
                        v = new BigDecimal(s1);
                        b = b.divide(v, 2, RoundingMode.HALF_UP);
                        result = b.toString();
                    }
                } else {
                    result = GetJsonObjectStringValue(objOrdPricing, "Amount", false);
                }
            }
        }
        return result;
    }

    private String TranslateOrderLineAction(String orderItemAction) {
        if ("Disconnect".equalsIgnoreCase(orderItemAction))
            return "OFF";
        else
            return "ON";
    }

    private String TranslateOrderPricingSource(String source) {
        switch (source.toUpperCase()) {
            case "BASE": return "C";
            case "PROMOTION": return "A";
            default : return "";
        }
    }

    private String TranslateOrderLineAmount(String giftQuantity, String adjustmentValue, String vATExclusive, String vATRateValue) {
        String result = "";
        if (!isEmptyOrNull(giftQuantity.replace("-", "")))
            return giftQuantity;
        else {
            if ("N".equalsIgnoreCase(vATExclusive)) {
                if (!isEmptyOrNull(adjustmentValue) && !"0".equalsIgnoreCase(adjustmentValue)) {
                    BigDecimal b = new BigDecimal(adjustmentValue);
                    BigDecimal v = new BigDecimal(vATRateValue);
                    String s1 = "1." + v;
                    v = new BigDecimal(s1);
                    b = b.divide(v, 2, RoundingMode.HALF_UP);
                    result = b.toString();
                }
            } else {
                result = adjustmentValue;
            }
        }
        return result.replace("-", "");
    }

    private String TranslateOrderPricingSource(String source, JSONObject itemdata) throws Exception {
        // ar switchu laikam nesanāktu, saglabāju tikmēr tepat ieprieksējo gabalu
        //            switch (source.toUpperCase()) {
        //                case "BASE": return "C";
        //                case "PROMOTION": return "A";
        //                default : return "";
        //            }

        String OCPPackageCode = GetJsonObjectStringValue(itemdata, "OCPPackageCode", false);
        String OCPPlanCode = GetJsonObjectStringValue(itemdata, "OCPPlanCode", false);
        String UnicornSpecialDiscountCode = GetJsonObjectStringValue(itemdata, "UnicornSpecialDiscountCode", false);

        if (source.equalsIgnoreCase("BASE")) {
            return "C";
        } else {

            if (!OCPPackageCode.isEmpty() || !OCPPlanCode.isEmpty() || !UnicornSpecialDiscountCode.isEmpty()) {
                return "D";
            } else {
                return "A";
            }
        }

    }

    private String TranslateOrderLineSubType(String source, String chargeType, JSONObject itemdata) throws Exception {
        //            switch (TranslateOrderPricingSource(source, itemdata)) {
        //                case "C": return chargeType;
        //                case "A": return "Debit";
        //                default : return "";
        //            }

        if (TranslateOrderPricingSource(source, itemdata).equals("C")) {
            return chargeType;
        } else if (TranslateOrderPricingSource(source, itemdata).equals("D")) {

            String UnicornSpecialDiscountCode = GetJsonObjectStringValue(itemdata, "UnicornSpecialDiscountCode", false);

            if (!UnicornSpecialDiscountCode.isEmpty()) {
                return "Special Discount";
            } else {
                return "Normal Discount";
            }
        } else {
            return "";
        }

    }

    private String TranslateOrderLineUOM(String adjustmentMethod, String giftQuantity, JSONObject itemdata) throws Exception {

        String UnicornSpecialDiscountCode = GetJsonObjectStringValue(itemdata, "UnicornSpecialDiscountCode", false);

        if (adjustmentMethod.equalsIgnoreCase("Percent")) {
            return adjustmentMethod;
        } else if (adjustmentMethod.equalsIgnoreCase("Absolute")) {
            if (!isEmptyOrNull(UnicornSpecialDiscountCode)) {

                giftQuantity = giftQuantity.isEmpty() ? "0" : giftQuantity;

                if (Integer.parseInt(giftQuantity) > 0) {
                    return "kWh";
                } else {
                    return "Money";
                }
            } else {
                return  "Money";
            }
        }

        return "";
    }
    private String getUnicornPlanCode(JSONArray data, String orderedServiceType) {
        String res = "";
        JSONObject itemdata1 = null;
        JSONObject itemdata2 = null;

        int itemcount = data.length();
        String prdtSubType = "";
        String orderItemAction = "";
        //String orderPricingAction = "";

        for (int i = 0; i < itemcount; i++) {
            itemdata1 = orderdataitems.getJSONObject(i);
            try {
                prdtSubType = GetJsonObjectStringValue(itemdata1.get("ProductSubType"));
                orderItemAction = GetJsonObjectStringValue(itemdata1.get("OrderItemAction"));
                if ("Remove".equalsIgnoreCase(orderedServiceType)) {
                    if ("Plan".equalsIgnoreCase(prdtSubType)) {
                        return GetJsonObjectStringValue(itemdata1.get("UnicornPlanCode"));
                    }
                } else {
                    if ("Plan".equalsIgnoreCase(prdtSubType)) {
                        // jātiek klāt pie OrderPricing, lai salīdzinātu vai Action ir Add, skatīt dok.
                        //JSONArray dd = GetJSONArrObj(itemdata1, "OrderPricing");
                        //int cc = dd.length();
                        //for (int j = 0; j < cc; j++) {
                        //    itemdata2 = dd.getJSONObject(j);
                        //    orderPricingAction = GetJsonObjectStringValue(itemdata2.get("Action"));
                        if ("Add".equalsIgnoreCase(orderItemAction)) {
                            return GetJsonObjectStringValue(itemdata1.get("UnicornPlanCode"));
                        }
                        //}
                    }
                }
            } catch (Exception e) {
                res = "";
            }
        }
        return res;
    }

    private String getOrderLinePackageCode(JSONObject data) {
        String res = "";
        JSONObject itemdata1 = null;

        int itemcount = orderdataitems.length();
        String prdtSubType = "";

        for (int i = 0; i < itemcount; i++) {
            itemdata1 = orderdataitems.getJSONObject(i);
            try {
                prdtSubType = GetJsonObjectStringValue(itemdata1.get("ProductSubType"));
                if ("RootObject".equalsIgnoreCase(prdtSubType)) {
                    return GetJsonObjectStringValue(itemdata1.get("UnicornPackageCode"));
                }

            } catch (Exception e) {
                res = "";
            }
        }
        return res;
    }

    private JSONArray ProcessOrderPricing() {
        JSONArray offerPriceObj = new JSONArray();
        int itemcount = orderdataitems.length();
        JSONObject objOrdPricing = null;

        String err = "";

        for (int i = 0; i < itemcount; i++) {
            String ORDER_LINE_PLAN_CODE_VALUE = ""; // pārnesu zem for loopa, savādāk string variablī saglabājas vērtība no iepriekšēja cikla
            String ORDER_LINE_PACKAGE_CODE = "";
            String ORDER_LINE_PROMOTION_UOM = "";
            String ORDER_LINE_TYPE = "";
            int typeDcount = 0;
            itemdata = orderdataitems.getJSONObject(i);
            Boolean addline = true;
            try {
                String orderItemSubType = GetJsonObjectStringValue(itemdata, "OrderSubType", false);
                String orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                String productSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                if ("Tariff Change".equalsIgnoreCase(orderItemSubType)) {
                    if ("Disconnect".equalsIgnoreCase(orderItemAction) && "Plan".equalsIgnoreCase(productSubType)) {
                        addline = false;
                    }
                }
                if (addline) {
                    // orderpricing var būt masīvs
                    JSONArray pricdata = GetJSONArrObj(itemdata, "OrderPricing");
                    int itempriccount = pricdata.length();
                    for (int j = 0; j < itempriccount; j++) {
                        objOrdPricing = pricdata.getJSONObject(j);
                        String sourcestr = GetJsonObjectStringValue(objOrdPricing, "Source", false);
                        String actionstr = GetJsonObjectStringValue(objOrdPricing, "Action", false);

                        String orderedServiceType = GetJsonObjectStringValue(itemdata.get("OrderedServiceType"));
                        if ("Promotion".equalsIgnoreCase(sourcestr)) {

                            ORDER_LINE_PLAN_CODE_VALUE = GetJsonObjectStringValue(objOrdPricing, "OCPPlanCode", false);
                            ORDER_LINE_PACKAGE_CODE = GetJsonObjectStringValue(objOrdPricing, "OCPPackageCode", false);
                            ORDER_LINE_PROMOTION_UOM = GetJsonObjectStringValue(objOrdPricing, "TimePlanUnit", false);
                            ORDER_LINE_PROMOTION_UOM = ORDER_LINE_PROMOTION_UOM.substring(0, 1);  // Translate Day -> D | Month -> M


                        } else if ("Base".equalsIgnoreCase(sourcestr)) {
                            ORDER_LINE_PLAN_CODE_VALUE = getUnicornPlanCode(orderdataitems, orderedServiceType);
                            ORDER_LINE_PACKAGE_CODE = getOrderLinePackageCode(itemdata);
                        } else {
                            ORDER_LINE_PACKAGE_CODE = getOrderLinePackageCode(itemdata);
                        }
                        ORDER_LINE_TYPE = TranslateOrderPricingSource(GetJsonObjectStringValue(objOrdPricing, "Source", false), objOrdPricing);
                        if ("D".equalsIgnoreCase(ORDER_LINE_TYPE)) {
                            typeDcount++;
                        }
                        offerPriceObj.put(
                                new JSONObject()
                                        .put("ORDER_LINE_ITEM", "D".equalsIgnoreCase(ORDER_LINE_TYPE)
                                                ? GetJsonObjectStringValue(objOrdPricing, "OrderItemId", false) + "_" + typeDcount
                                                : GetJsonObjectStringValue(objOrdPricing, "OrderItemId", false))
                                        .put("ORDER_LINE_PACKAGE_CODE", ORDER_LINE_PACKAGE_CODE)
                                        .put("ORDER_LINE_PLAN_CODE", ORDER_LINE_PLAN_CODE_VALUE)
                                        .put("ORDER_LINE_PRODUCT_CODE", GetJsonObjectStringValue(itemdata, "UnicornProductCode", false))
                                        .put("ORDER_LINE_COMPONENT_CODE", GetJsonObjectStringValue(itemdata, "UnicornComponentCode", false))
                                        .put("ORDER_LINE_SPECIAL_DISCOUNT_CODE", GetJsonObjectStringValue(objOrdPricing, "UnicornSpecialDiscountCode", false))
                                        .put("ORDER_LINE_ACTION", TranslateOrderLineAction(GetJsonObjectStringValue(itemdata, "OrderItemAction", false)))
                                        .put("ORDER_LINE_TYPE", ORDER_LINE_TYPE)
                                        .put("ORDER_LINE_AMOUNT",
                                                TranslateOrderLineAmount(GetJsonObjectStringValue(objOrdPricing, "GiftQuantity", false),
                                                        GetJsonObjectStringValue(objOrdPricing, "AdjustmentValue", false),
                                                        GetJsonObjectStringValue(objOrdPricing, "VATExclusive", false),
                                                        GetJsonObjectStringValue(objOrdPricing, "VATRate", false)).replace("-", ""))
                                        .put("ORDER_LINE_SUB_TYPE",
                                                TranslateOrderLineSubType(GetJsonObjectStringValue(objOrdPricing, "Source", false),
                                                        GetJsonObjectStringValue(objOrdPricing, "ChargeType", false), objOrdPricing))

                                        .put("ORDER_LINE_UOM", TranslateOrderLineUOM(GetJsonObjectStringValue(objOrdPricing, "AdjustmentMethod", false),
                                                GetJsonObjectStringValue(objOrdPricing, "GiftQuantity", false), itemdata))
                                        .put("ORDER_LINE_PROMOTION_PERIOD", GetJsonObjectStringValue(objOrdPricing, "TimePlanDuration", false))
                                        .put("ORDER_LINE_PROMOTION_UOM", ORDER_LINE_PROMOTION_UOM)
                                        .put("ORDER_LINE_PRODUCT_QTY", "1")
                                        .put("ORDER_LINE_COMPONENT_QTY", "1")
                                        // šis tika izņemts ar SOAIP-1943, pagaidām atstāju aizkomentētu
                                        // .put("ORDER_LINE_PROMO_ENDDATE", GetJsonObjectStringValue(objOrdPricing, "PromoEndDate", false))
                                        .put("ORDER_LINE_PROMO_ORDERNO", GetJsonObjectStringValue(objOrdPricing, "OCPRemark", false))
                                        .put("ORDER_LINE_NRC_WAIVER_REASON", GetJsonObjectStringValue(objOrdPricing, "OTCRemark", false))
                        );
                    }
                }
            } catch (Exception e) {
                err = e.getMessage();
            }
        }
        return offerPriceObj;
    }

    private String GetOrderItemFieldAtrrrObject(
            String productType, String productTypeCompareTo,
            String itemSubtypeCompare,
            String field,
            boolean mandatory) throws Exception {
        int itemcount = orderdataitems.length();
        String prdType = "";
        String prdtSubType = "";
        String val = "";
        //ProductType = "Electricity"
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            prdType = GetJsonObjectStringValue(itemdata.get("ProductType"));
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata.get("ProductSubType"));
                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType)) {
                    try {
                        //val = GetJsonObjectStringValue(itemdata.get(field));
                        val = GetItemDinamicValue(itemdata, field);
                        if (mandatory && isEmptyOrNull(val)) {
                            throw new Exception("Field " + field + " is mandatory");
                        }
                        break;
                    } catch (Exception e) {
                        if (mandatory) {
                            throw new Exception("Field " + field + " is mandatory");
                        }
                    }
                }
            }
        }
        return val;
    }

    private String GetOrderItemFieldRootObject(
            String productType, String productTypeCompareTo,
            String itemSubtypeCompare,
            String field,
            boolean mandatory) throws Exception {
        int itemcount = orderdataitems.length();
        String prdType = "";
        String prdtSubType = "";
        String val = "";
        //ProductType = "Electricity"
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            prdType = GetJsonObjectStringValue(itemdata.get("ProductType"));
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata.get("ProductSubType"));
                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType)) {
                    try {
                        val = GetJsonObjectStringValue(itemdata.get(field));
                        //val = GetItemDinamicValue(itemdata, field);
                        if (mandatory && isEmptyOrNull(val)) {
                            throw new Exception("Field " + field + " is mandatory");
                        }
                        break;
                    } catch (Exception e) {
                        if (mandatory) {
                            throw new Exception("Field " + field + " is mandatory");
                        }
                    }
                }
            }
        }
        return val;
    }

    private void GetOrderItemLevelWithActionVAlue(String jsonfield, String field, boolean orderedServiceTypeRemove) {
        // ja <OrderedServiceType> nav  'Remove', tad sekojošie dinamiskie parametri tiks aizpildīti no OrderItem ar <ProductSubType> = 'Plan'
        // un ar <OrderItemAction> = 'ADD', ja <OrderedServiceType> ir 'Remove', tad no OrderItem ar <OrderItemAction> = 'Disconnect'
        int itemcount = orderdataitems.length();
        String orderItemAction = "";
        String prdSubType = "";
        String val = "";
        // ja <OrderedServiceType> ir  'Remove'
        if (orderedServiceTypeRemove) {
            //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("MonthDelay", "ORD_MONTH_DELAY", false));
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                try {
                    orderItemAction = GetJsonObjectStringValue(itemdata.get("OrderItemAction"));
                    prdSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                    if ("Disconnect".equalsIgnoreCase(orderItemAction) && "Plan".equalsIgnoreCase(prdSubType)) {
                        try {
                            val = GetJsonObjectStringValue(itemdata.get(jsonfield));
                        } catch (Exception e) {}
                        orderAtrrItems.put(new JSONObject().put("value", val).put("key", field));
                        break;
                    }
                } catch (Exception e) {}
            }
        } else {
            // ja <OrderedServiceType> nav  'Remove'
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                try {
                    orderItemAction = GetJsonObjectStringValue(itemdata.get("OrderItemAction"));
                    prdSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                    if ("ADD".equalsIgnoreCase(orderItemAction) && "Plan".equalsIgnoreCase(prdSubType)) {
                        try {
                            val = GetJsonObjectStringValue(itemdata.get(jsonfield));
                        } catch (Exception e) {
                        }
                        orderAtrrItems.put(new JSONObject().put("value", val).put("key", field));
                        break;
                    }
                } catch (Exception e) {
                }
            }
        }
    }

    private void ProcessIfOrderedServiceTypeIsChange(String key) {
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

    private String GetOrderItemLevelValue(String productType, String atrribute) {
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

    private String FormatDate(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        String dd1 = d.substring(8, 10);
        String mm1 = d.substring(5, 7);
        String yy1 = d.substring(0, 4);
        String time = d.substring(11, 19);
        //System.out.println(dd1 + "/" + mm1 + "/" + yy1 + " " + time);
        return dd1 + "/" + mm1 + "/" + yy1 + " " + time;
    }

    private String FormatDateShort(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        String dd1 = d.substring(8, 10);
        String mm1 = d.substring(5, 7);
        String yy1 = d.substring(0, 4);
        return dd1 + "/" + mm1 + "/" + yy1;
    }

    private void SetOrderProductTypeList(String excludeStrs, String containsOrEquals) {
        String res = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            String productTypeValue = "";
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                if (isEmptyOrNull(res)) {
                    res = GetJsonObjectStringValue(itemdata.get("Name"));
                } else {
                    res = res + "," + GetJsonObjectStringValue(itemdata.get("Name"));
                }
            }
        }
        res = FormatProductCategoriesString(res, excludeStrs, containsOrEquals);
        if (res.length() > 3999) {res = res.substring(0, 3999);}

        orderAtrrItems.put(new JSONObject().put("value", res).put("key", "ORD_PRODUCTCATEGORY"));
    }

    private String FormatProductCategoriesString(String data, String excludeStrs, String containsOrEquals) {
        // izemamie vrdi
        List<String> sc = Arrays.asList(excludeStrs.split(","));
        for (int i = 0; i < sc.size(); i++) {
            sc.set(i, sc.get(i).trim());
        }

        // product categories
        List<String> ss = Arrays.asList(data.split(","));
        for (int i = 0; i < ss.size(); i++) {
            ss.set(i, ss.get(i).trim());
        }

        // containsOrEquals => 1-contains 2-equals
        if (!isEmptyOrNull(excludeStrs)) {
            for (int i = 0; i < sc.size(); i++) {
                String d = sc.get(i);
                if ("1".equals(containsOrEquals)) {
                    ss = ss.stream()
                            .distinct()
                            .filter(el -> !el.toUpperCase().contains(d.toUpperCase()))
                            .collect(Collectors.toList());
                } else {
                    ss = ss.stream()
                            .distinct()
                            .filter(el -> !el.toUpperCase().equals(d.toUpperCase()))
                            .collect(Collectors.toList());
                }
            }
        } else {
            ss = ss.stream()
                    .distinct()
                    .collect(Collectors.toList());
        }

        String ssss = String.join(",", ss);
        return ssss;
    }

    private String GetOrderProductTypeList() {
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

    private String GetIsOrderItem(String val) {
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
    private String GetOrderFieldFirstLEvelValue(String field, Boolean mandatory) throws Exception{
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
    private JSONObject GetOrderFirstLevelAtrrValue(String field, String key, Boolean mandatory) throws Exception {
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
    private void GetOrderItemLevelAtrrValue(String productType, String field, String key, Boolean mandatory)
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

    private String GetOrderItemLevelValue(String productType, String atrribute, Boolean mandatory) {
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

    private String GetItemDinamicValue(JSONObject itemdat, String field) {
        String res = "";
        try {
            JSONObject atrr = itemdat.getJSONObject("JSONAttribute");

            Iterator<String> keys = atrr.keys();
            while (keys.hasNext()) {
                String nkey = keys.next();
                JSONArray a = atrr.getJSONArray(nkey);
                int itemattrcount = a.length();
                String newkey = "";
                for (int j = 0; j < itemattrcount; j++) {
                    itemattrdata = a.getJSONObject(j);
                    String datatypr = GetJsonObjectStringValue(itemattrdata.get("valuedatatype__c"));
                    String valp = GetJsonObjectStringValue(itemattrdata.get("attributeuniquecode__c"));
                    if (field.equals(valp)) {
                        if ("Picklist".equals(datatypr)) {
                            try {
                                res = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo")
                                        .getJSONObject("selectedItem").get("value"));
                                return res;
                            } catch (Exception e) {
                                return "";
                            }
                        } else {
                            try {
                                res = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo").get("value"));
                                return res;
                            } catch (Exception e) {
                                return "";
                            }
                        }
                    }
                }
            } // end of -> while (keys.hasNext()) {
        } catch (Exception e) {
            res = "";
        }
        return res;
    }

    private void GetOrderItemLevelAtrrDinamicValue(String productType, String atrribute, String key) {
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

    private String GetJsonObjectStringValue(JSONObject data, String jsonfieldName, boolean mandatory) throws Exception {
        String result = "";
        try {
            result = GetJsonObjectStringValue(data.get(jsonfieldName));
        } catch (Exception e) {
            if (mandatory) {
                throw new Exception("Field: " + jsonfieldName + " is mandatory");
            } else {
                result = "";
            }
        }
        return result;
    }

    private String GetJsonObjectStringValue(Object objvalue) {
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

    private String GetItemServiceAddressKey() throws Exception {
        //ItemServiceAddressKey
        String res = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                res = GetJsonObjectStringValue(itemdata, "ItemServiceAddressKey", false);
                if (!isEmptyOrNull(res)) {
                    return res;
                }
            }
        }
        return res;
    }

    private void GetOrderItemLevelOrderTotalSumm(String productType, String field, String key) {
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

    private boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
