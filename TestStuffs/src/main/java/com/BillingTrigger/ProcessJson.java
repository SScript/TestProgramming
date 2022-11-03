package com.BillingTrigger;

import java.math.BigDecimal;

import java.math.RoundingMode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import javax.naming.InitialContext;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;

public class ProcessJson {

    protected JSONObject orderdata;
    protected JSONArray orderdataitems;
    protected JSONObject itemdata;
    protected JSONObject itemattrdata;
    protected JSONObject jsonData;
    protected JSONArray orderAtrrItems;
    protected boolean isOrderItems = true;
    protected boolean isAddressFound = false;
    protected Resp result;
    protected JSONObject responseVlocJson;
    protected JSONObject order;
    protected JSONObject orderItems;
    protected String orderedService = "";
    protected String paymentMode = "";

    public Resp doTransform(String inJsonData, String excludeStrs, String containsOrEquals, String caller) {
        orderdata = new JSONObject(inJsonData);
        orderAtrrItems = new JSONArray();
        orderdataitems = new JSONArray();
        isAddressFound = false;
        isOrderItems = true;
        jsonData = new JSONObject();
        itemattrdata = new JSONObject();
        itemdata = new JSONObject();
        responseVlocJson = new JSONObject();
        order = new JSONObject();
        orderItems = new JSONObject();
        String AccountAddressId = "";
        String billActivationDate = "";

        result = new Resp();

        paymentMode = "";
        String orderedServiceType = "";

        order.put("Status", "Billing Activation Failed");
        order.put("GroupId", "");

        try {
            paymentMode = GetOrderFieldFirstLEvelValue("PaymentMode", true);
            String s = "";
            billActivationDate = getBillActivationDate(GetOrderFieldFirstLEvelValue("OrderDate", true));

            // uzreiz dab�nam orderId un orderNumber
            result.OrderId = GetOrderFieldFirstLEvelValue("OrderId", true);
            order.put("OrderId", result.OrderId);

            result.OrderNumber = GetOrderFieldFirstLEvelValue("OrderNumber", true);
            order.put("OrderNumber", result.OrderNumber);

            // OrderItems var neb�t
            try {
                Object orderdataitems_o = orderdata.get("OrderItems");
                if (orderdataitems_o instanceof JSONArray) {
                    orderdataitems = (JSONArray) orderdataitems_o;
                }
                if (orderdataitems_o instanceof JSONObject) {
                    orderdataitems = new JSONArray();
                    orderdataitems.put(orderdataitems_o);
                }
                isOrderItems = true;
            } catch (Exception e) {
                isOrderItems = false;
            }

            jsonData.put("orderid", GetOrderFieldFirstLEvelValue("OrderId", true))
                    .put("orderno", GetOrderFieldFirstLEvelValue("OrderNumber", true))
                    .put("orderdate", FormatDate(GetOrderFieldFirstLEvelValue("OrderDate", true)))
                    .put("ordernotes", GetOrderFieldFirstLEvelValue("Notes", false))
                    .put("caller", caller);

            order.put("BillActivationDate", billActivationDate);
            orderItems.put("BillActivationDate", billActivationDate);
            orderItems.put("ServiceActivationDate", "");
            orderItems.put("Status", "Billing Activation Failed");
            orderItems.put("GroupId", "");

            orderAtrrItems.put(new JSONObject().put("value", java.util.UUID.randomUUID().toString()).put("key", "ORD_REQUEST_ID"));
            
            //If OrderedService is null or not send, then use default value - 'Split payment'
            orderedService = GetOrderFieldFirstLEvelValue("OrderedService", false);
            if (!"".equals(orderedService)) {
                orderAtrrItems.put(new JSONObject().put("value", orderedService).put("key", "ORD_ORDEREDSERVICE"));
            } else {
                orderAtrrItems.put(new JSONObject().put("value", "Split payment").put("key", "ORD_ORDEREDSERVICE"));
                orderedService = "Split payment";
            }

            // p�rbaudam adresi
            if (!"Split payment".equalsIgnoreCase(orderedService)) {
                // priek� Electricity - <ItemServiceAddressKey>
                AccountAddressId = GetItemServiceAddressKey();
            } else {
                // "AddressKey" nav oblig�ts
                AccountAddressId = GetOrderFieldFirstLEvelValue("AddressKey", false);
            }
            result.addressinfo = "AccountAddressId " + AccountAddressId + " orderedService: " + orderedService;
            try {
                if (!isEmptyOrNull(AccountAddressId)) {
                    isAddressFound = false;
                    GetOrderAddressData(AccountAddressId);
                    result.addressinfo = "Adrese : " + AccountAddressId + "  atrasta = " + String.valueOf(isAddressFound) + "  : " + orderedService;
                    if (!isAddressFound) {
                        result.RetCode = "SOA_164[003]";
                        result.RetMsg = "Adrese : " + AccountAddressId + " nav atrasta.";
                        order.put("ErrorCode", "SOA_164[004");
                        order.put("Description", "Adrese : " + AccountAddressId + " nav atrasta.");
                        orderItems.put("ErrorCode", "SOA_164[004");
                        orderItems.put("Description", "Adrese : " + AccountAddressId + " nav atrasta.");
                        return result;
                    }
                }
            } catch (Exception e) {
                // ja addresskey padod k� sviestainu stringu, tad ir k��da �eit
                result.RetCode = "SOA_164[003]";
                result.RetMsg = "Adrese : " + AccountAddressId + " nav atrasta.";
                order.put("ErrorCode", "SOA_164[004");
                order.put("Description", "Adrese : " + AccountAddressId + " nav atrasta.");
                orderItems.put("ErrorCode", "SOA_164[004");
                orderItems.put("Description", "Adrese : " + AccountAddressId + " nav atrasta.");
                return result;
            }

            // Ja <OrderedService> = 'Split Payment' (SOAIP-1413), tad un <PaymentMode> ir :
            if ("Split payment".equalsIgnoreCase(orderedService)) {
                SetOrderProductTypeList(excludeStrs, containsOrEquals);
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_CTA_SUM"));
                try {
                    switch (paymentMode) {
                        case "Split Payment":
                            orderAtrrItems.put(new JSONObject().put("value", "SP").put("key", "ORD_PAYMENT_TYPE"));
                            jsonData.put("serviceno", GetOrderItemLevelValue("SplitPayment", "ServiceId"));
                            orderItems.put("ServiceNumber", GetOrderItemLevelValue("SplitPayment", "ServiceId"));
                            break;
                        case "Full Payment":
                            orderAtrrItems.put(new JSONObject().put("value", "FP").put("key", "ORD_PAYMENT_TYPE"));
                            orderAtrrItems.put(new JSONObject().put("value", GetOrderFieldFirstLEvelValue("OrderNumber", true)).put("key", "serviceno"));
                            jsonData.put("serviceno", GetOrderFieldFirstLEvelValue("OrderNumber", true));
                            orderItems.put("ServiceNumber", "");
                            // SOAIP-1950 full payment gad�jum� vajadz�ja serviceno padot Vlocity header l�men�
                            break;
                        default:
                            orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_PAYMENT_TYPE"));
                            jsonData.put("serviceno", "");
                            orderItems.put("ServiceNumber", "");
                            break;
                    }
                } catch (Exception e) {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_PAYMENT_TYPE"));
                    jsonData.put("serviceno", "");
                }


                GetOrderItemLevelOrderTotalSumm("ConsumerGoods", "OneTimeCharge", "ORD_INSTALLMENT_SUM"); //(SOAIP-1012)
                if (isOrderItems) {
                    orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("Insurance"))
                            .put("key", "ORD_INSURANCE_FLAG"));
                    orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("Warranty"))
                            .put("key", "ORD_WARRANTY_FLAG"));
                    orderAtrrItems.put(new JSONObject().put("value", GetIsOrderItem("PersonalLiabilityInsurance"))
                            .put("key", "ORD_CTA_FLAG"));
                }

                // vajag tikai ciparu, kas ir l�dz "-" simbolam
                s = GetOrderFieldFirstLEvelValue("DownPaymentBillNo", false);
                if (!"".equals(s)) {
                    if (s.contains("-")) {
                        orderAtrrItems.put(new JSONObject().put("value", s.substring(0, s.indexOf("-")))
                                .put("key", "ORD_DP_BILL_NO"));
                    } else {
                        orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_DP_BILL_NO"));
                    }
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_DP_BILL_NO"));
                }

            } else {
                s = GetOrderItemFieldRootObject("Electricity", "Electricity", "RootObject", "ServiceId", true);
                orderAtrrItems.put(new JSONObject().put("value", isEmptyOrNull(s) ? "" : s).put("key", "serviceno"));
                jsonData.put("serviceno", isEmptyOrNull(s) ? "" : s);
            }

            // saliekam atrib�tus
            orderAtrrItems.put(GetOrderFirstLevelAtrrValue("AccountNo", "ORD_CUSTOMERNO", true));
            orderAtrrItems.put(GetOrderFirstLevelAtrrValue("BillAccountNumber", "ORD_BILLINGACCOUNTNO", true));

            // j�b�t form�t� �DD/MM/YYYY�. Ien�ko�ias - YYYY-MM-DD.
            if ("Split payment".equalsIgnoreCase(orderedService)) {
                s = GetOrderFieldFirstLEvelValue("BillActivationDate", true);
            } else {
                // j�nem no "Electricity.RootObject.BillActivationDate"
                s = GetOrderItemFieldRootObject(
                        "Electricity", "Electricity",
                        "RootObject",
                        "BillActivationDate",
                        true);
            }
            if (!"".equals(s)) {
                orderAtrrItems.put(new JSONObject().put("value", FormatDateShort(s)).put("key", "ORD_BILLING_ACTIVATION_DATE"));
            } else {
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_BILLING_ACTIVATION_DATE"));
            }

            jsonData.put("orderOffers", ProcessOrderPricing());

            if ("Split payment".toUpperCase().equals(orderedService.toUpperCase())) {
                orderAtrrItems.put(GetOrderFirstLevelAtrrValue("OrderedServiceType", "ORD_ORDEREDSERVICETYPE", false));
                orderedServiceType = GetOrderFieldFirstLEvelValue("OrderedServiceType", true);

                // (SOAIP-1110) Ja <OrderedServiceType> = 'Change'
                if ("Change".equals(orderedServiceType) && isOrderItems) {
                    ProcessIfOrderedServiceTypeIsChange("ORD_CE_CANCEL_FLAG");
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_CE_CANCEL_FLAG"));
                }
            } else {
                s = GetOrderItemFieldRootObject(
                        "Electricity", "Electricity",
                        "RootObject",
                        "OrderedServiceType",
                        false);
                orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ORDEREDSERVICETYPE"));
            }

            //"RemovalReason", "ORD_REASON_ID"
            if ("Split payment".equalsIgnoreCase(orderedService)) {
                s = GetOrderFieldFirstLEvelValue("RemovalReason", false);
            } else {
                // j�nem no "Electricity.RootObject.BillActivationDate"
                s = GetOrderItemFieldRootObject(
                        "Electricity", "Electricity",
                        "RootObject",
                        "RemovalReason",
                        false);
            }
            if (!"".equals(s)) {
                orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_REASON_ID"));
            } else {
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_REASON_ID"));
            }

            //"OrderItemId", "ORD_ORDERITEMID"
            if ("Split payment".equalsIgnoreCase(orderedService)) {
                GetOrderItemLevelAtrrValue("SplitPayment", "OrderItemId", "ORD_ORDERITEMID", true);
            } else {
                // j�nem no "Electricity.RootObject.BillActivationDate"
                s = GetOrderItemFieldRootObject(
                        "Electricity", "Electricity",
                        "RootObject",
                        "OrderItemId",
                        true);
                if (!"".equals(s)) {
                    orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ORDERITEMID"));
                    orderItems.put("OrderItemID", s);
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_ORDERITEMID"));
                    orderItems.put("OrderItemID", "");
                }
            }
            //-----------
            if ("Split payment".equalsIgnoreCase(orderedService)) {
                // CE Restructuring.PaymentDelayPercents
                GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Atlik�anas procenti", "ORD_PAYMENT_DELAY_PERCENT");
                // CE Restructuring.PaymentDelayMonths
                GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Atlik�anas m�ne�u skaits", "ORD_PAYMENT_DELAY_MONTHS");
                // CE Restructuring.RepayMonths
                GetOrderItemLevelAtrrDinamicValue("CE Restructuring", "Uzkr�to summu izmaksa m�ne�os", "ORD_REPAY_MONTHS");

                GetOrderItemLevelAtrrValue("Shipping", "AccountingCode", "ORD_COURIERPRODUCTID", false);
                GetOrderItemLevelAtrrValue("Shipping", "OneTimeCharge", "ORD_COURIERCHARGE", false);
                GetOrderItemLevelAtrrDinamicValue("PersonalLiabilityInsurance", "Term", "ORD_CTA_MONTHS");
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Warranty Delayed Months", "ORD_CTA_MONTHS_DELAY");
                GetOrderItemLevelAtrrValue("SplitPayment", "OneTimeCharge", "ORD_FIRST_PAYMENT", true);
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_MONTHS");
                orderAtrrItems.put(GetOrderFirstLevelAtrrValue("MonthDelay", "ORD_MONTH_DELAY", false));
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_INSURANCE_MONTHS");
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Term", "ORD_WARRANTY_MONTHS");
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Total Insurance", "ORD_INSURANCE_SUM");
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Delayed Months-Insurance", "ORD_INSURANCE_MONTHS_DELAY");
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Total Warranty", "ORD_WARRANTY_SUM");
                GetOrderItemLevelAtrrDinamicValue("SplitPayment", "Delayed Months-Warranty", "ORD_WARRANTY_MONTHS_DELAY");

            }

            if ("Electricity".equalsIgnoreCase(orderedService) && isOrderItems) {
                orderedServiceType = GetJsonObjectStringValue((JSONObject) orderdataitems.get(0), "OrderedServiceType", false);
                GetOrderItemLevelWithActionVAlue("ORD_PAYMENT_METHOD", "ORD_PAYMENT_METHOD", "Remove".equalsIgnoreCase(orderedServiceType));
                GetOrderItemLevelWithActionVAlue("ORD_PRICE_TYPE", "ORD_PRICE_TYPE", "Remove".equalsIgnoreCase(orderedServiceType));
                GetOrderItemLevelWithActionVAlue("ORD_LINE_ID", "ORD_LINE_ID", "Remove".equalsIgnoreCase(orderedServiceType));
                GetOrderItemLevelWithActionVAlue("ORD_PRICE_ID", "ORD_PRICE_ID", "Remove".equalsIgnoreCase(orderedServiceType));
                GetOrderItemLevelWithActionVAlue("ORD_CONTRACT_LENGTH", "ORD_CONTRACT_LENGTH", "Remove".equalsIgnoreCase(orderedServiceType));

                // "ORD_PRICE_KWH"
                // If <OrderedService> nav 'Split Payment', tad tiek pievienots dinamiskais parametrs ar key = 'ORD_PRICE_KWH'
                // un value - tiek noteikta no OrderItem ar <ProductSubType> = 'Plan' un ar <OrderItemAction> = 'ADD', OrderPricing ieraksta ar <Source> = 'Base':
                //ja VATExclusive = 'N', tad value = round(<OrderItem.OrderPricing.Amount> devide with (1.<OrderItem.OrderPricing.VatRate>),2)
                //pretej� gadijum� - value = <OrderItem.OrderPricing.Amount>
                s = GetORD_PRICE_KWHValue();
                orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_PRICE_KWH"));
            }

            if ("Electricity".equalsIgnoreCase(orderedService)) {
                // j�nem no "Electricity.RootObject.BillActivationDate"
                s = GetOrderItemFieldAtrrrObject(
                        "Electricity", "Electricity",
                        "TechnicalObject",
                        "ATT_ELE_CONSUMP",
                        false);
                orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_AVG_CONS_KWH"));
                s = GetOrderItemFieldAtrrrObject(
                        "Electricity", "Electricity",
                        "TechnicalObject",
                        "ATT_ELE_ST_TRF",
                        false);
                orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ST_TP_CODE"));
                s = GetOrderItemFieldAtrrrObject(
                        "Electricity", "Electricity",
                        "TechnicalObject",
                        "ATT_ELE_INCURRENT_VAL",
                        false);
                orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_AMPERAGE"));
            }

            orderAtrrItems.put(new JSONObject().put("value", GetUnicalOrederIdCount()).put("key", "ORD_SERVICE_COUNT"));
            //-----------

            jsonData.put("orderdetails", orderAtrrItems);

        } catch (Exception e) {
            if (e.getMessage().contains("mandatory")) {
                result.RetCode = "SOA_164[095]";
                result.RetMsg = e.getMessage();
                order.put("ErrorCode", "SOA_164[004");
                order.put("Description", e.getMessage());
                orderItems.put("ErrorCode", "SOA_164[004");
                orderItems.put("Description", e.getMessage());
                result.responseVlocJson = responseVlocJson.toString();
            } else {
                result.RetCode = "SOA_164[099]";
                result.RetMsg = "Global error: " + e.getMessage();
                order.put("ErrorCode", "SOA_164[004");
                order.put("Description", e.getMessage());
                orderItems.put("ErrorCode", "SOA_164[004");
                orderItems.put("Description", e.getMessage());
                result.responseVlocJson = responseVlocJson.toString();
            }
            return result;
        }



        order.put("OrderItem", new JSONArray().put(orderItems));
        responseVlocJson.put("Order", new JSONArray().put(order));


        result.SendJsonStr = jsonData.toString();
        result.RetCode = "1";
        result.RetMsg = "OK";
        result.responseVlocJson = responseVlocJson.toString();

        return result;
    }

    private int GetUnicalOrederIdCount() throws Exception {
        int res = 0;
        JSONObject itemdat = null;
        String serviceId = "";
        int itemcount = orderdataitems.length();
        List<String> mylist = new ArrayList<>();

        for (int i = 0; i < itemcount; i++) {
            itemdat = orderdataitems.getJSONObject(i);
            serviceId = GetJsonObjectStringValue(itemdat, "ServiceId", false);
            if (!isEmptyOrNull(serviceId)) {
                mylist.add(serviceId);
            }
        }
        List<String> distinctElements = mylist.stream()
                .distinct()
                .collect(Collectors.toList());
        return (distinctElements.size() == 0 ? 1 : distinctElements.size());  // SOAIP-2733, ja nulle, tad default atgrie� 1
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
        // pretej� gadijum� - value = <OrderItem.OrderPricing.Amount>
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

    private String TranslateOrderPricingSource(String source, JSONObject itemdata) throws Exception {
        // ar switchu laikam nesan�ktu, saglab�ju tikm�r tepat ieprieks�jo gabalu
        //            switch (source.toUpperCase()) {
        //                case "BASE": return "C";
        //                case "PROMOTION": return "A";
        //                default : return "";
        //            }

        String OCPPackageCode = GetJsonObjectStringValue(itemdata, "OCPPackageCode", false);
        String OCPPlanCode = GetJsonObjectStringValue(itemdata, "OCPPlanCode", false);
        String UnicornSpecialDiscountCode = GetJsonObjectStringValue(itemdata, "UnicornSpecialDiscountCode", false);

        if (source.equalsIgnoreCase("BASE") || source.equalsIgnoreCase("ABP")) {
            return "C";
        } else {

            if (!OCPPackageCode.isEmpty() || !OCPPlanCode.isEmpty() || !UnicornSpecialDiscountCode.isEmpty()) {
                return "D";
            } else {
                return "A";
            }
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

    private String TranslateOrderLineSubType(String source, String chargeType, JSONObject itemdata) throws Exception {
        //            switch (TranslateOrderPricingSource(source, itemdata)) {
        //                case "C": return chargeType;
        //                case "A": return "Debit";
        //                default : return "";
        //            }

        if (TranslateOrderPricingSource(source, itemdata).equals("C")) {
            switch (chargeType.toUpperCase()) {
                case "RECURRING": return "RC";
                case "ONE-TIME": return "NRC";
                case "USAGE": return "USAGE";
                default : return "";
            }
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

    private String getUnicornPlanCode(JSONObject itemdata, JSONArray data, String orderedServiceType) {
        String res = "";
        JSONObject itemdata1 = null;
        int itemcount = data.length();
        String prdtSubType = "";
        String orderItemAction = "";

        prdtSubType = GetJsonObjectStringValue(itemdata.get("ProductSubType"));
        try {
            if ("Remove".equalsIgnoreCase(orderedServiceType)) {
                for (int i = 0; i < itemcount; i++) {
                    itemdata1 = orderdataitems.getJSONObject(i);
                    prdtSubType = GetJsonObjectStringValue(itemdata1.get("ProductSubType"));
                    if ("Plan".equalsIgnoreCase(prdtSubType)) {
                        return GetJsonObjectStringValue(itemdata1.get("UnicornPlanCode"));
                    }
                }
            } else {
                if ("Plan".equalsIgnoreCase(prdtSubType)) {
                    return GetJsonObjectStringValue(itemdata.get("UnicornPlanCode"));
                } else {
                    for (int i = 0; i < itemcount; i++) {
                        itemdata1 = orderdataitems.getJSONObject(i);
                        prdtSubType = GetJsonObjectStringValue(itemdata1.get("ProductSubType"));
                        orderItemAction = GetJsonObjectStringValue(itemdata1.get("OrderItemAction"));
                        if ("Plan".equalsIgnoreCase(prdtSubType) && "Add".equalsIgnoreCase(orderItemAction)) {
                            return GetJsonObjectStringValue(itemdata1.get("UnicornPlanCode"));
                        }
                    }
                }
            }
        } catch (Exception e) {
            res = "";
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
            String ORDER_LINE_PLAN_CODE_VALUE = ""; // p�rnesu zem for loopa, sav�d�k string variabl� saglab�jas v�rt�ba no iepriek��ja cikla
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

                    // orderpricing var b�t mas�vs
                    JSONArray pricdata = GetJSONArrObj(itemdata, "OrderPricing");
                    int itempriccount = pricdata.length();
                    for (int j = 0; j < itempriccount; j++) {
                        objOrdPricing = pricdata.getJSONObject(j);
                        String sourcestr = GetJsonObjectStringValue(objOrdPricing, "Source", false);

                        String orderedServiceType = GetJsonObjectStringValue(itemdata.get("OrderedServiceType"));

                        if ("Promotion".equalsIgnoreCase(sourcestr)) {
                            ORDER_LINE_PLAN_CODE_VALUE = GetJsonObjectStringValue(objOrdPricing, "OCPPlanCode", false);
                            ORDER_LINE_PACKAGE_CODE = GetJsonObjectStringValue(objOrdPricing, "OCPPackageCode", false);
                            ORDER_LINE_PROMOTION_UOM = GetJsonObjectStringValue(objOrdPricing, "TimePlanUnit", false);
                            ORDER_LINE_PROMOTION_UOM = ORDER_LINE_PROMOTION_UOM.substring(0,1);  // Translate Day -> D | Month -> M
                        } else if ("Base".equalsIgnoreCase(sourcestr)){
                            ORDER_LINE_PLAN_CODE_VALUE = getUnicornPlanCode(itemdata, orderdataitems, orderedServiceType);
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
                                        // �is tika iz�emts ar SOAIP-1943, pagaid�m atst�ju aizkoment�tu
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
                        if ("ORDER_LINE_PLAN_CODE".equalsIgnoreCase(field)) {
                            // �is ir j��em, kur subtype ir "Plan"
                            // no itemdatiem
                            //JSONArray a = GetJSONArrObj(itemdata, "OrderPricing");
                            //int ic = a.length();
                            //String ordppric = "";
                            //JSONObject od = null;
                            //for (int icc = 0; icc < ic; icc++) {
                            //    od = a.getJSONObject(icc);
                            //    ordppric = od.getString("");
                            //}
                            val = GetJsonObjectStringValue(itemdata.get(field));
                        } else {
                            // no dinamiskajiem
                            val = GetItemDinamicValue(itemdata, field);
                        }
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
        // ja <OrderedServiceType> nav  'Remove', tad sekojo�ie dinamiskie parametri tiks aizpild�ti no OrderItem ar <ProductSubType> = 'Plan'
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
        (SOAIP-1110) Ja <OrderedServiceType> = 'Change' un ir kaut viens OrderItem ar <OrderSubType> = 'Delete Insurance/Warranty' un:
        a. Order� ir ��di OrderItem  gan ar <ProductType> = 'Warranty', gan ar <ProductType> = 'Insurance' (j��em v�r� tikai tiek OrderItem, kuriem <OrderItemSubType> = 'Delete Insurance/Warranty'),
            tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'WI';
        b. ja atbilsto�iem OrderItem  <ProductType> ir tikai 'Warranty', tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'W';
        b. ja atbilsto�iem OrderItem  <ProductType> ir tikai 'Insurance', tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'I'.
        Ja ir cits <OrderedServiceType> vai nav OrderItem ar atbilsto�u <OrderItemSubType>, tad tiek pievienots dinamiskais parametrs ar key =ORD_CE_CANCEL_FLAG un tuk�u v�rt�bu.
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
            } catch (Exception e) {
            }
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

        if (counterW > 0 && counterI > 0) {
            val = "WI";
        }
        if (counterW > 0 && counterI == 0) {
            val = "W";
        }
        if (counterW == 0 && counterI > 0) {
            val = "I";
        }

        orderAtrrItems.put(new JSONObject().put("value", val).put("key", key));
    }

    public String getBillActivationDate(String billDate) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String billActivationDate = "";
        try {
            Date date = simpleDateFormat.parse(billDate);
            billActivationDate = simpleDateFormat.format(date);
        } catch (Exception ex) {
            billActivationDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());;
        }

        return billActivationDate;

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
        // ir   -> 2020-07-15
        // vaig -> 15/07/2020
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
        if (res.length() > 3999) {
            res = res.substring(0, 3999);
        }

        orderAtrrItems.put(new JSONObject().put("value", res).put("key", "ORD_PRODUCTCATEGORY"));
    }

    private String FormatProductCategoriesString(String data, String excludeStrs, String containsOrEquals) {
        // iz�emamie v�rdi
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

    private String GetIsOrderItem(String val) {
        String res = "N";
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
        return res;
    }

    /**
     * Order pirm� l�me�a parametrs
     * Ja ir, tad agrie� v�rt�bu, ja nav parametra, tad v�rt�ba ir tuk�ums
     *
     * @return
     */
    private String GetOrderFieldFirstLEvelValue(String field, Boolean mandatory) throws Exception {
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

    /**
     * Order pirm� l�me�a atrib�tu parametrs
     *
     * @return
     */
    private JSONObject GetOrderFirstLevelAtrrValue(String field, String key,
                                                   Boolean mandatory) throws Exception {
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

    private String GetOrderItemLevelValue(String productType, String atrribute) {
        boolean foundinitemsvalue = false;
        String value = "";

        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // mekl�jam atbilso�o item p�c productType
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

    /**
     * Order pirm� l�me�a atrib�tu parametrs
     *
     * @return
     */
    private void GetOrderItemLevelAtrrValue(String productType, String field, String key,
                                            Boolean mandatory) throws Exception {
        boolean foundinitemsvalue = false;
        // ja ir padoti orderitems
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // mekl�jam atbilso�o item p�c productType
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
                    // ja oblig�ts un tuk�s, tad error
                    if (mandatory && isEmptyOrNull(val)) {
                        throw new Exception("Field " + field + " is mandatory");
                    } else {
                        orderAtrrItems.put(new JSONObject().put("value", val).put("key", newkey));
                        if ("OrderItemId".equalsIgnoreCase(field)) {
                            orderItems.put("OrderItemId", val);
                        }
                    }
                    if ("Shipping".equals(productType)) {
                        counter++;
                    }
                }
            }

            if (!foundinitemsvalue) {
                // SOAIP-2739
                if ("Split payment".equalsIgnoreCase(orderedService) && "ORD_ORDERITEMID".equalsIgnoreCase(key)) {
                    // mekl�jam pirmo ar Order Item ar ProductType = ConsumerGoods
                    if ("Full Payment".equalsIgnoreCase(paymentMode)) {
                        for (int i = 0; i < itemcount; i++) {
                            itemdata = orderdataitems.getJSONObject(i);
                            productTypeValue = GetJsonObjectStringValue(itemdata.get("ProductType"));
                            if ("ConsumerGoods".equalsIgnoreCase(productTypeValue)) {
                                val = GetJsonObjectStringValue(itemdata.get("OrderItemId"));
                                orderAtrrItems.put(new JSONObject().put("value", val).put("key", key));
                                break;
                            }
                        }
                    }
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                }
            }

        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
    }

    private void GetOrderItemLevelAtrrDinamicValue(String productType, String atrribute, String key) {
        boolean foundValue = false;
        boolean addEmptyValue = false;
        boolean isFoundProdType = false;
        Map<String, String> nameMatch = new HashMap<>();

        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // mekl�jam atbilso�o item p�c productType
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
                                                    .getJSONObject("selectedItem")
                                                    .get("value"));
                                            foundValue = true;
                                        } catch (Exception e) {
                                            val = "";
                                            addEmptyValue = true;
                                        }
                                    } else {
                                        try {
                                            val =
                                                    GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo")
                                                            .get("value"));
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

                                    //If any amount parameter (say ORD_WARRANTY_SUM) is 0, there is no need to send 0. You can pass: ��.
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
            // var b�t, ka neatrod ProductType, tad ar� vaig pielikt tuk�u
            if (!isFoundProdType && !nameMatch.containsKey(key)) {
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
            }
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
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

    private void GetOrderAddressData(String AccountAddressId) throws Exception {

        DataSource ds = null;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        StringBuilder sb = new StringBuilder();

        // ja ir padota addreses kods
        if (!isEmptyOrNull(AccountAddressId)) {
            String sql =
                    "select addressconcat, flatname, postofficecode, POSTOFFICEID,  nvl(othertext,'') as othertext, " +
                            "lowestlevelid, IMMOVABLEID, lowestleveltype from ak_owner.ltk_full_addresses_md where addresskey=" +
                            AccountAddressId;

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("jdbc/AKADMIN"); //eis/DB/AKADMIN
            conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.execute();
            rs = pstmt.getResultSet();
            String val = "";
            Double dval;
            while (rs.next()) {
                isAddressFound = true;
                //key = ORD_INSTLADDRPOSTOFFICEID, value - no lauka POSTOFFICEID
                dval = rs.getDouble("POSTOFFICEID");
                if (!isNull(dval)) {
                    dval = rs.getDouble("POSTOFFICEID");
                    orderAtrrItems.put(new JSONObject().put("value", String.format("%.0f", dval))
                            .put("key", "ORD_INSTLADDRPOSTOFFICEID"));
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRPOSTOFFICEID"));
                }
                //if (!isEmptyOrNull(val)) {
                //    orderAtrrItems.put(new JSONObject().put("value", val).put("key", "ORD_INSTLADDRPOSTOFFICEID"));
                //} else {
                //    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRPOSTOFFICEID"));
                //}

                //key = ORD_INSTLADDRLOWESTLEVELID, value - ja adreses lowestleveltype ir:
                //109, tad IMMOVABLEID
                //nav 109, tad LOWESTLEVELID
                dval = rs.getDouble("lowestleveltype");
                if (!isNull(dval)) {
                    if (dval == 109) {
                        dval = rs.getDouble("IMMOVABLEID");
                    } else {
                        dval = rs.getDouble("lowestlevelid");
                    }
                    orderAtrrItems.put(new JSONObject().put("value", String.format("%.0f", dval))
                            .put("key", "ORD_INSTLADDRLOWESTLEVELID"));
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRLOWESTLEVELID"));
                }

                //key = ORD_INSTLADDRLOWESTLEVELTYPE, value  - ja adreses lowestleveltype ir:
                //109, tad '108'
                //nav 109, tad LOWESTLEVELTYPE
                dval = rs.getDouble("lowestleveltype");
                if (!isNull(dval)) {
                    if (dval == 109) {
                        orderAtrrItems.put(new JSONObject().put("value", "108")
                                .put("key", "ORD_INSTLADDRLOWESTLEVELTYPE"));
                    } else {
                        orderAtrrItems.put(new JSONObject().put("value", String.format("%.0f", dval))
                                .put("key", "ORD_INSTLADDRLOWESTLEVELTYPE"));
                    }
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRLOWESTLEVELTYPE"));
                }


                //key = ORD_INSTLADDRFLAT, value  - no lauka FLATNAME
                val = rs.getString("flatname");
                if (!isEmptyOrNull(val)) {
                    orderAtrrItems.put(new JSONObject().put("value", val).put("key", "ORD_INSTLADDRFLAT"));
                } else {
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRFLAT"));
                }
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
    }

    private void GetOrderItemLevelOrderTotalSumm(String productType, String field, String key) {
        Double res = 0d;
        String v = "";
        // ja ir padoti orderitems
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            // mekl�jam atbilso�o item p�c productType
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

    private boolean isNull(Object obj) {
        if (null == obj) {
            return true;
        }
        return false;
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
}
