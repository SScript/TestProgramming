package com.BillingTrigger;

import org.json.JSONArray;
import org.json.JSONObject;

public class ProcessTelco extends JSonDataFunctions {

    public ProcessTelco(String inFullData) throws Exception {
        super(inFullData);
        ProcessForTelco();
    }

    public Resp ProcessForTelco() throws Exception {
        Resp result = new Resp();

        //  -> te var būt vairāki saformēti izsaukumi
        // OrderItem ar ProductSubType = 'ServiceBundle' ar atribūta ATT_SERVICE_LEVEL vērtību  = 'Primary';

        //String ServiceBundlevalues[] = {"Primary", "Secondary", "Tertiary", "Quarternary"};

        // sadalu itemus jau pa ServiceBundlevalues
        JSONArray itemdata_primary;
        JSONArray itemdata_secondary;
        JSONArray itemdata_tertiary;
        JSONArray itemdata_quarternary;

        itemdata_primary = GeOrderItemsDinamicAtrrValueByProductType("Primary");
        itemdata_secondary = GeOrderItemsDinamicAtrrValueByProductType("Secondary");
        itemdata_tertiary = GeOrderItemsDinamicAtrrValueByProductType("Tertiary");
        itemdata_quarternary = GeOrderItemsDinamicAtrrValueByProductType("Quarternary");

        if (itemdata_primary.length() > 0) {
            result.SendJsonStr1 = ProcessTelcoServiceBundleLine(itemdata_primary, "Primary");
        }

        if (itemdata_secondary.length() > 0) {
            result.SendJsonStr2 = ProcessTelcoServiceBundleLine(itemdata_primary, "Secondary");
        }

        if (itemdata_tertiary.length() > 0) {
            result.SendJsonStr3 = ProcessTelcoServiceBundleLine(itemdata_primary, "Tertiary");
        }

        if (itemdata_quarternary.length() > 0) {
            result.SendJsonStr4 = ProcessTelcoServiceBundleLine(itemdata_primary, "Quarternary");
        }

        return result;
    }

    private String ProcessTelcoServiceBundleLine(JSONArray bundleItems, String serviceBundle) throws Exception {
        String result;
        String s = "";
        boolean isValueInOrderLine = false;

        JSONObject newData = new JSONObject();
        newData.put("ORD_REQUEST_ID", GetBaseData().getGuid());
        newData.put("orderno", GetBaseData().getOrderNumber());
        newData.put("orderid", GetBaseData().getOrderId());
        newData.put("orderdate", FormatDate(GetBaseData().getOrderDate()));
        newData.put("ordernotes", GetBaseData().getNotes());
        newData.put("caller", GetBaseData().getCaller());

        JSONObject d = null;
        // serviceno for every request to UNICORN - ServiceId from ServiceOrderItem with
        // ProductSubType = 'ServiceBundle', if null - then ServiceId from child Order Itmen,
        // there this filed is filled.  Ja tam pašam OrderItem ir aizpildīts parametrs  OldServiceId,
        // tad uz UNICORN jāpadod dinamiskais parametrs ar key = 'ORD_PREVIOS_SERVICE_NO' un value = OldServiceId.
        newData.put("serviceno", getTelcoServiceNo(bundleItems));

        newData.put("ORD_PREVIOS_SERVICE_NO", getOldServiceNo(bundleItems));

        // Dinamiskam parametram ar key = 'ORD_ORDERITEMID' value tiek ņemta no OrderItem ar aizpidītu ServiceId.
        // Ja tādi ir vairāki, tad apvienot visus, atdalot ar ';'
        //"OrderItemId", "ORD_ORDERITEMID"
        String ids = "";
        String serviceId = "";

        for (int i = 0; i < bundleItems.length(); i++) {
            d = bundleItems.getJSONObject(i);
            serviceId = GetJsonObjectStringValue(d, "ServiceId", false);
            if (!isEmptyOrNull(serviceId)) {
                s = GetJsonObjectStringValue(d, "OrderItemId", false);
                if (isEmptyOrNull(ids)) {
                    ids = s;
                } else {
                    if (!isEmptyOrNull(s)) {
                        ids = ids + ";" + s;
                    }
                }
            }
        }
        newData.put("ORD_ORDERITEMID", ids);

        String willCustomerReturnesCPE = "";
        for (int i = 0; i < bundleItems.length(); i++) {
            d= bundleItems.getJSONObject(i);
            willCustomerReturnesCPE = GetJsonObjectStringValue(d, "WillCustomerReturnesCPE", false);
            if ("No".equalsIgnoreCase(willCustomerReturnesCPE)) {

                //(SOAIP-1978) Ja  <OrderedService> = 'Telco', tad ja zem izdalīta ServiceBundle ir OrderItem ar WillCustomerReturnesCPE = 'No',
                // tad pievienot atgriežamo iekārtu datus - pievienot dinamiskus parametrus ar datiem no katra atbilstoša OrderItem
                // (ar WillCustomerReturnesCPE = 'No'):

                //dinamiskais parametrs ar key = 'ORD_EQ_SERIAL_NO_x',
                //      kur x - atgriežamas iekārtas kārtas numurs UNICORN izsaukumā, un value =Vlocity parametrs <OrderItem.SerialNumber>;
                newData.put("ORD_EQ_SERIAL_NO_" + (i + 1), GetJsonObjectStringValue(d, "SerialNumber", false));

                //dinamiskais parametrs ar key = 'ORD_EQ_INITIAL_PRICE_x',
                //      kur x - kārtas numurs, un value =Vlocity parametrs <OrderItem.CPEInitialPrice>;
                newData.put("ORD_EQ_INITIAL_PRICE_" + (i + 1), GetJsonObjectStringValue(d, "CPEInitialPrice", false));

                //dinamiskais parametrs ar key = 'ORD_EQ_REMAINDER_PRICE_x',
                //      kur x - kārtas numurs, un value = Vlocity parametrs <OrderItem.RemainingPrice>;
                newData.put("ORD_EQ_REMAINDER_PRICE_" + (i + 1), GetJsonObjectStringValue(d, "RemainingPrice", false));

                //dinamiskais parametrs ar key = 'ORD_EQ_BUY_FLAG_x',
                //      kur x - kārtas numurs, un value = 'N''Y', ja Vlocity parametrs <OrderItem.WillCustomerReturnesCPE> = 'No';
                newData.put("ORD_EQ_BUY_FLAG_" + (i + 1), "Y");

                //dinamiskais parametrs ar key = 'ORD_EQ_TYPE_OF_SERVICE_x',
                //      kur x - kārtas numurs, un value =Vlocity parametrs <OrderItem.EquipmentType>;
                newData.put("ORD_EQ_TYPE_OF_SERVICE_" + (i + 1), GetJsonObjectStringValue(d, "EquipmentType", false));
            }
        }

        // ORD_CONTRACT_LENGTH
        newData.put("ORD_CONTRACT_LENGTH", GetORD_CONTRACT_LENGTHValue());

        // ORD_MANUAL_BILLING_FLAG
        newData.put("ORD_MANUAL_BILLING_FLAG", GetORD_MANUAL_BILLING_FLAGValue());

        // ORD_SERVICE_DETAIL
        newData.put("ORD_SERVICE_DETAIL", GetORD_SERVICE_DETAILValue());

        // ORD_TECHNOLOGY
        newData.put("ORD_TECHNOLOGY", GetORD_TECHNOLOGYValue());

        isValueInOrderLine = isTelcoAndRemove();
        if (isValueInOrderLine) {
            //  value = "Y", ja OrderItemā ar ProductSubType = "Offer" un ActionCode = "Disconnect"
            //  un ir aizpildīts parametrs LastBillingDate un tā vērtība ir lielāka par tekošo datumu
            //  vai ja SF parametra 'Order Deactivation Cancel Flag' vērtība ir 'Y'. Parējos gadījumos "null". ???
            // ORD_DEACT_CANCEL_FLAG
            newData.put("ORD_DEACT_CANCEL_FLAG", GetORD_ORD_DEACT_CANCEL_FLAGValue());

            //  value = OrderItem.LastBillingDate no OrderItem ar ProductSubType = "Offer".
            // ORD_LASTBILLINGDATE
            newData.put("ORD_LASTBILLINGDATE", GetORD_LASTBILLINGDATEValue());
        }

        // ORDER_OFFER_POPULATION
        isValueInOrderLine = isORDER_OFFER_POPULATIONValue();
        if (isValueInOrderLine) {
            newData.put("ORDER_OFFER_POPULATION", "N");
        } else {
            newData.put("ORDER_OFFER_POPULATION", JSONObject.NULL);
        }

        // ORD_FALSE_ACTIVATION
        isValueInOrderLine = isPAPSFulfillmentStatusInComplete();
        if (isValueInOrderLine) {
            newData.put("ORD_FALSE_ACTIVATION", "Y");
        } else {
            newData.put("ORD_FALSE_ACTIVATION", JSONObject.NULL);
        }

        // ORD_BILLING_ACTIVATION_DATE
        s = GetOrderItemFieldValueByProductTypeTelco(
                "Telco", "Telco",
                "Offer",
                "BillActivationDate",
                false, true);
        newData.put("ORD_BILLING_ACTIVATION_DATE", s);

        // ORD_ORDEREDSERVICE
        newData.put("ORD_ORDEREDSERVICETYPE", GetBaseData().getOrderedServiceType());

        s = GetOrderItemFieldValueByProductTypeTelco(
                "Telco", "Telco",
                "Offer",
                "OrderedServiceType",
                false, true);
        newData.put("ORD_ORDEREDSERVICETYPE", s);
        //addFieldToOutDetailsDataData(s, "ORD_ORDEREDSERVICETYPE");

        // ORD_REASON_ID
        s = GetOrderItemFieldValueByProductTypeTelco(
                "Telco", "Telco",
                "Offer",
                "OrderReason",
                false, true);
        newData.put("ORD_REASON_ID", s);

        // ORD_DONT_APPLY_PENALTY
        s = GetOrderItemFieldDinamicFieldValueByProdType(
                "Telco", "Telco",
                "Offer",
                "ATT_CONTRACT_PENALTY",
                false);
        newData.put("ORD_DONT_APPLY_PENALTY", s);

        return newData.toString();
    }

    public String GetORD_CONTRACT_LENGTHValue() throws Exception {
        String result = null;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String orderedServiceType = "";
        String prdtSubType = "";
        String orderItemAction   = "";
        String actionCode = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            orderedServiceType = GetJsonObjectStringValue(itemdata, "OrderedServiceType", false);
            if (!"Remove".equalsIgnoreCase(orderedServiceType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                if ("Offer".equalsIgnoreCase(prdtSubType) && !"Disconect".equalsIgnoreCase(orderItemAction)) {
                    return GetOrderItemDinamicValue(itemdata, "ATT_CONTRACT_TERM");
                }
            } else {
                if ("Offer".equalsIgnoreCase(prdtSubType) && "Disconect".equalsIgnoreCase(orderItemAction)) {
                    return GetOrderItemDinamicValue(itemdata, "ATT_CONTRACT_TERM");
                }
            }
        }
        return result;
    }

    public String GetORD_MANUAL_BILLING_FLAGValue() throws Exception {
        String result = null;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String prdtSubType = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            if ("Offer".equalsIgnoreCase(prdtSubType)) {
                return GetOrderItemDinamicValue(itemdata, "ATT_MANUAL_BIL");
            }
        }
        return result;
    }

    public String GetORD_SERVICE_DETAILValue() throws Exception {
        String result = null;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String serviceDetail = "";
        String productSubType   = "";
        String orderItemAction = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            serviceDetail = GetJsonObjectStringValue(itemdata, "ServiceDetail", false);
            productSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
            if ("ServiceBundle".equalsIgnoreCase(productSubType)) {
                if (isEmptyOrNull(result)) {
                    result = serviceDetail;
                } else {
                    if (!"Disconect".equalsIgnoreCase(orderItemAction)) {
                        result = serviceDetail;
                    }
                }
            }
        }

        return result;
    }

    public String GetORD_TECHNOLOGYValue() throws Exception {
        String result = null;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String accesTechnology = "";
        String accountingCode   = "";
        String orderItemAction = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            accesTechnology = GetJsonObjectStringValue(itemdata, "AccesTechnology", false);
            accountingCode = GetJsonObjectStringValue(itemdata, "AccountingCode", false);
            orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
            if ("PD_TELCO_TECH_LINE".equalsIgnoreCase(accountingCode)) {
                if (isEmptyOrNull(result)) {
                    result = accesTechnology;
                } else {
                    if (!"Disconect".equalsIgnoreCase(orderItemAction)) {
                        result = accesTechnology;
                    }
                }
            }
        }

        return result;
    }

    public String GetORD_ORD_DEACT_CANCEL_FLAGValue() throws Exception {
        String result = null;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String prdtSubType = "";
        String lastBillingDate   = "";
        String actionCode = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            lastBillingDate = GetJsonObjectStringValue(itemdata, "LastBillingDate", false);
            actionCode = GetJsonObjectStringValue(itemdata, "ActionCode", false);
            if ("Offer".equalsIgnoreCase(prdtSubType) && "Disconnect".equalsIgnoreCase(actionCode) && !isEmptyOrNull(lastBillingDate)) {
                result = "Y";
            }
        }

        return result;
    }

    public String GetORD_LASTBILLINGDATEValue() throws Exception {
        String result = null;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String prdtSubType = "";
        String lastBillingDate   = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            lastBillingDate = GetJsonObjectStringValue(itemdata, "LastBillingDate", false);
            if ("Offer".equalsIgnoreCase(prdtSubType)) {
                result = lastBillingDate;
            }
        }

        return result;
    }

    public boolean isTelcoAndRemove() throws Exception {
        boolean result = false;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String orderedServiceType = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            orderedServiceType = GetJsonObjectStringValue(itemdata, "OrderedServiceType", false);
            if ("Remove".equalsIgnoreCase(orderedServiceType)) {
                result = true;
                break;
            }
        }

        return result;
    }

    public boolean isORDER_OFFER_POPULATIONValue() throws Exception {
        boolean result = false;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String prdtSubType = "";
        String pAPSFulfillmentStatus  = "";
        String orderSubType = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            pAPSFulfillmentStatus = GetJsonObjectStringValue(itemdata, "PAPSFulfillmentStatus", false);
            orderSubType = GetJsonObjectStringValue(itemdata, "OrderSubType", false);
            if (("Offer".equalsIgnoreCase(prdtSubType) && "InComplete".equalsIgnoreCase(pAPSFulfillmentStatus)) || (
                   "CustInitiatedResume".equalsIgnoreCase(orderSubType) || "CustInitiatedSuspend".equalsIgnoreCase(orderSubType))) {
                result = true;
            }
        }

        return result;
    }

    public boolean isPAPSFulfillmentStatusInComplete() throws Exception {
        boolean result = false;
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String prdtSubType = "";
        String pAPSFulfillmentStatus  = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            pAPSFulfillmentStatus = GetJsonObjectStringValue(itemdata, "PAPSFulfillmentStatus", false);
            if ("Offer".equalsIgnoreCase(prdtSubType) && "InComplete".equalsIgnoreCase(pAPSFulfillmentStatus)) {
                result = true;
            }
        }

        return result;
    }
    public String GetOrderItemFieldValueByProductTypeTelco(
            String productType, String productTypeCompareTo,
            String itemSubtypeCompare,
            String field,
            boolean mandatory, boolean allValues) throws Exception {
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        String prdType = "";
        String prdtSubType = "";
        String orderItemAction = "";
        String val = "";
        JSONObject itemdata = null;
        //ProductType = "Electricity"
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdType = GetJsonObjectStringValue(itemdata, "ProductType", false);
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType) && !"Disconect".equalsIgnoreCase(orderItemAction)) {
                    try {
                        val = GetJsonObjectStringValue(itemdata, field, false);
                        // ja visus, tad atdala ar ";"
                        if (allValues) {

                        } else {
                            if (mandatory && isEmptyOrNull(val)) {
                                throw new Exception("Field " + field + " is mandatory");
                            }
                            break;
                        }
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

    public String GetOrderItemFieldValueByProductTypeNotDisconect(
            String productType, String productTypeCompareTo,
            String itemSubtypeCompare,
            String field,
            boolean mandatory) throws Exception {
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        String prdType = "";
        String prdtSubType = "";
        String orderItemAction = "";
        String val = ""; // vērtība, kur <OrderItemAction> <> 'Disconect'
        String val1 = ""; // otra vērtība

        JSONObject itemdata = null;
        //ProductType = "Electricity"
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdType = GetJsonObjectStringValue(itemdata, "ProductType", false);
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType)) {
                    try {

                        val = GetJsonObjectStringValue(itemdata, field, false);

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

    // serviceno for every request to UNICORN - ServiceId from ServiceOrderItem with ProductSubType = 'ServiceBundle',
    // if null - then ServiceId from child Order Itmen, there this filed is filled
    private String getTelcoServiceNo(JSONArray bundleItems) throws Exception {
        String result = "";
        JSONObject d = null;
        String productSubType = "";
        String serviceId = "";
        for (int i = 0; i < bundleItems.length(); i++) {
            d = bundleItems.getJSONObject(i);
            productSubType = GetJsonObjectStringValue(d, "ProductSubType", false);
            serviceId = GetJsonObjectStringValue(d, "ServiceId", false);
            if ("ServiceBundle".equalsIgnoreCase(productSubType)) {
                if (!isEmptyOrNull(serviceId)) {
                    return serviceId;
                } else {
                    return getChildServiceId(bundleItems, GetJsonObjectStringValue(d, "ParentOrderItemId", false));
                }
            }
        }
        return result;
    }

    private String getChildServiceId(JSONArray bundleItems, String parentOrderItemId) throws Exception {
        String result = "";
        JSONObject d = null;
        String orderItemId = "";
        String rootOrderItemId = "";
        String serviceId = "";
        for (int i = 0; i < bundleItems.length(); i++) {
            d = bundleItems.getJSONObject(i);
            rootOrderItemId = GetJsonObjectStringValue(d, "RootOrderItemId", false);
            orderItemId = GetJsonObjectStringValue(d, "OrderItemId", false);
            serviceId = GetJsonObjectStringValue(d, "ServiceId", false);

            if (!isEmptyOrNull(serviceId)) {
                return serviceId;
            } else {
                if (orderItemId.equalsIgnoreCase(rootOrderItemId)) {
                    return "";
                } else {
                    return getChildServiceId(bundleItems, GetJsonObjectStringValue(d, "ParentOrderItemId", false));
                }
            }

        }
        return result;
    }

    // Ja tam pašam OrderItem ir aizpildīts parametrs  OldServiceId, tad uz UNICORN jāpadod dinamiskais parametrs
    // ar key = 'ORD_PREVIOS_SERVICE_NO' un value = OldServiceId
    private String getOldServiceNo(JSONArray bundleItems) throws Exception {
        String result = "";
        JSONObject d = null;
        String productSubType = "";
        String serviceId = "";
        for (int i = 0; i < bundleItems.length(); i++) {
            d = bundleItems.getJSONObject(i);
            productSubType = GetJsonObjectStringValue(d, "ProductSubType", false);
            serviceId = GetJsonObjectStringValue(d, "ServiceId", false);
            if ("ServiceBundle".equalsIgnoreCase(productSubType)) {
                if (!isEmptyOrNull(serviceId)) {
                    return GetJsonObjectStringValue(d, "OldServiceId", false);
                } else {
                    return getChildServiceIdForOld(bundleItems, GetJsonObjectStringValue(d, "ParentOrderItemId", false));
                }
            }
        }
        return result;
    }

    private String getChildServiceIdForOld(JSONArray bundleItems, String parentOrderItemId) throws Exception {
        String result = "";
        JSONObject d = null;
        String orderItemId = "";
        String rootOrderItemId = "";
        String serviceId = "";
        for (int i = 0; i < bundleItems.length(); i++) {
            d = bundleItems.getJSONObject(i);
            rootOrderItemId = GetJsonObjectStringValue(d, "RootOrderItemId", false);
            orderItemId = GetJsonObjectStringValue(d, "OrderItemId", false);
            serviceId = GetJsonObjectStringValue(d, "ServiceId", false);

            if (!isEmptyOrNull(serviceId)) {
                return GetJsonObjectStringValue(d, "OldServiceId", false);
            } else {
                if (orderItemId.equalsIgnoreCase(rootOrderItemId)) {
                    return "";
                } else {
                    return getChildServiceId(bundleItems, GetJsonObjectStringValue(d, "ParentOrderItemId", false));
                }
            }

        }
        return result;
    }

}
