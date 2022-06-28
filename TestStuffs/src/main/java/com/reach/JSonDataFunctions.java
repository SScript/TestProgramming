package com.reach;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

public class JSonDataFunctions extends BaseFunctions {

    /**
     * Ja ir OrderItem ar ProductCode = 'PD_TELCO_INSTALL_PACKAGE', tad ja:
     *   DeliveryMethod = 'Courier', tad CourierAddressString
     *   DeliveryMethod = 'PickUpPoint', tad ParcelMachineAddress
     *   DeliveryMethod  = 'StoreFront', tad "Tet veikals"
     *   DeliveryMethod = 'AlreadyDelivered', tad nepadot šo parametru
     *     else
     *       OrderItem.serviceAccountAddress
     * @param orderdataitems
     * @return
     * @throws Exception
     */
    public String GetVLOrderDeliveryAddressTelco(JSONArray orderdataitems) throws Exception {
        int itemc = orderdataitems.length();
        String result = "";
        String prdCode = "";
        String prdDeliveryMethod = "";
        JSONObject d = null;
        try {
            for (int i = 0; i < itemc; i++) {
                d = orderdataitems.getJSONObject(i);
                prdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                prdDeliveryMethod = GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);

                if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(prdCode)) {
                    switch (prdDeliveryMethod.toUpperCase()) {
                        case "COURIER":
                            return GetJsonAtrrObjectStringValue(d, "CourierAddressString", false);
                        //break;
                        case "PICKUPPOINT":
                            return GetJsonAtrrObjectStringValue(d, "ParcelMachineAddress", false);
                        //break;
                        case "STOREFRONT":
                            return "Tet veikals"; // SOAIP-1928
                        //break;
                        case "ALREADYDELIVERED":
                            return "ALREADYDELIVERED";
                        //break;
                        default:
                            return GetJsonAtrrObjectStringValue(d, "serviceAccountAddress", false);
                        //break;
                    }
                } else {
                    if ("Installation".equalsIgnoreCase(prdDeliveryMethod)) {
                        result = GetJsonAtrrObjectStringValue(d, "Name", false);
                    }
                }
            }
        } catch (Exception e) {}

        return result;
    }

    /*
        ReturnDeliveryMethod from root (offer) orderItem - OrderItem with ParentOrderItemId = blank and ProductType = 'Telco' and "ProductSubType" = "Offer".
        Mapping:
            StoreFront - TET veikals
            Courier - Kurjers
            PickUpPoint - Omniva pakomāts
            KAI - Meistars
        For root order line item parentOrderItem will be null.
    * */
    public String GetVLOrderReturnTypeValue(JSONArray orderdataitems) throws Exception {
        String result = "";
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String parentOrderItemIdValue = "";
        String productTypeValue = "";
        String productSubTypeValue = "";
        String returnDeliveryMethodValue = "";

        for (int i = 0; i < itemc; i++) {
            d = orderdataitems.getJSONObject(i);
            parentOrderItemIdValue = GetJsonAtrrObjectStringValue(d, "ParentOrderItemId", false);
            productTypeValue = GetJsonAtrrObjectStringValue(d, "ProductType", false);
            productSubTypeValue = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
            if (isEmptyOrNull(parentOrderItemIdValue) && "Telco".equalsIgnoreCase(productTypeValue) && "Offer".equalsIgnoreCase(productSubTypeValue)) {
                returnDeliveryMethodValue = GetJsonAtrrObjectStringValue(d, "ReturnDeliveryMethod", false);
                switch (returnDeliveryMethodValue.toUpperCase()) {
                    case "STOREFRONT":
                        result = "TET veikals";
                        break;
                    case "COURIER":
                        result = "Kurjers";
                        break;
                    case "PICKUPPOINT":
                        result = "Omniva pakomāts";
                        break;
                    case "KAI":
                        result = "Meistars";
                        break;
                    default:
                        result = "";
                        break;
                }
                return result;
            }
        }
        return result;
    }
    public String GetVLOrderReturnAddressValue(JSONArray orderdataitems) throws Exception {
        String result = "";
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String parentOrderItemIdValue = "";
        String productTypeValue = "";
        String productSubTypeValue = "";
        String returnDeliveryMethodValue = "";

        for (int i = 0; i < itemc; i++) {
            d = orderdataitems.getJSONObject(i);
            parentOrderItemIdValue = GetJsonAtrrObjectStringValue(d, "ParentOrderItemId", false);
            productTypeValue = GetJsonAtrrObjectStringValue(d, "ProductType", false);
            productSubTypeValue = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
            if (isEmptyOrNull(parentOrderItemIdValue) && "Telco".equalsIgnoreCase(productTypeValue) && "Offer".equalsIgnoreCase(productSubTypeValue)) {
                returnDeliveryMethodValue = GetJsonAtrrObjectStringValue(d, "ReturnDeliveryMethod", false);
                if ("Courier".equalsIgnoreCase(returnDeliveryMethodValue)) {
                    return GetJsonAtrrObjectStringValue(d, "ReturnCourierAddress", false);
                }
            }
        }
        return result;
    }

    public String GetVLOrderReturnContactDataValue(JSONArray orderdataitems) throws Exception {
        String result = "";
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String productCodeValue = "";
        String deliveryMethodValue = "";
        String dcp = "";

        for (int i = 0; i < itemc; i++) {
            d = orderdataitems.getJSONObject(i);
            productCodeValue = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
            deliveryMethodValue = GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);
            if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(productCodeValue) && "Courier".equalsIgnoreCase(deliveryMethodValue)) {
                dcp = GetJsonAtrrObjectStringValue(d, "DeliveryContactName", false);
                result = dcp;
                dcp = GetJsonAtrrObjectStringValue(d, "DeliveryContactEmail", false);
                if (isEmptyOrNull(result)) {result = dcp;} else {result = ", " + dcp;}
                dcp = GetJsonAtrrObjectStringValue(d, "DeliveryContactPhone", false);
                if (isEmptyOrNull(result)) {result = dcp;} else {result = ", " + dcp;}
                return  result;
            }
        }
        return result;
    }

    public String GetJsonFitterVisitNeedValue(JSONArray orderdataitems, String prdSubType , String serviceType, boolean isReservDate) throws Exception {
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String prodSybType = "";
        String servType = "";
        String tetReservationStartTime = "";
        for (int i = 0; i < itemc; i++) {
            d = orderdataitems.getJSONObject(i);
            prodSybType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
            servType = GetJsonAtrrObjectStringValue(d, "ServiceType", false);
            tetReservationStartTime = GetJsonAtrrObjectStringValue(d, "TetReservationStartTime", false);
            if (isReservDate) {
                return String.valueOf((prdSubType.equals(prodSybType) && serviceType.equals(servType) && !isEmptyOrNull(tetReservationStartTime)));
            } else {
                return String.valueOf((prdSubType.equals(prodSybType) && serviceType.equals(servType)));
            }
        }
        return "false";
    }

    public String GetItemFieldValueByTwoFields(JSONArray orderdataitems,
                                               String field1, String field1Value,
                                               String field2, String field2Value, String searchField) throws Exception {
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String field1val = "";
        String field2val = "";
        for (int i = 0; i < itemc; i++) {
            d = orderdataitems.getJSONObject(i);
            field1val = GetJsonAtrrObjectStringValue(d, field1, false);
            field2val = GetJsonAtrrObjectStringValue(d, field2, false);
            if (field1Value.equals(field1val) && field2Value.equals(field2val)) {
                return GetJsonAtrrObjectStringValue(d, searchField, false);
            }
        }

        return "";
    }

    public String GetVlOfferNameValue(JSONArray orderdataitems) throws Exception {
        String result = "";
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String productSubTypeFieldval = "";
        String productCode = "";
        String orderItemAction = "";
        String nameField2val = "";
        String issTelco = isOrderItemFieldWithValue(orderdataitems, "ProductType", "Telco");
        if ("true".equalsIgnoreCase(issTelco)) {
            for (int i = 0; i < itemc; i++) {
                d = orderdataitems.getJSONObject(i);
                productSubTypeFieldval = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                productCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                orderItemAction = GetJsonAtrrObjectStringValue(d, "OrderItemAction", false);
                if ("Offer".equalsIgnoreCase(productSubTypeFieldval) && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equalsIgnoreCase(productCode)
                    && !"Disconect".equalsIgnoreCase(orderItemAction)) {
                    nameField2val = GetJsonAtrrObjectStringValue(d, "Name", false);
                    if (!isEmptyOrNull(nameField2val)) {
                        if (isEmptyOrNull(result)) {
                            result = nameField2val;
                        } else {
                            result = result + ";" + nameField2val;
                        }
                    }
                }
            }
        }
        return result;
    }

    public String GetVlOfferNameValueRemove(JSONArray orderdataitems) throws Exception {
        String result = "";
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String productSubTypeFieldval = "";
        String productCode = "";
        String orderItemAction = "";
        String nameField2val = "";
        String issTelco = isOrderItemFieldWithValue(orderdataitems, "ProductType", "Telco");
        if ("true".equalsIgnoreCase(issTelco)) {
            for (int i = 0; i < itemc; i++) {
                d = orderdataitems.getJSONObject(i);
                productSubTypeFieldval = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                productCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                orderItemAction = GetJsonAtrrObjectStringValue(d, "OrderItemAction", false);
                if ("Offer".equalsIgnoreCase(productSubTypeFieldval) && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equalsIgnoreCase(productCode)
                        && "Disconect".equalsIgnoreCase(orderItemAction)) {
                    nameField2val = GetJsonAtrrObjectStringValue(d, "Name", false);
                    if (!isEmptyOrNull(nameField2val)) {
                        if (isEmptyOrNull(result)) {
                            result = nameField2val;
                        } else {
                            result = result + ";" + nameField2val;
                        }
                    }
                }
            }
        }
        return result;
    }

    /**
     * ServiceNumber, where  ProductType = SplitPayment or 'Electricity'
     * WE document number - if ProductType = 'Warranty' or 'Insurance'
     *
     * @return
     */
    public String GetServiceNumberValue(JSONArray orderdataitems) throws Exception {
        String productType;
        String val = "";
        String result = "";
        JSONObject itemdata = null;
        List<String> data = new ArrayList<>();
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
            if ("SplitPayment".equals(productType) || "Electricity".equals(productType)) {
                return GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false);
            } else {
                if ("Telco".equals(productType)) {
                    for (int j = 0; j < itemcount; j++) {
                        itemdata = orderdataitems.getJSONObject(j);
                        val = GetJsonAtrrObjectStringValue(itemdata, "ServiceLine", false);
                        if ("Phone".equalsIgnoreCase(val)) {
                            val = GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false);
                            if (!isEmptyOrNull(val)) {
                                data.add(val);
                            }
                        }
                    }
                }
            }
        }
        if (data.size() > 0) {
            return data.stream().collect(Collectors.joining(","));
        }
        return result;
    }

    public String GetVlVoipValue(JSONArray orderdataitems) throws Exception {
        String result = "false";
        JSONObject itemdata = null;
        String productSubType = "";
        String productCode = "";
        String productType = "";

        List<String> data = new ArrayList<>();
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
            if ("Telco".equalsIgnoreCase(productType)) {
                for (int j = 0; j < itemcount; j++) {
                    itemdata = orderdataitems.getJSONObject(j);
                    productSubType = GetJsonAtrrObjectStringValue(itemdata, "ProductSubType", false);
                    productCode = GetJsonAtrrObjectStringValue(itemdata, "ProductCode", false);
                    if ("Offer".equalsIgnoreCase(productSubType) && "PD_TELCO_TECH_LINE_NONCOMMERCIAL".equalsIgnoreCase(productCode)) {
                        return "True";
                    }
                }
            }
        }

        return result;
    }

    public String GetVLOrderMonthlyTotalWithoutDiscountValue(JSONObject orderdata) throws Exception {
        String result = "";
        Object data = null;
        JSONArray apr = new JSONArray();
        JSONObject d = null;
        double finalResSum = 0;
        String val = "";
        String promotionAction = "";

        try {
            data = orderdata.get("AppliedPromotion");
            if (data instanceof JSONArray) {
                apr = (JSONArray) data;
            }
            if (data instanceof JSONObject) {
                apr = new JSONArray();
                apr.put(data);
            }
        } catch (Exception e) {
            return "";
        }

        String VLOrderTotalTotal = GetJsonAtrrObjectStringValue(orderdata, "VLOrderTotalTotal", false);
        if (!isEmptyOrNull(VLOrderTotalTotal)) {
            finalResSum = finalResSum + Double.valueOf(VLOrderTotalTotal);
        }
        int itemcount = apr.length();
        for (int j = 0; j < itemcount; j++) {
            d = apr.getJSONObject(j);
            val = GetJsonAtrrObjectStringValue(d, "PromotionName", false);
            promotionAction = GetJsonAtrrObjectStringValue(d, "PromotionAction", false);
            if (!isEmptyOrNull(val) && ("New".equalsIgnoreCase(promotionAction) || "Existing".equalsIgnoreCase(promotionAction))) {
                finalResSum = finalResSum + Double.valueOf(VLOrderTotalTotal);
            }
        }
        if (finalResSum == 0) {
            return "";
        } else {
            return String.valueOf(finalResSum);
        }
    }

    public String GetResumeDateValueFromSuspendEndDate(JSONArray orderdataitems) throws Exception {
        String result = "";
        String productSubType = "";
        String suspendEndDate = "";
        JSONObject itemdata = null;
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productSubType = GetJsonAtrrObjectStringValue(itemdata, "ProductSubType", true);
            if ("Offer".equalsIgnoreCase(productSubType)) {
                suspendEndDate = GetJsonAtrrObjectStringValue(itemdata, "SuspendEndDate", true);
                if (!isEmptyOrNull(suspendEndDate)) {
                    return suspendEndDate;
                }
            }
        }

        return result;
    }

    public String GetEquipmentNameValue(JSONArray orderdataitems) throws Exception {
        String productType;
        String val = "";
        String name = "";
        String result = "";
        JSONObject itemdata = null;
        List<String> data = new ArrayList<>();
        int itemcount = orderdataitems.length();
        Map<String, Integer> iekartuList = new HashMap<>();
        Integer count = 0;
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);

                if ("Telco".equals(productType)) {
                    for (int j = 0; j < itemcount; j++) {

                        itemdata = orderdataitems.getJSONObject(j);
                        val = GetJsonAtrrObjectStringValue(itemdata, "WillCustomerReturnesCPE", false);
                        if ("true".equalsIgnoreCase(val)) {
                            name = GetJsonAtrrObjectStringValue(itemdata, "Name", false);

                            if (!iekartuList.containsKey(name)) {
                                iekartuList.put("", 1);
                            } else {
                                iekartuList.computeIfPresent(name, (k, v) -> v + 1);
                            }

                        }
                    }


                }

        }
        if (iekartuList.size() > 0) {
            for (Map.Entry<String, Integer> entry : iekartuList.entrySet()) {
                result = result + entry.getKey() + "(" + entry.getValue() + "),";
            }
            return result.substring(0, result.length() - 1);
        }
        return result;
    }

    public String GetServiceStartDate(JSONArray orderdataitems) throws Exception {
        String result = "";
        String productType = "";
        String productSubType = "";
        String res = "";
        String nd = "";
        JSONObject d = null;
        int itemcount = orderdataitems.length();

        // ServiceStartDate ir katrā orderitemā
        for (int i = 0; i < itemcount; i++) {
            d = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(d, "ProductType", false);
            if ("Electricity".equalsIgnoreCase(productType)) {
                for (int j = 0; j < itemcount; j++) {
                    d = orderdataitems.getJSONObject(j);
                    nd = GetJsonAtrrObjectStringValue(d, "ServiceStartDate", false);
                    if (isEmptyOrNull(res) && !isEmptyOrNull(nd)) {
                        res = nd;
                    } else {
                        if (!isEmptyOrNull(nd)) {
                            res = CompareDates(res, nd);
                        }
                    }
                }
                return res;
            } else {
                if ("Telco".equalsIgnoreCase(productType)) {
                    for (int j = 0; j < itemcount; j++) {
                        d = orderdataitems.getJSONObject(j);
                        productSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                        if ("Offer".equalsIgnoreCase(productSubType)) {
                            nd = GetJsonAtrrObjectStringValue(d, "ServiceStartDate", false);
                            if (!isEmptyOrNull(nd)) {
                                return  nd;
                            }
                        }
                    }
                    return res;
                }
            }
        }

        return result;
    }

    public String isOrderItemFieldWithValue(JSONArray orderdataitems,
                                            String field, String fieldValue) throws Exception {
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String fieldval = "";
        String res = "false";
        for (int i = 0; i < itemc; i++) {
            d = orderdataitems.getJSONObject(i);
            fieldval = GetJsonAtrrObjectStringValue(d, field, false);
            if (fieldValue.equalsIgnoreCase(fieldval)) {return "true";}
        }

        return res;
    }

    public String isNotOrderItemFieldWithValue(JSONArray orderdataitems,
                                            String field, String fieldValue) throws Exception {
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String fieldval = "";
        String res = "false";
        for (int i = 0; i < itemc; i++) {
            d = orderdataitems.getJSONObject(i);
            fieldval = GetJsonAtrrObjectStringValue(d, field, false);
            if (!fieldValue.equalsIgnoreCase(fieldval)) {return "true";}
        }

        return res;
    }

    public ResValues isOrderItemAtrrFieldWithValue(JSONObject itemData, String field, String value) throws Exception {
        ResValues res = new ResValues();
        String r = "";
        JSONObject itemattrdata = null;
        try {
            JSONObject atrr = itemData.getJSONObject("JSONAttribute");
            Iterator<String> keys = atrr.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                JSONArray a = atrr.getJSONArray(key);
                int itemattrcount = a.length();
                for (int j = 0; j < itemattrcount; j++) {
                    itemattrdata = a.getJSONObject(j);
                    r = GetJsonAtrrObjectStringValue(itemattrdata, field, false);
                    if (value.equalsIgnoreCase(r)) {
                        res.RetBoolValue = true;
                        res.RetString1Value = GetJsonAtrrObjectStringValue(itemattrdata, "attributeuniquecode__c", false);
                        return res;
                    }
                }
            } // end while

        } catch (Exception e) {
            res = new ResValues();
        }

        return res;
    }

    public ResValues isOrderWithItemAtrrFieldWithValue(JSONArray orderdataitems, String field, String value) throws Exception {
        ResValues res = new ResValues();
        String r = "";
        JSONObject itemdata = null;
        JSONObject itemattrdata = null;

        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
                try {
                    JSONObject atrr = itemdata.getJSONObject("JSONAttribute");
                    Iterator<String> keys = atrr.keys();
                    while (keys.hasNext()) {
                        String key = keys.next();
                        JSONArray a = atrr.getJSONArray(key);
                        int itemattrcount = a.length();
                        for (int j = 0; j < itemattrcount; j++) {
                            itemattrdata = a.getJSONObject(j);
                            r = GetJsonAtrrObjectStringValue(itemattrdata, field, false);
                            if (value.equalsIgnoreCase(r)) {
                                res.RetBoolValue = true;
                                res.RetString1Value = GetJsonAtrrObjectStringValue(itemattrdata, "attributeuniquecode__c", false);
                                return res;
                            }
                        }
                    }

                } catch (Exception e) {
                    res = new ResValues();
                }
        }

        return res;
    }

    public String FormatDate(String d) {
        // var ienākt:
        // ir   -> 2020-07-15 10:00:00
        // vai -> 15/07/2020 10:00:00
        String dd1 = "";
        String mm1 = "";
        String yy1 = "";
        if (!isEmptyOrNull(d)) {
            String s = String.valueOf(d.charAt(4));
            if ("-".equals(s)) {
                dd1 = d.substring(8,10);
                mm1 = d.substring(5,7);
                yy1 = d.substring(0,4);
                return dd1 + "." + mm1 + "." + yy1;
            } else {
                s = String.valueOf(d.charAt(2));
                if ("/".equals(s)) {
                    dd1 = d.substring(0,2);
                    mm1 = d.substring(3,5);
                    yy1 = d.substring(6,10);
                    return dd1 + "." + mm1 + "." + yy1;
                } else {
                    return "";
                }
            }
        } else {
            return "";
        }
    }


    public String CompareDates(String currentDate, String newDate) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date start = sdf.parse(currentDate);
        Date end = sdf.parse(newDate);

        if (start.before(end)) {
            return currentDate;
        } else {
            return newDate;
        }
    }
}
