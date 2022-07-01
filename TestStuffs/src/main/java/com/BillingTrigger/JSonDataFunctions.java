package com.BillingTrigger;

import org.json.JSONArray;
import org.json.JSONObject;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
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

        addFieldToOutDataData("ORD_REQUEST_ID", GetBaseData().getGuid());
        addFieldToOutDataData("orderno", GetBaseData().getOrderNumber());
        addFieldToOutDataData("orderid", GetBaseData().getOrderId());

        addFieldToOutDataData("orderdate", FormatDate(GetBaseData().getOrderDate()));
        addFieldToOutDataData("ordernotes", GetBaseData().getNotes());
        addFieldToOutDataData("caller", GetBaseData().getCaller());

        addFieldToOutDataData("serviceno", GetServiceNoFromServiceBundle());



        addArrFieldToOutDataData("orderOffers", ProcessOrderPricing());

    }

    public void ProcessDefaultAtrributeData() throws Exception {
        JSONObject orderData = getOrderData();

        addFieldToOutDetailsDataData(GetBaseData().getOrderedService(), "ORD_ORDEREDSERVICE");
        addFieldToOutDetailsDataData("ORD_CUSTOMERNO", GetBaseData().getAccountNo());
        addFieldToOutDetailsDataData("ORD_BILLINGACCOUNTNO", GetBaseData().getBillAccountNumber());
        addFieldToOutDetailsDataData("ORD_SERVICE_COUNT", String.valueOf(GetUnicalOrederIdCount()));

    }

    private int GetUnicalOrederIdCount() throws Exception {
        int res = 0;
        JSONObject itemdat = null;
        String serviceId = "";
        int itemcount = getOrderDataItems().length();
        List<String> mylist = new ArrayList<>();

        for (int i = 0; i < itemcount; i++) {
            itemdat = getOrderDataItems().getJSONObject(i);
            serviceId = GetJsonObjectStringValue(itemdat, "ServiceId", false);
            if (!isEmptyOrNull(serviceId)) {
                mylist.add(serviceId);
            }
        }
        List<String> distinctElements = mylist.stream()
                .distinct()
                .collect(Collectors.toList());
        return distinctElements.size();
    }

    public String GetOrderItemLevelValue(String productType, String atrribute) throws Exception {
        boolean foundinitemsvalue = false;
        String value = "";
        JSONObject itemdata = null;

        if (getOrderDataItems().length() > 0) {
            int itemcount = getOrderDataItems().length();
            // meklējam atbilsošo item pēc productType
            String ProductType = "";
            int counter = 0;
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                ProductType = GetJsonObjectStringValue(itemdata, "ProductType", false);
                if (productType.equals(ProductType)) {
                    try {
                        value = GetJsonObjectStringValue(itemdata, atrribute, false);
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

    public JSONArray GeOrderItemsDinamicAtrrValueByProductType(String serviceBundle) throws Exception {
        boolean foundValue = false;
        boolean addEmptyValue = false;
        boolean isFoundProdType = false;
        JSONObject itemdata = null;
        Map<String, String> nameMatch = new HashMap<>();
        JSONArray result = new JSONArray();

        if (getOrderDataItems().length() > 0) {
            int itemcount = getOrderDataItems().length();
            // meklējam atbilsošo item pēc productType
            String ProductSubType = "";
            String atrrname = "";
            int counter = 0;
            JSONObject itemattrdata = null;
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                ProductSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                if ("ServiceBundle".equalsIgnoreCase(ProductSubType)) {
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
                                String datatypr = GetJsonObjectStringValue(itemattrdata, "valuedatatype__c", false);
                                //String valp = GetJsonObjectStringValue(itemattrdata, "attributedisplayname__c", false);
                                //if (atrribute.equals(valp)) {
                                    if ("Picklist".equals(datatypr)) {
                                        try {
                                            val = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo")
                                                    .getJSONObject("selectedItem"), "value", false);
                                            //foundValue = true;
                                        } catch (Exception e) {
                                            val = "";
                                            //addEmptyValue = true;
                                        }
                                    } else {
                                        try {
                                            val = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo"), "value", false);
                                            foundValue = true;
                                        } catch (Exception e) {
                                            val = "";
                                            //addEmptyValue = true;
                                        }
                                    }

                                    if (serviceBundle.equalsIgnoreCase(val)) {
                                        result.put(itemdata);
                                    }

                                    //if (counter > 0) {
                                    //    newkey = key + "_" + counter;
                                    //} else {
                                    //    newkey = key;
                                    //}

                                    //If any amount parameter (say ORD_WARRANTY_SUM) is 0, there is no need to send 0. You can pass: “”.
                                    //if ("ORD_WARRANTY_SUM".equals(key) && "0".equals(val)) {
                                    //    val = "";
                                    //}
                                    //addFieldToOutDetailsDataData(val, newkey);
                                    //orderAtrrItems.put(new JSONObject().put("value", val).put("key", newkey));
                                    //counter++;
                                //}
                            }
                        } // end of -> while (keys.hasNext()) {
                        //if (!foundValue && !addEmptyValue) {
                        //    if (!nameMatch.containsKey(key)) {
                        //        addFieldToOutDetailsDataData("", key);
                        //        //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                        //        nameMatch.put(key, "");
                        //    }
                        //}
                    } catch (Exception e) {
                        //addFieldToOutDetailsDataData("", key);
                        //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                    }
                } // --- end of if (productType.equals(ProductType)) {
            } // --- end of -> for (int i = 0; i < itemcount; i++)
            // var būt, ka neatrod ProductType, tad arī vaig pielikt tukšu
            //if (!isFoundProdType && !nameMatch.containsKey(key)) {
            //    addFieldToOutDetailsDataData("", key);
                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
            //}
        } else {
            //addFieldToOutDetailsDataData("", key);
            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
        return result;
    }

    public void GeOrderItemsDinamicAtrrValueByProductType(String productType, String atrribute, String key) throws Exception {
        boolean foundValue = false;
        boolean addEmptyValue = false;
        boolean isFoundProdType = false;
        JSONObject itemdata = null;
        Map<String, String> nameMatch = new HashMap<>();

        if (getOrderDataItems().length() > 0) {
            int itemcount = getOrderDataItems().length();
            // meklējam atbilsošo item pēc productType
            String ProductType = "";
            String atrrname = "";
            int counter = 0;
            JSONObject itemattrdata = null;
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                ProductType = GetJsonObjectStringValue(itemdata, "ProductType", false);
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
                                String datatypr = GetJsonObjectStringValue(itemattrdata, "valuedatatype__c", false);
                                String valp = GetJsonObjectStringValue(itemattrdata, "attributedisplayname__c", false);
                                if (atrribute.equals(valp)) {
                                    if ("Picklist".equals(datatypr)) {
                                        try {
                                            val = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo")
                                                    .getJSONObject("selectedItem"), "value", false);
                                            foundValue = true;
                                        } catch (Exception e) {
                                            val = "";
                                            addEmptyValue = true;
                                        }
                                    } else {
                                        try {
                                            val = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo"), "value", false);
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
                                    addFieldToOutDetailsDataData(val, newkey);
                                    //orderAtrrItems.put(new JSONObject().put("value", val).put("key", newkey));
                                    counter++;
                                }
                            }
                        } // end of -> while (keys.hasNext()) {
                        if (!foundValue && !addEmptyValue) {
                            if (!nameMatch.containsKey(key)) {
                                addFieldToOutDetailsDataData("", key);
                                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                                nameMatch.put(key, "");
                            }
                        }
                    } catch (Exception e) {
                        addFieldToOutDetailsDataData("", key);
                        //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                    }
                } // --- end of if (productType.equals(ProductType)) {
            } // --- end of -> for (int i = 0; i < itemcount; i++)
            // var būt, ka neatrod ProductType, tad arī vaig pielikt tukšu
            if (!isFoundProdType && !nameMatch.containsKey(key)) {
                addFieldToOutDetailsDataData("", key);
                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
            }
        } else {
            addFieldToOutDetailsDataData("", key);
            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
    }

    /**
     * Order pirmā līmeņa atribūtu parametrs
     *
     * @return
     */
    public void GetOrderItemLevelAtrrValue(String productType, String field, String key, Boolean mandatory)
            throws Exception
    {
        boolean foundinitemsvalue = false;
        JSONObject itemdata = null;
        // ja ir padoti orderitems
        if (getOrderDataItems().length() > 0) {
            int itemcount = getOrderDataItems().length();
            // meklējam atbilsošo item pēc productType
            String productTypeValue = "";
            String val = "";
            String newkey = "";
            int counter = 0;
            for (int i = 0; i < itemcount; i++) {
                itemdata = getOrderDataItems().getJSONObject(i);
                productTypeValue = GetJsonObjectStringValue(itemdata, "ProductType", false);
                if (productType.equals(productTypeValue)) {
                    if ("Shipping".equals(productType) && counter > 0) {
                        newkey = key + "_" + counter;
                    } else {
                        newkey = key;
                    }
                    try {
                        val = GetJsonObjectStringValue(itemdata, field, false);
                        foundinitemsvalue = true;
                    } catch (Exception e) {
                        val = "";
                        foundinitemsvalue = true;
                    }
                    // ja obligāts un tukšs, tad error
                    if (mandatory && isEmptyOrNull(val)) {
                        throw new Exception("Field " + field + " is mandatory");
                    } else {
                        addFieldToOutDetailsDataData(val, newkey);
                        //orderAtrrItems.put(new JSONObject().put("value", val).put("key", newkey));
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
                addFieldToOutDetailsDataData("", key);
                //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
                //}
            }

        } else {
            addFieldToOutDetailsDataData("", key);
            //orderAtrrItems.put(new JSONObject().put("value", "").put("key", key));
        }
    }

    private JSONArray ProcessOrderPricing() {
        JSONArray offerPriceObj = new JSONArray();
        int itemcount = getOrderDataItems().length();
        JSONObject objOrdPricing = null;
        JSONObject itemdata = null;

        String err = "";

        for (int i = 0; i < itemcount; i++) {
            String ORDER_LINE_PLAN_CODE_VALUE = ""; // pārnesu zem for loopa, savādāk string variablī saglabājas vērtība no iepriekšēja cikla
            String ORDER_LINE_PACKAGE_CODE = "";
            String ORDER_LINE_PROMOTION_UOM = "";
            String ORDER_LINE_TYPE = "";
            int typeDcount = 0;
            itemdata = getOrderDataItems().getJSONObject(i);
            Boolean addline = true;
            try {
                String orderItemSubType = GetJsonObjectStringValue(itemdata, "OrderSubType", false);
                String orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                String productSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                //SOAIP-1978
                if ("TELCO".equalsIgnoreCase(GetBaseData().getOrderedService())) {

                } else {
                    // SOABG-1402
                    if ("Tariff Change".equalsIgnoreCase(orderItemSubType)) {
                        if ("Disconnect".equalsIgnoreCase(orderItemAction) && "Plan".equalsIgnoreCase(productSubType)) {
                            addline = false;
                        }
                    }
                }
                if (addline) {
                    // orderpricing var būt masīvs
                    JSONArray pricdata = GetJSONArrayObj(itemdata, "OrderPricing");
                    int itempriccount = pricdata.length();
                    for (int j = 0; j < itempriccount; j++) {
                        objOrdPricing = pricdata.getJSONObject(j);
                        String sourcestr = GetJsonObjectStringValue(objOrdPricing, "Source", false);
                        String actionstr = GetJsonObjectStringValue(objOrdPricing, "Action", false);

                        String orderedServiceType = GetJsonObjectStringValue(itemdata, "OrderedServiceType", false);
                        if ("Promotion".equalsIgnoreCase(sourcestr)) {
                            ORDER_LINE_PLAN_CODE_VALUE = GetJsonObjectStringValue(objOrdPricing, "OCPPlanCode", false);
                            ORDER_LINE_PACKAGE_CODE = GetJsonObjectStringValue(objOrdPricing, "OCPPackageCode", false);
                            ORDER_LINE_PROMOTION_UOM = GetJsonObjectStringValue(objOrdPricing, "TimePlanUnit", false);
                            if (!isEmptyOrNull(ORDER_LINE_PROMOTION_UOM)) {
                                ORDER_LINE_PROMOTION_UOM = ORDER_LINE_PROMOTION_UOM.substring(0, 1);  // Translate Day -> D | Month -> M | Year -> Y
                            }
                        } else {
                            if ("Base".equalsIgnoreCase(sourcestr)) {
                                // if OrderedService = 'TELCO':
                                if ("TELCO".equalsIgnoreCase(GetBaseData().getOrderedService())) {
                                    ORDER_LINE_PLAN_CODE_VALUE = getTELCOPlanCode(getOrderDataItems(), orderedServiceType);
                                } else {
                                    // If <OrderedService> = 'Electricity':
                                    ORDER_LINE_PLAN_CODE_VALUE = getUnicornPlanCode(getOrderDataItems(), orderedServiceType);
                                }
                            }
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
                                        .put("ORDER_LINE_PRODUCT_QTY", GetORDER_LINE_PRODUCT_QTY(itemdata))
                                        .put("ORDER_LINE_COMPONENT_QTY", "1")
                                        // šis tika izņemts ar SOAIP-1943, pagaidām atstāju aizkomentētu
                                        // .put("ORDER_LINE_PROMO_ENDDATE", GetJsonObjectStringValue(objOrdPricing, "PromoEndDate", false))
                                        .put("ORDER_LINE_PROMO_ORDERNO", GetJsonObjectStringValue(objOrdPricing, "OCPRemark", false))
                                        .put("ORDER_LINE_NRC_WAIVER_REASON", GetJsonObjectStringValue(objOrdPricing, "OTCRemark", false))
                                        .put("ORDER_LINE_ADJ_CHARGE_CODE", JSONObject.NULL)
                                        .put("ORDER_LINE_ADJ_CHARGE_TYPE", JSONObject.NULL)
                                        .put("ORDER_LINE_ADJ_CODE", JSONObject.NULL)
                                        .put("ORDER_LINE_ADJ_REASON", JSONObject.NULL)
                        );
                    }
                }
            } catch (Exception e) {
                err = e.getMessage();
            }
        }
        return offerPriceObj;
    }

    private String GetORDER_LINE_PRODUCT_QTY(JSONObject itemdata) throws Exception {
        //     if OrderItem.AccountingCode = 'PD_TELCO_STATIC_IP', then value from atribute
        //     with attribute code = 'ATT_QUANTITY_STATIC_IP'
        //     else OrderItem.Quantity
        String accountingCode = GetJsonObjectStringValue(itemdata, "AccountingCode", false);
        if ("PD_TELCO_STATIC_IP".equalsIgnoreCase(accountingCode)) {
            return GetOrderItemDinamicValue(itemdata, "ATT_QUANTITY_STATIC_IP");
        } else {
            return GetJsonObjectStringValue(itemdata, "Quantity", false);
        }
    }

    private String getTELCOPlanCode(JSONArray data, String orderedServiceType) {



        return "";
    }

    private String getUnicornPlanCode(JSONArray data, String orderedServiceType) {
        String res = "";
        JSONObject itemdata1 = null;
        //JSONObject itemdata2 = null;

        int itemcount = data.length();
        String prdtSubType = "";
        String orderItemAction = "";
        //String orderPricingAction = "";

        for (int i = 0; i < itemcount; i++) {
            itemdata1 = getOrderDataItems().getJSONObject(i);
            try {
                prdtSubType = GetJsonObjectStringValue(itemdata1, "ProductSubType", false);
                orderItemAction = GetJsonObjectStringValue(itemdata1, "OrderItemAction", false);
                if ("Remove".equalsIgnoreCase(orderedServiceType)) {
                    if ("Plan".equalsIgnoreCase(prdtSubType)) {
                        return GetJsonObjectStringValue(itemdata1, "UnicornPlanCode", false);
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
                            return GetJsonObjectStringValue(itemdata1, "UnicornPlanCode", false);
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

        int itemcount = getOrderDataItems().length();
        String prdtSubType = "";
        String orderedService = "";

        for (int i = 0; i < itemcount; i++) {
            itemdata1 = getOrderDataItems().getJSONObject(i);
            try {
                prdtSubType = GetJsonObjectStringValue(itemdata1, "ProductSubType", false);
                orderedService = GetJsonObjectStringValue(itemdata1, "OrderedService", false);
                if ("TELCO".equalsIgnoreCase(orderedService)) {
                    if ("Offer".equalsIgnoreCase(prdtSubType)) {
                        return GetJsonObjectStringValue(itemdata1, "UnicornPackageCode", false);
                    }
                } else {
                    if ("RootObject".equalsIgnoreCase(prdtSubType)) {
                        return GetJsonObjectStringValue(itemdata1, "UnicornPackageCode", false);
                    }
                }

            } catch (Exception e) {
                res = "";
            }
        }
        return res;
    }

    public String GetOrderItemFieldValueByProductType(
            String productType, String productTypeCompareTo,
            String itemSubtypeCompare,
            String field,
            boolean mandatory, boolean allValues) throws Exception {
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        String prdType = "";
        String prdtSubType = "";
        String val = "";
        JSONObject itemdata = null;
        //ProductType = "Electricity"
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdType = GetJsonObjectStringValue(itemdata, "ProductType", false);
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType)) {
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

    public String GetOrderItemFieldDinamicFieldValueByProdType(
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
            prdType = GetJsonObjectStringValue(itemdata, "ProductType", false);
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType)) {
                    try {
                        val = GetOrderItemDinamicValue(itemdata, field);
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

    private String TranslateOrderLineAction(String orderItemAction) {
        if ("Disconnect".equalsIgnoreCase(orderItemAction))
            return "OFF";
        else
            return "ON";
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
                    String datatypr = GetJsonObjectStringValue(itemattrdata, "valuedatatype__c", false);
                    String valp = GetJsonObjectStringValue(itemattrdata, "attributeuniquecode__c", false);
                    if (field.equals(valp)) {
                        if ("Picklist".equals(datatypr)) {
                            try {
                                res = GetJsonObjectStringValue(
                                        itemattrdata.getJSONObject("attributeRunTimeInfo").getJSONObject("selectedItem"), "value", false);
                                return res;
                            } catch (Exception e) {
                                return "";
                            }
                        } else {
                            try {
                                res = GetJsonObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo"), "value", false);
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
