package com.reach;

import org.json.JSONArray;
import org.json.JSONObject;

public class JSonDataFunctions {

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
        String nameField2val = "";
        String issTelco = isOrderItemFieldWithValue(orderdataitems, "ProductType", "Telco");
        if ("true".equalsIgnoreCase(issTelco)) {
            for (int i = 0; i < itemc; i++) {
                d = orderdataitems.getJSONObject(i);
                productSubTypeFieldval = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                if ("Offer".equalsIgnoreCase(productSubTypeFieldval)) {
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

    public JSONArray GetJSONArrObj(JSONObject data, String arrName) {
        JSONArray result = new JSONArray();
        try {
            Object orderdataitems_o = data.get(arrName);
            if (orderdataitems_o instanceof JSONArray) {
                result = (JSONArray) orderdataitems_o;
            }
            if (orderdataitems_o instanceof JSONObject) {
                result.put(orderdataitems_o);
            }
        } catch (Exception e) {}

        return result;
    }

    public String GetJsonAtrrObjectStringValue(JSONObject data, String jsonfieldName, boolean mandatory) throws Exception {
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

    public String GetJsonObjectStringValue(Object objvalue) {
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

    public boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }
}
