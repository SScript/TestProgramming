package com.BillingTrigger;

import org.json.JSONObject;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class ProcessElectricity extends JSonDataFunctions {

    public ProcessElectricity(String inFullData) throws Exception {
        super(inFullData);
    }

    public Resp ProcessForElectricity(JSONObject data) throws Exception {
        Resp result = new Resp();

        String s = GetOrderItemFieldLevel3(
                "Electricity", "Electricity",
                "RootObject",
                "ServiceId",
                false);
        addFieldToOutDetailsDataData(isEmptyOrNull(s) ? "" : s, "serviceno");

        s = GetOrderItemFieldLevel3(
                "Electricity", "Electricity",
                "RootObject",
                "OrderedServiceType",
                false);
        addFieldToOutDetailsDataData(s, "ORD_ORDEREDSERVICETYPE");
        
        addFieldToOutDetailsDataData(GetORD_PRICE_KWHValue(), "ORD_PRICE_KWH");

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
        JSONObject itemdata = null;

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
}
