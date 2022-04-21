package com.BillingTrigger;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

public class JSonDataFunctions extends JSonDataFunctionsBase {

    public JSonDataFunctions(String inFullData) throws Exception {
        super(inFullData);
        // ielasa kopējos datus
        ProcessDefaultData();
        ProcessDefaultAtrributeData();
    }

    public void ProcessDefaultData() throws Exception {
        JSONObject fullData = getOrderDataFull();
        JSONObject orderData = getOrderData();

        addFieldToOutDataData("orderno", GetBaseData().getOrderNumber());
        addFieldToOutDataData("orderid", GetBaseData().getOrderId());
        // serviceno
        //addFieldToOutDataData("serviceno", FormatDate(GetBaseData().get()));

        addFieldToOutDataData("orderdate", FormatDate(GetBaseData().getOrderDate()));
        addFieldToOutDataData("ordernotes", GetBaseData().getNotes());
        addFieldToOutDataData("caller", GetBaseData().getCaller());

        addFieldToOutDataData("serviceno", GetServiceNoFromServiceBundle());

    }

    public void ProcessDefaultAtrributeData() throws Exception {
        JSONObject orderData = getOrderData();

        addFieldToOutDetailsDataData(GetBaseData().getOrderedService(), "ORD_ORDEREDSERVICE");

    }


    public String GetOrderItemFieldLevel3(
            String productType, String productTypeCompareTo,
            String itemSubtypeCompare,
            String field,
            boolean mandatory) throws Exception {
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        String prdType = "";
        String prdtSubType = "";
        String val = "";
        JSONObject itemdata = null;
        //ProductType = "Electricity"
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdType = GetJsonObjectStringValue(itemdata.get("ProductType"));
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata.get("ProductSubType"));
                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType)) {
                    try {
                        val = GetJsonObjectStringValue(itemdata.get(field));
                        //val = GetOrderItemDinamicValue(itemdata, field);
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

    public String GetServiceNoFromServiceBundle() throws Exception {
        String productSubType = "";
        String serviceId  = "";

        JSONArray data  = getOrderDataItems();
        JSONObject d = null;
        int itemcount = data.length();
        for (int i = 0; i < itemcount; i++) {
            d = data.getJSONObject(i);
            productSubType = GetJsonObjectStringValue(d, "ProductSubType", false);
            serviceId = GetJsonObjectStringValue(d, "ServiceId", false);
            if (!isEmptyOrNull(productSubType) && !isEmptyOrNull(serviceId)) {
                return serviceId;
            }
        }
        return "";
    }

    public String GetOrderItemDinamicValue(JSONObject itemdat, String field) {
        String res = "";
        JSONObject itemattrdata = null;
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
                                res = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo").getJSONObject("selectedItem").get("value"));
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

    public String FormatProductCategoriesString(String data, String excludeStrs, String containsOrEquals) {
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

}
