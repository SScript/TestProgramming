package com.BillingTrigger;

import org.json.JSONObject;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class ProcessElectricity extends JSonDataFunctions {

    public ProcessElectricity(String inFullData, String env) throws Exception {
        super(inFullData, env);
    }

    public Resp ProcessForElectricity() throws Exception {
        Resp result = new Resp();

        String s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "RootObject",
                "ServiceId",
                false, false);
        addFieldToOutDetailsDataData(isEmptyOrNull(s) ? "" : s, "serviceno");

        s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "RootObject",
                "OrderedServiceType",
                false, false);
        addFieldToOutDetailsDataData(s, "ORD_ORDEREDSERVICETYPE");
        
        addFieldToOutDetailsDataData(GetORD_PRICE_KWHValue(), "ORD_PRICE_KWH");

        // ORD_BILLING_ACTIVATION_DATE
        s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "RootObject",
                "BillActivationDate",
                true, false);
        addFieldToOutDetailsDataData(FormatDateShort(s), "ORD_BILLING_ACTIVATION_DATE");

        addFieldToOutDetailsDataData("", "ORD_CE_CANCEL_FLAG");

        s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "RootObject",
                "RemovalReason",
                false, false);
        addFieldToOutDetailsDataData(s, "ORD_REASON_ID");

        s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "RootObject",
                "OrderItemId",
                true, false);
        addFieldToOutDetailsDataData(s, "ORD_ORDERITEMID");

        // jānem no "Electricity.RootObject.BillActivationDate"
        s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "TechnicalObject",
                "ATT_ELE_CONSUMP",
                false, false);
        addFieldToOutDetailsDataData(s, "ORD_AVG_CONS_KWH");
        //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_AVG_CONS_KWH"));
        s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "TechnicalObject",
                "ATT_ELE_ST_TRF",
                false, false);
        addFieldToOutDetailsDataData(s, "ORD_ST_TP_CODE");
        //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_ST_TP_CODE"));
        s = GetOrderItemFieldValueByProductType(
                "Electricity", "Electricity",
                "TechnicalObject",
                "ATT_ELE_INCURRENT_VAL",
                false, false);
        addFieldToOutDetailsDataData(s, "ORD_AMPERAGE");
        //orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_AMPERAGE"));

        // "ORD_PRICE_KWH"
        // If <OrderedService> nav 'Split Payment', tad tiek pievienots dinamiskais parametrs ar key = 'ORD_PRICE_KWH'
        // un value - tiek noteikta no OrderItem ar <ProductSubType> = 'Plan' un ar <OrderItemAction> = 'ADD', OrderPricing ieraksta ar <Source> = 'Base':
        //ja VATExclusive = 'N', tad value = round(<OrderItem.OrderPricing.Amount> devide with (1.<OrderItem.OrderPricing.VatRate>),2)
        //pretejā gadijumā - value = <OrderItem.OrderPricing.Amount>
        //s = GetORD_PRICE_KWHValue();
        addFieldToOutDetailsDataData(GetORD_PRICE_KWHValue(), "ORD_PRICE_KWH");
        //orderAtrrItems.put(new JSONObject().put("value", GetORD_PRICE_KWHValue()).put("key", "ORD_PRICE_KWH"));

        // return full result
        result.SendJsonStr0 = getFullOutJsonData().toString();
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
        //JSONObject itemdata = null;

        // value - tiek noteikta no OrderItem ar <ProductSubType> = 'Plan' un ar <OrderItemAction> = 'ADD', OrderPricing ieraksta ar <Source> = 'Base':
        // ja VATExclusive = 'N', tad value = round(<OrderItem.OrderPricing.Amount> devide with (1.<OrderItem.OrderPricing.VatRate>),2)
        // pretejā gadijumā - value = <OrderItem.OrderPricing.Amount>
        int itemcount = getOrderDataItems().length();
        for (int i = 0; i < itemcount; i++) {
            itemdat = getOrderDataItems().getJSONObject(i);
            productSubTypeValue =  GetJsonObjectStringValue(itemdat, "ProductSubType", false);
            orderItemActionValue = GetJsonObjectStringValue(itemdat, "OrderItemAction", false);
            vATExclusiveValue = GetJsonObjectStringValue(itemdat, "VATExclusive", false);
            vATRateValue = GetJsonObjectStringValue(itemdat, "VATRate", false);

            // ja vērtības ir iekš OrderPricing, tad ņem no turienes
            try {objOrdPricing = itemdat.getJSONObject("OrderPricing");} catch (Exception e) {}
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
}
