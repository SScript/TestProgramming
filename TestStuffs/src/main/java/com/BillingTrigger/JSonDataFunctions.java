package com.BillingTrigger;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;

public class JSonDataFunctions extends JSonDataFunctionsBase {

    public JSonDataFunctions(String inFullData, String env) throws Exception {
        super(inFullData, env);
        // ielasa kop�jos datus
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

        //addFieldToOutDataData("serviceno", GetServiceNoFromServiceBundle());

        //addArrFieldToOutDataData("orderOffers", ProcessOrderPricing(""));

    }

    public void ProcessDefaultAtrributeData() throws Exception {
        //JSONObject orderData = getOrderData();

        addFieldToOutDetailsDataData(GetBaseData().getOrderedService(), "ORD_ORDEREDSERVICE");
        addFieldToOutDetailsDataData(GetBaseData().getAccountNo(), "ORD_CUSTOMERNO");
        addFieldToOutDetailsDataData(GetBaseData().getBillAccountNumber(), "ORD_BILLINGACCOUNTNO");
        addFieldToOutDetailsDataData(String.valueOf(GetUnicalOrederIdCount()), "ORD_SERVICE_COUNT");

    }

    public JSONObject GetOrderITemBiOrderItemId(String id) throws Exception {
        int itemcount = getOrderDataItems().length();
        String orderItemId = "";
        JSONObject itemdata = null;
        for (int i = 0; i < itemcount; i++) {
            itemdata = getOrderDataItems().getJSONObject(i);
            orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
            if (id.equalsIgnoreCase(orderItemId)) {
                return itemdata;
            }
        }
        return null;
    }

    protected int GetUnicalOrederIdCount() throws Exception {
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
        return (distinctElements.size() == 0 ? 1 : distinctElements.size());  // SOAIP-2733, ja nulle, tad default atgrie� 1
    }

    public String GetOrderItemLevelValue(String productType, String atrribute) throws Exception {
        boolean foundinitemsvalue = false;
        String value = "";
        JSONObject itemdata = null;

        if (getOrderDataItems().length() > 0) {
            int itemcount = getOrderDataItems().length();
            // mekl�jam atbilso�o item p�c productType
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
            // mekl�jam atbilso�o item p�c productType
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

                                //If any amount parameter (say ORD_WARRANTY_SUM) is 0, there is no need to send 0. You can pass: ��.
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
            // var b�t, ka neatrod ProductType, tad ar� vaig pielikt tuk�u
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
            // mekl�jam atbilso�o item p�c productType
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

                                    //If any amount parameter (say ORD_WARRANTY_SUM) is 0, there is no need to send 0. You can pass: ��.
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
            // var b�t, ka neatrod ProductType, tad ar� vaig pielikt tuk�u
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
     * Order pirm� l�me�a atrib�tu parametrs
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
            // mekl�jam atbilso�o item p�c productType
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
                    // ja oblig�ts un tuk�s, tad error
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

    protected JSONArray ProcessOrderPricing(JSONArray bundleItems, String serviceBundle, String serviceNo) throws Exception {
        JSONArray offerPriceObj = new JSONArray();
        //int itemcount = getOrderDataItems().length();
        JSONObject objOrdPricing = null;
        JSONObject itemdata = null;
        String offerOrderItemId = getOfferOrderItemId(bundleItems);

        String err = "";
        boolean isAddDala = false;

        // j�paskat�s vai nav papildus entity, ko pielikts - TetAdjustmentDestination
        List<String> additionallyIdList = new ArrayList<>();
        JSONObject obj = null;
        JSONObject obj1 = null;
        String s1_tetAdjustmentDestination = "";
        String s1_rootOrderItemId = "";
        String s2_tetAdjustmentSource = "";
        String s2_rootOrderItemId = "";
        String s2_orderItemId = "";
        for (int i = 0; i < bundleItems.length(); i++) {
            obj = bundleItems.getJSONObject(i);
            s1_tetAdjustmentDestination = GetJsonObjectStringValue(obj, "Tet_AdjustmentDestination", false);
            s1_rootOrderItemId = GetJsonObjectStringValue(obj, "RootOrderItemId", false);

            // ja ir padots Tet_AdjustmentDestination, skatamies vai ir items ar t�du Tet_AdjustmentSource pie t� pa�a roota
            if (!isEmptyOrNull(s1_tetAdjustmentDestination)) {
                // s1_tetAdjustmentDestination var b�t vair�kas v�rt�bas atdal�tas ar komatu
                List<String> destListList = new ArrayList<String>();
                if (destListList.contains(",")) {
                    destListList = Arrays.asList(s1_tetAdjustmentDestination.split(","));
                } else {
                    destListList.add(s1_tetAdjustmentDestination);
                }
                for (int a = 0; a < destListList.size(); a++) {
                    String dest = destListList.get(a);
                    for (int j = 0; j < getOrderDataItems().length(); j++) {
                        obj1 = getOrderDataItems().getJSONObject(j);
                        s2_tetAdjustmentSource = GetJsonObjectStringValue(obj1, "Tet_AdjustmentSource", false);
                        s2_rootOrderItemId = GetJsonObjectStringValue(obj1, "RootOrderItemId", false);
                        s2_orderItemId = GetJsonObjectStringValue(obj1, "OrderItemId", false);
                        if (s1_rootOrderItemId.equalsIgnoreCase(s2_rootOrderItemId)
                                && dest.equalsIgnoreCase(s2_tetAdjustmentSource)) {
                            bundleItems.put(obj1);
                            additionallyIdList.add(s2_orderItemId);
                        }
                    }
                }
            }
        }

        for (int i = 0; i < bundleItems.length(); i++) {
            String ORDER_LINE_PLAN_CODE_VALUE = ""; // p�rnesu zem for loopa, sav�d�k string variabl� saglab�jas v�rt�ba no iepriek��ja cikla
            String ORDER_LINE_PACKAGE_CODE = "";
            String ORDER_LINE_PROMOTION_UOM = "";
            String ORDER_LINE_TYPE = "";
            int typeDcount = 0;
            itemdata = bundleItems.getJSONObject(i);
            Boolean addline = true;
            try {
                String orderItemSubType = GetJsonObjectStringValue(itemdata, "OrderSubType", false);
                String orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                String productSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                String abpPriceType = GetJsonObjectStringValue(itemdata, "ABPPriceType", false);
                String parentOrderItemId = GetJsonObjectStringValue(itemdata, "ParentOrderItemId", false);
                String rootOrderItemId = GetJsonObjectStringValue(itemdata, "RootOrderItemId", false);
                String orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false) ;
                String tet_FilterOrderPricing = GetJsonObjectStringValue(itemdata, "Tet_FilterOrderPricing", false);
                String tetAdjustmentSource = GetJsonObjectStringValue(itemdata, "Tet_AdjustmentSource", false);
                String tetAdjustmentDestination  = GetJsonObjectStringValue(itemdata, "Tet_AdjustmentDestination", false);
                String sendPricingtoUnicorn = GetJsonObjectStringValue(itemdata, "SendPricingtoUnicorn", false);
                String unicornServiceLevel = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
                boolean checkIsParentOrderItemWithoutDisconnect = false;

                //SOAIP-1978
                if ("TELCO".equalsIgnoreCase(GetBaseData().getOrderedService())) {
                    if (!"true".equalsIgnoreCase(sendPricingtoUnicorn)) {
                        continue;
                    }

                    // lai�am offerOrders cikl� visus TELCO, j�filtr� tur
//                    addline = true;
                    boolean isAllDisconnect = orderItemActionOnlyDisconnect(bundleItems);
                    if (orderItemActionOnlyDisconnect(bundleItems)) {
                        addline = true;
                    } else
                        if ("Cease Order".equalsIgnoreCase(productSubType)) {
                        addline = true;
                    } else
                        if (!"Disconnect".equalsIgnoreCase(orderItemAction)) {
                        addline = true;
                    } else {
                        if ("Disconnect".equalsIgnoreCase(orderItemAction) &&
                                checkIsParentOrderItemWithoutDisconnect(bundleItems, parentOrderItemId, orderItemId)) {
                            checkIsParentOrderItemWithoutDisconnect = true;
                            addline = true;
                        }
                    }
                } else {
                    // SOABG-1402 // �� da�a tiek izmantota ProcessJson fail�, ne-TELCO
                    if (!("Tariff Change".equalsIgnoreCase(orderItemSubType) && "Disconnect".equalsIgnoreCase(orderItemAction) && "Plan".equalsIgnoreCase(productSubType))) {
                        addline = false;
                    }
                }

                if ("true".equalsIgnoreCase(tet_FilterOrderPricing) || "Y".equalsIgnoreCase(tet_FilterOrderPricing)) {
                    addline = false;
                }

                if (addline) {
                    // orderpricing var b�t mas�vs
                    JSONArray pricdata = GetJSONArrayObj(itemdata, "OrderPricing");
                    int itempriccount = pricdata.length();
                    for (int j = 0; j < itempriccount; j++) {
                        objOrdPricing = pricdata.getJSONObject(j);
                        // �eit ir dati no OrderOffers(Pricing da�a)
                        String pricingSourceStr = GetJsonObjectStringValue(objOrdPricing, "Source", false);
                        String pricingActionStr = GetJsonObjectStringValue(objOrdPricing, "Action", false);
                        String chargeType = GetJsonObjectStringValue(objOrdPricing, "ChargeType", false);
                        String referenceNumber = GetJsonObjectStringValue(objOrdPricing, "ReferenceNumber", false);
                        String unicornPlanCode = getTELCOPlanCode(bundleItems, "", serviceNo);
                        String oCPPlanCode = GetJsonObjectStringValue(objOrdPricing, "OCPPlanCode", false);

                        // (SOAIP-2586) Nes�t�t tos ierakstus, kuriem Source = Agent
                        if ("Agent".equalsIgnoreCase(pricingSourceStr)) {
                            continue;
                        }
                        List<String> oCPPlanCodeList = new ArrayList<String>();
                        if (!isEmptyOrNull(unicornPlanCode)) {
                            if (!isEmptyOrNull(oCPPlanCode)) {
                                oCPPlanCode = oCPPlanCode; // + "," + unicornPlanCode;
                            } else {
                                oCPPlanCode = unicornPlanCode;
                            }
                        }
                        // SOAIP-2576
                        // Ja OrderItem.OrderPricing.OCPPlanCode satur vair�kus OCP pl�nus - t.i. satur ',' -
                        // pievienot UNICORN izsaukumam OfferPrice katram OCP planam atsevi��i.
                        // Piem�r�m OrderItem.OrderPricing.OCPPlanCode = 'z.OCP.Plan1,z.OCP.Plan2',
                        // tad pirmais OfferPrice ieraksts b�s ar ORDER_LINE_PLAN_CODE = 'z.OCP.Plan1',
                        // otrs - ar ORDER_LINE_PLAN_CODE = 'z.OCP.Plan2'.
                        if (!isEmptyOrNull(oCPPlanCode)) {
                            if (oCPPlanCode.contains(",")) {
                                oCPPlanCodeList = Arrays.asList(oCPPlanCode.split(","));
                            } else {
                                oCPPlanCodeList.add(oCPPlanCode);
                            }
                        } else {
                            oCPPlanCodeList.add("");
                        }

                        // SOAIP-2576
                        // S�t�t visus orderPricing ierakstus, kas ir zem offer, visiem servisiem,
                        // kas ir zem �� offer  - t.i. ja OrderItem.OrderPricing.Source = 'Promotion'
                        // un OrderItem.ProductSubType = 'Offer', tad padot katram servisam,
                        // kuram RootOrderItemId = OrderItemId, kas ir Offerim ar promotion.
//                                System.out.println("itemId: " + orderItemId + " and root: " + rootOrderItemId + " and offer: " + offerOrderItemId);
                        if ("Offer".equalsIgnoreCase(productSubType) && ("Promotion".equalsIgnoreCase(pricingSourceStr) || "Base".equalsIgnoreCase(pricingSourceStr))) {
                            // iz�emts BASE ar SOAIP-2732
                            if ("Base".equalsIgnoreCase(pricingSourceStr)) {
                                continue;
                            }
                            if (!rootOrderItemId.equals(offerOrderItemId)) {
                                continue;
                            }
                        }
                        // papildus atlaides ieraksts, tam nevaig base
                        if (additionallyIdList.contains(orderItemId)) {
                            if (!"Promotion".equalsIgnoreCase(pricingSourceStr)) {
                                continue;
                            }
                        }

                        // ja OrderItem.ABPPriceType = 'RC', �emt to ierakstu, kuram OrderItem.OrderPricing.ChargeType = 'Recurring';
                        // ja OrderItem.ABPPriceType = 'OTC', �emt to ierakstu, kuram OrderItem.OrderPricing.ChargeType = 'One-time'
                        if (!abpPriceType.isEmpty()) {
                            if (!(abpPriceType.equals("RC") && chargeType.equalsIgnoreCase("recurring"))
                                    && !(abpPriceType.equals("OTC") && chargeType.equalsIgnoreCase("one-time"))) {
//                                System.out.println("skip this1 = " + GetJsonObjectStringValue(objOrdPricing, "Amount", false));
                                continue; // skipojam iter�ciju, ejam uz n�kamo orderPricing objektu
                            }
                        }

                        if (abpPriceType.isEmpty() && "ABP".equalsIgnoreCase(pricingSourceStr)) {

                        }

                        // SOAIP-2600
                        // S�tit visus orderPricing ierakstus, kuriem OrderItem.OrderPricing.Source = 'Promotion'
                        // un kas ir zem OrderItem ar aizpild�tu TetAdjustmentSource, visiem servisiem,
                        // kas ir zem offer ar to pa�u RootOrderItemId
                        // un TetAdjustmentDestination =  TetAdjustmentSource no ieraksta ar promotion.
                        if (!"Offer".equalsIgnoreCase(productSubType) && !"Promotion".equalsIgnoreCase(pricingSourceStr)) {
                            if (isEmptyOrNull(tetAdjustmentSource)) {
                                if (!rootOrderItemId.equals(offerOrderItemId)
                                        && !tetAdjustmentDestination.equalsIgnoreCase(tetAdjustmentSource)) {
                                    continue;
                                }
                            }
                        }

                        for (int a = 0; a < oCPPlanCodeList.size(); a++) {
                            String orderLineAction = "";
                            String orderedServiceType = GetJsonObjectStringValue(itemdata, "OrderedServiceType", false);
                            if ("TELCO".equalsIgnoreCase(GetBaseData().getOrderedService())) {
                                ORDER_LINE_PACKAGE_CODE = getOrderLinePackageCode(bundleItems);
                            } else {
                                if ("Promotion".equalsIgnoreCase(pricingSourceStr)) {
                                    ORDER_LINE_PACKAGE_CODE = GetJsonObjectStringValue(objOrdPricing, "OCPPackageCode", false);
                                } else {
                                    ORDER_LINE_PACKAGE_CODE = getOrderLinePackageCode(bundleItems);
                                }
                            }
                            if ("Promotion".equalsIgnoreCase(pricingSourceStr)) {
                                // if OrderedService = 'TELCO':
                                if ("TELCO".equalsIgnoreCase(GetBaseData().getOrderedService())) {
                                    ORDER_LINE_PLAN_CODE_VALUE = oCPPlanCodeList.get(a); //getTELCOPlanCode(getOrderDataItems(), orderedServiceType, serviceNo);
                                } else {
                                    // If <OrderedService> = 'Electricity':
                                    ORDER_LINE_PLAN_CODE_VALUE = getUnicornPlanCode(getOrderDataItems(), orderedServiceType);
                                }
                                //ORDER_LINE_PACKAGE_CODE = GetJsonObjectStringValue(objOrdPricing, "OCPPackageCode", false);
                                ORDER_LINE_PROMOTION_UOM = GetJsonObjectStringValue(objOrdPricing, "TimePlanUnit", false);
                                if (!isEmptyOrNull(ORDER_LINE_PROMOTION_UOM)) {
                                    ORDER_LINE_PROMOTION_UOM = ORDER_LINE_PROMOTION_UOM.substring(0, 1);  // Translate Day -> D | Month -> M | Year -> Y
                                }
                            } else {
                                if ("Base".equalsIgnoreCase(pricingSourceStr) || "ABP".equalsIgnoreCase(pricingSourceStr)) {
                                    // if OrderedService = 'TELCO':
                                    if ("TELCO".equalsIgnoreCase(GetBaseData().getOrderedService())) {
                                        ORDER_LINE_PLAN_CODE_VALUE = oCPPlanCodeList.get(a); //getTELCOPlanCode(getOrderDataItems(), orderedServiceType, serviceNo);
                                    } else {
                                        // If <OrderedService> = 'Electricity':
                                        ORDER_LINE_PLAN_CODE_VALUE = getUnicornPlanCode(getOrderDataItems(), orderedServiceType);
                                    }
                                }
                                //ORDER_LINE_PACKAGE_CODE = getOrderLinePackageCode(itemdata);
                            }
                            ORDER_LINE_TYPE = TranslateOrderPricingSource(GetJsonObjectStringValue(objOrdPricing, "Source", false), objOrdPricing);
                            if ("D".equalsIgnoreCase(ORDER_LINE_TYPE)) {
                                typeDcount++;
                            }

                            if ("Promotion".equalsIgnoreCase(pricingSourceStr)) {
                                if ("Disconnect".equalsIgnoreCase(pricingActionStr)) {
                                    orderLineAction = "OFF";
                                } else {
                                    if ("Change".equalsIgnoreCase(pricingActionStr)) {
                                        orderLineAction = "EXISTING";
                                    } else {
                                        orderLineAction = "ON";
                                    }
                                }
                            } else {
                                if ("Disconnect".equalsIgnoreCase(orderItemAction)) {
                                    orderLineAction = "OFF";
                                } else {
                                    orderLineAction = "ON";
                                }
                            }

                            // ja ir add da�a, tad disconnect nes�tam
                            //  un iz��mums "Disconnect", kuriem parent order item  "OrderItemAction"  = Add/Existing/Chang
                            if (!isAddDala) {
                                if (!"OFF".equalsIgnoreCase(orderLineAction)) {
                                    isAddDala = true;
                                }
                            }
                            if ("Disconnect".equalsIgnoreCase(orderItemAction) && isAddDala && !checkIsParentOrderItemWithoutDisconnect) {
                                continue;
                            }

                            String orderLineAmount = TranslateOrderLineAmount(GetJsonObjectStringValue(objOrdPricing, "GiftQuantity", false),
                                    GetJsonObjectStringValue(objOrdPricing, "AdjustmentValue", false),
                                    GetJsonObjectStringValue(objOrdPricing, "VATExclusive", false),
                                    GetJsonObjectStringValue(objOrdPricing, "VATRate", false)).replace("-", "");
                            String orderLineUOM = TranslateOrderLineUOM(GetJsonObjectStringValue(objOrdPricing, "AdjustmentMethod", false),
                                    GetJsonObjectStringValue(objOrdPricing, "GiftQuantity", false), itemdata);
                            String orderLineSubtype = TranslateOrderLineSubType(GetJsonObjectStringValue(objOrdPricing, "Source", false),
                                    GetJsonObjectStringValue(objOrdPricing, "ChargeType", false), objOrdPricing);

                            offerPriceObj.put(
                                    new JSONObject()
                                            .put("ORDER_LINE_ITEM", "D".equalsIgnoreCase(ORDER_LINE_TYPE) ? orderItemId + "_" + typeDcount : orderItemId)
                                            .put("ORDER_LINE_PACKAGE_CODE", ORDER_LINE_PACKAGE_CODE)
                                            .put("ORDER_LINE_PLAN_CODE", ORDER_LINE_PLAN_CODE_VALUE)
                                            .put("ORDER_LINE_PRODUCT_CODE", !"Promotion".equalsIgnoreCase(pricingSourceStr) ?
                                                    GetJsonObjectStringValue(itemdata, "UnicornProductCode", false) : "")
                                            .put("ORDER_LINE_COMPONENT_CODE", !"Promotion".equalsIgnoreCase(pricingSourceStr) ?
                                                    GetJsonObjectStringValue(itemdata, "UnicornComponentCode", false) : "")
                                            .put("ORDER_LINE_SPECIAL_DISCOUNT_CODE", GetJsonObjectStringValue(objOrdPricing, "UnicornSpecialDiscountCode", false))
                                            .put("ORDER_LINE_ACTION", orderLineAction)
                                            .put("ORDER_LINE_TYPE", ORDER_LINE_TYPE)
                                            .put("ORDER_LINE_AMOUNT", orderLineAmount)
                                            .put("ORDER_LINE_SUB_TYPE", orderLineSubtype)
                                            .put("ORDER_LINE_UOM", orderLineUOM)
                                            .put("ORDER_LINE_PROMOTION_PERIOD", GetJsonObjectStringValue(objOrdPricing, "TimePlanDuration", false))
                                            .put("ORDER_LINE_PROMOTION_UOM", ORDER_LINE_PROMOTION_UOM)
                                            .put("ORDER_LINE_PRODUCT_QTY", GetORDER_LINE_PRODUCT_QTY(itemdata))
                                            .put("ORDER_LINE_COMPONENT_QTY", "1")
                                            // �is tika iz�emts ar SOAIP-1943, pagaid�m atst�ju aizkoment�tu
                                            // .put("ORDER_LINE_PROMO_ENDDATE", GetJsonObjectStringValue(objOrdPricing, "PromoEndDate", false))
                                            .put("ORDER_LINE_PROMO_ORDERNO", GetJsonObjectStringValue(objOrdPricing, "OCPRemark", false))
                                            .put("ORDER_LINE_NRC_WAIVER_REASON", GetJsonObjectStringValue(objOrdPricing, "OTCRemark", false))
                                            .put("ORDER_LINE_ADJ_CHARGE_CODE", "")
                                            .put("ORDER_LINE_ADJ_CHARGE_TYPE", "")
                                            .put("ORDER_LINE_ADJ_CODE", "")
                                            .put("ORDER_LINE_ADJ_REASON", "")
                            );
                        }
                    }
                }
            } catch (Exception e) {
                err = e.getMessage();
            }
        }
        return offerPriceObj;
    }

    private String getOfferOrderItemId(JSONArray items) throws Exception {
        JSONObject itemdata = null;
        String orderItemId = "";

        int itemcount = items.length();
        String prdtSubType = "";

        for (int i = 0; i < itemcount; i++) {
            itemdata = items.getJSONObject(i);
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);

            if ("Offer".equalsIgnoreCase(prdtSubType)) {
                orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", true);
                return orderItemId;
            }
        }

        return orderItemId;
    }

    private boolean checkIsParentOrderItemWithoutDisconnect(
            JSONArray data, String parentOrderItemId, String ordItemId) throws Exception {

        JSONObject itemdata = null;
        int itemcount = data.length();
        String orderItemIdCurr = "";
        String orderItemAction = "";
        String currParentOrderItemId = "";
        boolean isParent = false;
        String parentOrderItemIdCurr = "";

        do {
            for (int j1 = 0; j1 < itemcount; j1++) {
                itemdata = data.getJSONObject(j1);
                parentOrderItemIdCurr = GetJsonObjectStringValue(itemdata, "ParentOrderItemId", false);
                //parentOrderItemId = GetJsonObjectStringValue(itemdata, "ParentOrderItemId", false);
                orderItemIdCurr = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
                //unicornServiceLevel = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
                orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);

                // ja sakr�t items
                if (ordItemId.equalsIgnoreCase(orderItemIdCurr)) {
                    // vai tas ir p�d�jais
                    if (isEmptyOrNull(parentOrderItemIdCurr)) {
                        isParent = true;
                        //rootOrderId = orderItemId;
                    }
                    //if (!addedItemsId.contains(orderItemId)) {
                    //    addedItemsId.add(orderItemId);
                    //    res.put(itemdata);
                    //}

                    if ("Add".equalsIgnoreCase(orderItemAction) || "Existing".equalsIgnoreCase(orderItemAction) || "Change".equalsIgnoreCase(orderItemAction)) {
                        return true;
                    }

                    if (!isEmptyOrNull(parentOrderItemIdCurr)) {
                        ordItemId = parentOrderItemIdCurr;
                        break;
                    }
                }
            }

        } while (!isParent);

        return false;
    }

    private boolean orderItemActionOnlyDisconnect(JSONArray arr) throws Exception {

        JSONObject itemdata = null;
        String orderItemAction = "";

        //int itemcount = getOrderDataItems().length();
        int itemcount = arr.length();

        for (int i = 0; i < itemcount; i++) {
            //itemdata = getOrderDataItems().getJSONObject(i);
            itemdata = arr.getJSONObject(i);
            orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);

            if (!"Disconnect".equalsIgnoreCase(orderItemAction)) {
                return false;
            }
        }
        return true;
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

    private String getTELCOPlanCode(JSONArray data, String orderedServiceType, String serviceNo) {


        String res = "";
        JSONObject itemdata = null;

        int itemcount = data.length();
        String prdtSubType = "";
        String unicornPlanCode = "";
        String serviceId = "";

//        System.out.println(serviceNo);

        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            try {
                prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                unicornPlanCode = GetJsonObjectStringValue(itemdata, "UnicornPlanCode", false);
                serviceId = GetJsonObjectStringValue(itemdata, "ServiceId", false);
                if ("ServiceBundle".equalsIgnoreCase(prdtSubType) && serviceNo.equals(serviceId)) {
                    return unicornPlanCode;
                }

            } catch (Exception e) {
                res = "";
            }
        }
        return res;


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
                        // j�tiek kl�t pie OrderPricing, lai sal�dzin�tu vai Action ir Add, skat�t dok.
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

    private String getOrderLinePackageCode(JSONArray data) throws Exception {
        String res = "";
        JSONObject itemdata1 = null;

        int itemcount = data.length();
        String prdtSubType = "";
        String orderedService = "";
        orderedService = GetBaseData().getOrderedService();

        for (int i = 0; i < itemcount; i++) {
            itemdata1 = data.getJSONObject(i);
            try {
                prdtSubType = GetJsonObjectStringValue(itemdata1, "ProductSubType", false);
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

    public JSONArray CreateJSONArray(JSONArray data) {
        JSONArray result = new JSONArray();
        int length = data.length();

        for(int i = 0; i < length; ++i) {
            result.put(data.get(i));
        }
        return result;
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

    public void GetOrderAddressData(String AccountAddressId, JSONArray orderAtrrItems) throws Exception {

        DataSource ds = null;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        StringBuilder sb = new StringBuilder();
        // ja ir padots addreses kods
        if (!isEmptyOrNull(AccountAddressId)) {
            String sql =
                    "select addressconcat, flatname, postofficecode, POSTOFFICEID,  nvl(othertext,'') as othertext, " +
                            "lowestlevelid, IMMOVABLEID, lowestleveltype from ak_owner.ltk_full_addresses_md where addresskey=" +
                            AccountAddressId;

            // for testing purposes LOCAL
            if ("LOCAL".equalsIgnoreCase(getEnv())) {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@10.2.88.41:1534:CRASO", "AK_OWNER", "akwow45");
            } else { // server
                ctx = new InitialContext();
                ds = (DataSource) ctx.lookup("jdbc/AKADMIN"); //eis/DB/AKADMIN
                conn = ds.getConnection();
            }

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.execute();
            rs = pstmt.getResultSet();
            String val = "";
            Double dval;
            while (rs.next()) {
                GetBaseData().setAddressFound(true);
                //key = ORD_INSTLADDRPOSTOFFICEID, value - no lauka POSTOFFICEID
                dval = rs.getDouble("POSTOFFICEID");
                if (!isNull(dval)) {
                    dval = rs.getDouble("POSTOFFICEID");
//                    addFieldToOutDetailsDataData(String.format("%.0f", dval), "ORD_INSTLADDRPOSTOFFICEID");
                    orderAtrrItems.put(new JSONObject().put("value", String.format("%.0f", dval)).put("key", "ORD_INSTLADDRPOSTOFFICEID"));
                } else {
//                    addFieldToOutDetailsDataData("", "ORD_INSTLADDRPOSTOFFICEID");
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRPOSTOFFICEID"));
                }

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
//                    addFieldToOutDetailsDataData(String.format("%.0f", dval), "ORD_INSTLADDRLOWESTLEVELID");
                    orderAtrrItems.put(new JSONObject().put("value", String.format("%.0f", dval)).put("key", "ORD_INSTLADDRLOWESTLEVELID"));
                } else {
//                    addFieldToOutDetailsDataData("", "ORD_INSTLADDRLOWESTLEVELID");
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRLOWESTLEVELID"));
                }

                //key = ORD_INSTLADDRLOWESTLEVELTYPE, value  - ja adreses lowestleveltype ir:
                //109, tad '108'
                //nav 109, tad LOWESTLEVELTYPE
                dval = rs.getDouble("lowestleveltype");
                if (!isNull(dval)) {
                    if (dval == 109) {
//                        addFieldToOutDetailsDataData("108", "ORD_INSTLADDRLOWESTLEVELTYPE");
                        orderAtrrItems.put(new JSONObject().put("value", "108").put("key", "ORD_INSTLADDRLOWESTLEVELTYPE"));
                    } else {
//                        addFieldToOutDetailsDataData(String.format("%.0f", dval), "ORD_INSTLADDRLOWESTLEVELTYPE");
                        orderAtrrItems.put(new JSONObject().put("value", String.format("%.0f", dval)).put("key", "ORD_INSTLADDRLOWESTLEVELTYPE"));
                    }
                } else {
//                    addFieldToOutDetailsDataData("", "ORD_INSTLADDRLOWESTLEVELTYPE");
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRLOWESTLEVELTYPE"));
                }


                //key = ORD_INSTLADDRFLAT, value  - no lauka FLATNAME
                val = rs.getString("flatname");
                if (!isEmptyOrNull(val)) {
//                    addFieldToOutDetailsDataData(val, "ORD_INSTLADDRFLAT");
                    orderAtrrItems.put(new JSONObject().put("value", val).put("key", "ORD_INSTLADDRFLAT"));
                } else {
//                    addFieldToOutDetailsDataData("", "ORD_INSTLADDRFLAT");
                    orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_INSTLADDRFLAT"));
                }
//                addFieldToOutDetailsDataData(val, "ORD_OTHERTEXT");
//                addFieldToOutDetailsDataData(val, "ORD_ADDITIONALINFO");
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_OTHERTEXT"));
                orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_ADDITIONALINFO"));
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
    }
}
