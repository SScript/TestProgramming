package com.BillingTrigger;

import org.json.JSONObject;

public class ProcessSplitPayment extends JSonDataFunctions {

    private final String excludeStrs;
    private final String containsOrEquals;

    public ProcessSplitPayment(String inFullData, String excludeStrs, String containsOrEquals) throws Exception {
        super(inFullData);
        this.excludeStrs = excludeStrs;
        this.containsOrEquals = containsOrEquals;
        ProcessForSplitPayment();
    }

    public Resp ProcessForSplitPayment() throws Exception {
        Resp result = new Resp();
        JSONObject jsonData = new JSONObject();

        // addFieldToOutDataData("serviceno", GetServiceNoFromServiceBundle()); -> visiem
        addFieldToOutDetailsDataData("", "ORD_CTA_SUM");

        switch (GetBaseData().getPaymentMode()) {
            case "Split Payment":
                addFieldToOutDetailsDataData("SP", "ORD_PAYMENT_TYPE");
                break;
            case "Full Payment":
                addFieldToOutDetailsDataData(GetBaseData().getOrderNumber(), "serviceno");
                addFieldToOutDetailsDataData("FP", "ORD_PAYMENT_TYPE");
                break;
            default:
                addFieldToOutDetailsDataData("", "ORD_PAYMENT_TYPE");
                break;
        }
        SetOrderProductTypeList(this.excludeStrs, this.containsOrEquals);
        GetOrderItemLevelOrderTotalSumm("ConsumerGoods", "OneTimeCharge", "ORD_INSTALLMENT_SUM");
        addFieldToOutDetailsDataData(GetIsOrderItemWithProductType("Insurance"), "ORD_INSURANCE_FLAG");
        addFieldToOutDetailsDataData(GetIsOrderItemWithProductType("Warranty"), "ORD_WARRANTY_FLAG");
        addFieldToOutDetailsDataData(GetIsOrderItemWithProductType("PersonalLiabilityInsurance"), "ORD_CTA_FLAG");
        //---
        addFieldToOutDetailsDataData(FormatDownPaymentsBillNo(), "ORD_DP_BILL_NO");

        addFieldToOutDetailsDataData(GetBaseData().getOrderedServiceType(), "ORD_ORDEREDSERVICETYPE");

        return result;
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
