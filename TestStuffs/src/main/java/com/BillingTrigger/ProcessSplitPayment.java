package com.BillingTrigger;

import org.json.JSONObject;

public class ProcessSplitPayment extends JSonDataFunctions {

    private final String excludeStrs;
    private final String containsOrEquals;

    public ProcessSplitPayment(String inFullData, String excludeStrs, String containsOrEquals, String env) throws Exception {
        super(inFullData, env);
        this.excludeStrs = excludeStrs;
        this.containsOrEquals = containsOrEquals;
        //ProcessForSplitPayment();
    }

    public Resp ProcessForSplitPayment() throws Exception {
        Resp result = new Resp();
        JSONObject jsonData = new JSONObject();

        // addFieldToOutDataData("serviceno", GetServiceNoFromServiceBundle()); -> visiem
        addFieldToOutDetailsDataData("", "ORD_CTA_SUM");

        switch (GetBaseData().getPaymentMode()) {
            case "Split Payment":
                addFieldToOutDetailsDataData("SP", "ORD_PAYMENT_TYPE");
                addFieldToOutDetailsDataData(GetOrderItemLevelValue("SplitPayment", "ServiceId"), "serviceno");
                break;
            case "Full Payment":
                addFieldToOutDetailsDataData(GetBaseData().getOrderNumber(), "serviceno");
                addFieldToOutDetailsDataData("FP", "ORD_PAYMENT_TYPE");
                addFieldToOutDetailsDataData(GetBaseData().getOrderNumber(), "serviceno");
                break;
            default:
                addFieldToOutDetailsDataData("", "ORD_PAYMENT_TYPE");
                addFieldToOutDetailsDataData("", "serviceno");
                break;
        }

        // ja ir padota adrese
        if (!isEmptyOrNull(GetBaseData().getAddressKey())) {

        }
        //GetOrderFieldFirstLEvelValue("AddressKey", false);

        SetOrderProductTypeList(this.excludeStrs, this.containsOrEquals);
        GetOrderItemLevelOrderTotalSumm("ConsumerGoods", "OneTimeCharge", "ORD_INSTALLMENT_SUM");
        addFieldToOutDetailsDataData(GetIsOrderItemWithProductType("Insurance"), "ORD_INSURANCE_FLAG");
        addFieldToOutDetailsDataData(GetIsOrderItemWithProductType("Warranty"), "ORD_WARRANTY_FLAG");
        addFieldToOutDetailsDataData(GetIsOrderItemWithProductType("PersonalLiabilityInsurance"), "ORD_CTA_FLAG");
        //---
        addFieldToOutDetailsDataData(FormatDownPaymentsBillNo(), "ORD_DP_BILL_NO");

        addFieldToOutDetailsDataData(GetBaseData().getOrderedServiceType(), "ORD_ORDEREDSERVICETYPE");
        // ORD_BILLING_ACTIVATION_DATE
        addFieldToOutDetailsDataData(FormatDateShort(GetBaseData().getBillActivationDate()), "ORD_BILLING_ACTIVATION_DATE");

        if ("Change".equals(GetBaseData().getOrderedServiceType()) && getOrderDataItems().length() > 0) {
            //ProcessIfOrderedServiceTypeIsChange("ORD_CE_CANCEL_FLAG");
            addFieldToOutDetailsDataData(ProcessIfOrderedServiceTypeIsChange(), "ORD_CE_CANCEL_FLAG");
        } else {
            addFieldToOutDetailsDataData("", "ORD_CE_CANCEL_FLAG");
        }
        addFieldToOutDetailsDataData(GetBaseData().getRemovalReason(), "ORD_REASON_ID");

        //"OrderItemId", "ORD_ORDERITEMID"
        GetOrderItemLevelAtrrValue("SplitPayment", "OrderItemId", "ORD_ORDERITEMID", true);

        // CE Restructuring.PaymentDelayPercents
        GeOrderItemsDinamicAtrrValueByProductType("CE Restructuring", "Atlikðanas procenti", "ORD_PAYMENT_DELAY_PERCENT");
        // CE Restructuring.PaymentDelayMonths
        GeOrderItemsDinamicAtrrValueByProductType("CE Restructuring", "Atlikðanas mçneðu skaits", "ORD_PAYMENT_DELAY_MONTHS");
        // CE Restructuring.RepayMonths
        GeOrderItemsDinamicAtrrValueByProductType("CE Restructuring", "Uzkrâto summu izmaksa mçneðos", "ORD_REPAY_MONTHS");

        GetOrderItemLevelAtrrValue("Shipping", "AccountingCode", "ORD_COURIERPRODUCTID", false);
        GetOrderItemLevelAtrrValue("Shipping", "OneTimeCharge", "ORD_COURIERCHARGE", false);
        GeOrderItemsDinamicAtrrValueByProductType("PersonalLiabilityInsurance", "Term", "ORD_CTA_MONTHS");
        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Warranty Delayed Months", "ORD_CTA_MONTHS_DELAY");
        GetOrderItemLevelAtrrValue("SplitPayment", "OneTimeCharge", "ORD_FIRST_PAYMENT", true);
        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Term", "ORD_MONTHS");

        // ORD_MONTH_DELAY
        addFieldToOutDetailsDataData(GetBaseData().getMonthDelay(), "ORD_ORDEREDSERVICETYPE");

        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Term", "ORD_INSURANCE_MONTHS");
        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Term", "ORD_WARRANTY_MONTHS");
        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Total Insurance", "ORD_INSURANCE_SUM");
        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Delayed Months-Insurance", "ORD_INSURANCE_MONTHS_DELAY");
        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Total Warranty", "ORD_WARRANTY_SUM");
        GeOrderItemsDinamicAtrrValueByProductType("SplitPayment", "Delayed Months-Warranty", "ORD_WARRANTY_MONTHS_DELAY");

        String orderedServiceType = GetJsonObjectStringValue((JSONObject) getOrderDataItems().get(0), "OrderedServiceType", false);
        GetOrderItemLevelWithActionVAlue("ORD_PAYMENT_METHOD", "ORD_PAYMENT_METHOD", "Remove".equalsIgnoreCase(orderedServiceType));
        GetOrderItemLevelWithActionVAlue("ORD_PRICE_TYPE", "ORD_PRICE_TYPE", "Remove".equalsIgnoreCase(orderedServiceType));
        GetOrderItemLevelWithActionVAlue("ORD_LINE_ID", "ORD_LINE_ID", "Remove".equalsIgnoreCase(orderedServiceType));
        GetOrderItemLevelWithActionVAlue("ORD_PRICE_ID", "ORD_PRICE_ID", "Remove".equalsIgnoreCase(orderedServiceType));
        GetOrderItemLevelWithActionVAlue("ORD_CONTRACT_LENGTH", "ORD_CONTRACT_LENGTH", "Remove".equalsIgnoreCase(orderedServiceType));

        // return full result
        result.SendJsonStr0 = getFullOutJsonData().toString();
        return result;
    }


    private void GetOrderItemLevelWithActionVAlue(String jsonfield, String field, boolean orderedServiceTypeRemove) {
        // ja <OrderedServiceType> nav  'Remove', tad sekojoðie dinamiskie parametri tiks aizpildîti no OrderItem ar <ProductSubType> = 'Plan'
        // un ar <OrderItemAction> = 'ADD', ja <OrderedServiceType> ir 'Remove', tad no OrderItem ar <OrderItemAction> = 'Disconnect'
        int itemcount = getOrderDataItems().length();
        String orderItemAction = "";
        String prdSubType = "";
        String val = "";
        JSONObject itemdata = null;

        // ja <OrderedServiceType> ir  'Remove'
        if (orderedServiceTypeRemove) {
            //orderAtrrItems.put(GetOrderFirstLevelAtrrValue("MonthDelay", "ORD_MONTH_DELAY", false));
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                try {
                    orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                    prdSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                    if ("Disconnect".equalsIgnoreCase(orderItemAction) && "Plan".equalsIgnoreCase(prdSubType)) {
                        try {
                            val = GetJsonObjectStringValue(itemdata, jsonfield, false);
                        } catch (Exception e) {}
                        addFieldToOutDetailsDataData(val, field);
                        //orderAtrrItems.put(new JSONObject().put("value", val).put("key", field));
                        break;
                    }
                } catch (Exception e) {}
            }
        } else {
            // ja <OrderedServiceType> nav  'Remove'
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                try {
                    orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                    prdSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                    if ("ADD".equalsIgnoreCase(orderItemAction) && "Plan".equalsIgnoreCase(prdSubType)) {
                        try {
                            val = GetJsonObjectStringValue(itemdata, jsonfield, false);
                        } catch (Exception e) {
                        }
                        addFieldToOutDetailsDataData(val, field);
                        //orderAtrrItems.put(new JSONObject().put("value", val).put("key", field));
                        break;
                    }
                } catch (Exception e) {
                }
            }
        }
    }

    private String ProcessIfOrderedServiceTypeIsChange() throws Exception {
        /*
        (SOAIP-1110) Ja <OrderedServiceType> = 'Change' un ir kaut viens OrderItem ar <OrderItemSubType> = 'Delete Insurance/Warranty' un:
        a. Orderî ir ðâdi OrderItem  gan ar <ProductType> = 'Warranty', gan ar <ProductType> = 'Insurance' (jâòem vçrâ tikai tiek OrderItem, kuriem <OrderItemSubType> = 'Delete Insurance/Warranty'),
            tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'WI';
        b. ja atbilstoðiem OrderItem  <ProductType> ir tikai 'Warranty', tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'W';
        b. ja atbilstoðiem OrderItem  <ProductType> ir tikai 'Insurance', tad tiek pievienots dinamiskais parametrs ar key = ORD_CE_CANCEL_FLAG un value = 'I'.
        Ja ir cits <OrderedServiceType> vai nav OrderItem ar atbilstoðu <OrderItemSubType>, tad tiek pievienots dinamiskais parametrs ar key =ORD_CE_CANCEL_FLAG un tukðu vçrtîbu.
        */
        String val = "";

        int itemcount = getOrderDataItems().length();
        int counterW = 0;
        int counterI = 0;
        String orderItemSubType = "";
        Boolean isFoundOrderItemSubType = false;
        String productType = "";

        JSONObject itemdata = null;
        for (int i = 0; i < itemcount; i++) {
            itemdata = getOrderDataItems().getJSONObject(i);
            try {
                orderItemSubType = GetJsonObjectStringValue(itemdata, "OrderSubType", false);
                if ("Delete Insurance/Warranty".equals(orderItemSubType)) {
                    isFoundOrderItemSubType = true;
                    break;
                }
            } catch (Exception e) {}
        }

        // ir kaut viens OrderItem ar <OrderSubType> = 'Delete Insurance/Warranty'
        if (isFoundOrderItemSubType) {
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                productType = GetJsonObjectStringValue(itemdata, "ProductType", false);
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

        return val;
    }

    private void SetOrderProductTypeList(String excludeStrs, String containsOrEquals) {
        String res = "";
        JSONObject itemdata = null;

        int itemcount = getOrderDataItems().length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = getOrderDataItems().getJSONObject(i);
            if (isEmptyOrNull(res)) {
                //res = GetJsonObjectStringValue(itemdata.get("Name"));
            } else {
                //res = res + "," + GetJsonObjectStringValue(itemdata.get("Name"));
            }
        }

        res = FormatProductCategoriesString(res, excludeStrs, containsOrEquals);
        if (res.length() > 3999) {res = res.substring(0, 3999);}

        addFieldToOutDetailsDataData(res, "ORD_PRODUCTCATEGORY");
    }

    private void GetOrderItemLevelOrderTotalSumm(String productType, String field, String key) {
        Double res = 0d;
        String v = "";
        JSONObject itemdata = null;

        int itemcount = getOrderDataItems().length();
        if (itemcount > 0) {
            // mekljam atbilsoo item pc productType
            String productTypeValue = "";
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                //productTypeValue = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (productType.equals(productTypeValue)) {
                    try {
                        //v = GetJsonObjectStringValue(itemdata.get(field));
                        if (!isEmptyOrNull(v)) {
                            res = res + new Double(v);
                        }
                    } catch (Exception e) {
                        v = "";
                    }
                }
            }
            if (res > 0) {
                //orderAtrrItems.put(new JSONObject().put("value", String.format("%.2f", res)).put("key", key));
                addFieldToOutDetailsDataData(String.format("%.2f", res), key);
            } else {
                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                addFieldToOutDetailsDataData("", key);
            }
        } else {
            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
            addFieldToOutDetailsDataData("", key);
        }
    }

    private String GetIsOrderItemWithProductType(String val) {
        String res = "N";
        JSONObject itemdata = null;
        int itemcount = getOrderDataItems().length();
        if (itemcount > 0) {
            String productTypeValue = "";
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                //productTypeValue = GetJsonObjectStringValue(itemdata.get("ProductType"));
                if (val.equals(productTypeValue)) {
                    res = "Y";
                    break;
                }
            }
        }
        return res;
    }

    private String FormatDownPaymentsBillNo() throws Exception {
        String s = GetBaseData().getDownPaymentBillNo();
        if (!"".equals(s)) {
            if (s.contains("-")) {
                return s.substring(0, s.indexOf("-"));
            } else {
                return s;
            }
        } else {
            return "";
        }
    }
}

