package com.BillingTrigger;

import jdk.nashorn.internal.parser.JSONParser;
import org.apache.kafka.clients.admin.AlterConsumerGroupOffsetsOptions;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProcessTelco extends JSonDataFunctions {

    public ProcessTelco(String inFullData, String env) throws Exception {
        super(inFullData, env);
//        ProcessForTelco(); - šis izraisīja dubultu ProcessForTelco() asptrādi
    }

    public SimpleDateFormat formatFrom = new SimpleDateFormat("yyyy-MM-dd");
    public SimpleDateFormat formatTo = new SimpleDateFormat("dd/MM/yyyy");
    public Resp result;
    protected boolean isAddressFound = false;
    protected String orderItemIdFromServiceNo = "";
    public JSONArray orderAtrrItems = new JSONArray();
    public String serviceNumber = "";
    protected JSONObject responseVlocJson;
    public JSONObject order;
    public static JSONArray orderItems;

    public JSONArray itemdata_primary = new JSONArray();
    public JSONArray itemdata_secondary = new JSONArray();
    public JSONArray itemdata_tertiary = new JSONArray();
    public JSONArray itemdata_quarternary = new JSONArray();

    public List<String> servidslist = new ArrayList<>();
    public Map<String, JSONObject> servidslistdata = new HashMap<>();

    public Resp ProcessForTelco() throws Exception {

        result = new Resp();
        responseVlocJson = new JSONObject();
        order = new JSONObject();
        orderItems = new JSONArray();

        //  -> te var būt vair�?ki saformēti izsaukumi
        // OrderItem ar ProductSubType = 'ServiceBundle' ar atribūta ATT_SERVICE_LEVEL vērtību  = 'Primary';

        //String ServiceBundlevalues[] = {"Primary", "Secondary", "Tertiary", "Quarternary"};

        // sadalu itemus jau pa ServiceBundlevalues
        String primaryserviceNumber = "";
        String secondaryserviceNumber = "";
        String tertiaryserviceNumber = "";
        String quarternaryserviceNumber = "";
        
//        String serviceNumber = "";
        try {
            //itemdata_primary = GeOrderItemsByServiceLevel("Primary");
            //itemdata_secondary = GeOrderItemsByServiceLevel("Secondary");
            //itemdata_tertiary = GeOrderItemsByServiceLevel("Tertiary");
            //itemdata_quarternary = GeOrderItemsByServiceLevel("Quarternary");

            servidslist = GeOrderServiceNumbers();
            //if (!servidslist.contains(secondaryserviceNumber)) {servidslist.add(secondaryserviceNumber);}
            //if (!servidslist.contains(tertiaryserviceNumber)) {servidslist.add(tertiaryserviceNumber);}
            //if (!servidslist.contains(quarternaryserviceNumber)) {servidslist.add(quarternaryserviceNumber);}
            System.out.println("servidslist: " + servidslist.toString());

            // aizpildam itemus pēc serviceid, izsaukumi ir tik, cik unikālie service id
            // servidslistdata
            servidslistdata = filldatawithitems(servidslist);

            if (itemdata_primary.length() > 0) {
                serviceNumber = getTelcoServiceNo(itemdata_primary);
                result.SendJsonStr1 = ProcessTelcoServiceBundleLine(itemdata_primary, "Primary");
                result.callCount = 1;
                System.out.println("Primary: " + serviceNumber);
                primaryserviceNumber = serviceNumber;
            }

            if (itemdata_secondary.length() > 0) {
                serviceNumber = getTelcoServiceNo(itemdata_secondary);
                result.SendJsonStr2 = ProcessTelcoServiceBundleLine(itemdata_secondary, "Secondary");
                result.callCount = 2;
                System.out.println("Secondary: " + serviceNumber);
                secondaryserviceNumber = serviceNumber;
            }

            if (itemdata_tertiary.length() > 0) {
                serviceNumber = getTelcoServiceNo(itemdata_tertiary);
                result.SendJsonStr3 = ProcessTelcoServiceBundleLine(itemdata_tertiary, "Tertiary");
                result.callCount = 3;
                System.out.println("Tertiary: " + serviceNumber);
                tertiaryserviceNumber = serviceNumber;
            }

            if (itemdata_quarternary.length() > 0) {
                serviceNumber = getTelcoServiceNo(itemdata_quarternary);
                result.SendJsonStr4 = ProcessTelcoServiceBundleLine(itemdata_quarternary, "Quarternary");
                result.callCount = 4;
                System.out.println("Quarternary: " + serviceNumber);
                quarternaryserviceNumber = serviceNumber;
            }


            result.RetCode = "1";
            result.RetMsg = "OK";
        } catch (Exception e) {

            if (e.getMessage().contains("mandatory")) {
                result.RetCode = "SOA_164[095]";
                result.RetMsg = e.getMessage();
                order.put("ErrorCode", "SOA_164[004]");
                order.put("Description", e.getMessage());
                result.responseVlocJson = responseVlocJson.toString();
            } else {
                result.RetCode = "SOA_164[099]";
                result.RetMsg = "Global error: " + e.getMessage();
                order.put("ErrorCode", "SOA_164[004]");
                order.put("Description", e.getMessage());
                result.responseVlocJson = responseVlocJson.toString();
            }
//            e.printStackTrace();
        }


        result.responseVlocJson = responseVlocJson.toString();
        return result;
    }

    private List<String> GeOrderServiceNumbers() throws Exception {
        List<String> result = new ArrayList<>();
        String data = "";
        JSONArray orderdataitems  = getOrderDataItems();
        JSONObject itemdata = null;
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            data = GetJsonObjectStringValue(itemdata, "ServiceId", false);
            if (!"".equalsIgnoreCase(data) && !result.contains(data)) {
                result.add(data);
            }
        }
        return result;
    }

    private JSONArray GeOrderItemsByServiceLevel(String level) throws Exception {
        JSONArray result = new JSONArray();
        String data = "";
        JSONArray orderdataitems  = getOrderDataItems();
        JSONObject itemdata = null;
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            data = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
            if (level.equalsIgnoreCase(data)) {
                result.put(itemdata);
            }
        }
        return result;
    }

    private String ProcessTelcoServiceBundleLine(JSONArray bundleItems, String serviceBundle) throws Exception {



// Vec�? daļa
//        responseVlocJson.put("OrderId", GetBaseData().getOrderId());
//        responseVlocJson.put("OrderNumber", GetBaseData().getOrderNumber());
//        responseVlocJson.put("Status", "Billing Activation Failed");
//        responseVlocJson.put("BillActivationDate", GetBaseData().getOrderDate());
//        responseVlocJson.put("ServiceActivationDate", "");
//        responseVlocJson.put("GroupId", "");

// p�?rnesu responseVlocJson daļu uz �?ejieni, jaun�? struktūra SOAIP-2664

        JSONObject rowdata = null;
        String groupIdStr = "";
        String prdSubType = "";
        String billActivationDate = getBillActivationDate(GetBaseData().getOrderDate());



        JSONArray orderdataitems  = getOrderDataItems();

        for (int i = 0; i < orderdataitems.length(); i++) {

            rowdata = orderdataitems.getJSONObject(i);
            prdSubType = GetJsonObjectStringValue(rowdata, "ProductSubType", false);

            if (!prdSubType.equalsIgnoreCase("Offer")) {
                continue;
            }

            orderItems.put(new JSONObject()
            .put("OrderItemID", GetJsonObjectStringValue(rowdata, "OrderItemId", false))
            .put("ServiceNumber", serviceNumber)
            .put("BillActivationDate", billActivationDate)
            .put("ServiceActivationDate", "")
            .put("Status", "")
            .put("Description", "")
            .put("ErrorCode", "")
            .put("GroupId", ""));

        }


        order.put("OrderId", GetBaseData().getOrderId());
        order.put("OrderNumber", GetBaseData().getOrderNumber());
        order.put("Status", "Billing Activation Failed");
        order.put("BillActivationDate", billActivationDate);
        order.put("Description", "");
        order.put("ErrorCode", "");
        order.put("GroupId", groupIdStr);
        order.put("OrderItem", orderItems);

        responseVlocJson.put("Order", new JSONArray().put(order));


        String s = "";
        boolean isValueInOrderLine = false;

        // paņem uzreiz kopējos base datus
        //JSONParser parser = new JSONParser();
        JSONObject newData =  new JSONObject(outData.toString());  // (JSONObject) parser.parse(outData.toString());
        //newData.put("ORD_REQUEST_ID", GetBaseData().getGuid());
        //newData.put("orderno", GetBaseData().getOrderNumber());
        //newData.put("orderid", GetBaseData().getOrderId());
        //newData.put("orderdate", FormatDate(GetBaseData().getOrderDate()));
        //newData.put("ordernotes", GetBaseData().getNotes());
        //newData.put("caller", GetBaseData().getCaller());

        // paņem uzreiz kopējos detail datus
        JSONArray orderAtrrItems = CreateJSONArray(outDetailsData);

        // -------------------
        // pieliek TELCO datus
        // -------------------
        orderAtrrItems.put(new JSONObject().put("value", GetBaseData().getGuid()).put("key", "ORD_REQUEST_ID"));


        JSONObject d = null;
        // serviceno for every request to UNICORN - ServiceId from ServiceOrderItem with
        // ProductSubType = 'ServiceBundle', if null - then ServiceId from child Order Itmen,
        // there this filed is filled.  Ja tam pašam OrderItem ir aizpildīts parametrs  OldServiceId,
        // tad uz UNICORN jāpadod dinamiskais parametrs ar key = 'ORD_PREVIOUS_SERVICE_NO' un value = OldServiceId.
        s = getTelcoServiceNo(bundleItems);
        newData.put("serviceno", s);

        //newData.put("ORD_PREVIOUS_SERVICE_NO", getOldServiceNo(bundleItems)); orderItemIdFromServiceNo
        if (!isEmptyOrNull(s)) {
            d= GetOrderITemBiOrderItemId(orderItemIdFromServiceNo);
            if (null != d) {
                s = GetJsonObjectStringValue(d, "OldServiceId", false);
                if (!isEmptyOrNull(s)) {
                    orderAtrrItems.put(new JSONObject()
                            .put("value", s)
                            .put("key", "ORD_PREVIOUS_SERVICE_NO"));
                }
            }
        }

        //orderAtrrItems.put(new JSONObject().put("value", getOldServiceNo(bundleItems)).put("key", "ORD_PREVIOUS_SERVICE_NO"));


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
//        newData.put("ORD_ORDERITEMID", ids);
        orderAtrrItems.put(new JSONObject().put("value", ids).put("key", "ORD_ORDERITEMID"));


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
//                newData.put("ORD_EQ_SERIAL_NO_" + (i + 1), GetJsonObjectStringValue(d, "SerialNumber", false));
                orderAtrrItems.put(new JSONObject().put("value", GetJsonObjectStringValue(d, "SerialNumber", false)).put("key", "ORD_EQ_SERIAL_NO_" + (i + 1)));


                //dinamiskais parametrs ar key = 'ORD_EQ_INITIAL_PRICE_x',
                //      kur x - kārtas numurs, un value =Vlocity parametrs <OrderItem.CPEInitialPrice>;
//                newData.put("ORD_EQ_INITIAL_PRICE_" + (i + 1), GetJsonObjectStringValue(d, "CPEInitialPrice", false));
                orderAtrrItems.put(new JSONObject().put("value", GetJsonObjectStringValue(d, "CPEInitialPrice", false)).put("key", "ORD_EQ_INITIAL_PRICE_" + (i + 1)));


                //dinamiskais parametrs ar key = 'ORD_EQ_REMAINDER_PRICE_x',
                //      kur x - kārtas numurs, un value = Vlocity parametrs <OrderItem.RemainingPrice>;
//                newData.put("ORD_EQ_REMAINDER_PRICE_" + (i + 1), GetJsonObjectStringValue(d, "RemainingPrice", false));
                orderAtrrItems.put(new JSONObject().put("value", GetJsonObjectStringValue(d, "RemainingPrice", false)).put("key", "ORD_EQ_REMAINDER_PRICE_" + (i + 1)));


                //dinamiskais parametrs ar key = 'ORD_EQ_BUY_FLAG_x',
                //      kur x - kārtas numurs, un value = 'N''Y', ja Vlocity parametrs <OrderItem.WillCustomerReturnesCPE> = 'No';
//                newData.put("ORD_EQ_BUY_FLAG_" + (i + 1), "Y");
                orderAtrrItems.put(new JSONObject().put("value", "Y").put("key", "ORD_EQ_BUY_FLAG_" + (i + 1)));


                //dinamiskais parametrs ar key = 'ORD_EQ_TYPE_OF_SERVICE_x',
                //      kur x - kārtas numurs, un value =Vlocity parametrs <OrderItem.EquipmentType>;
//                newData.put("ORD_EQ_TYPE_OF_SERVICE_" + (i + 1), GetJsonObjectStringValue(d, "EquipmentType", false));
                orderAtrrItems.put(new JSONObject().put("value", GetJsonObjectStringValue(d, "EquipmentType", false)).put("key", "ORD_EQ_TYPE_OF_SERVICE_" + (i + 1)));

            }
        }

        // ORD_CONTRACT_LENGTH
//        newData.put("ORD_CONTRACT_LENGTH", GetORD_CONTRACT_LENGTHValue());
        orderAtrrItems.put(new JSONObject().put("value",
                        GetORD_CONTRACT_LENGTHValue())
                .put("key", "ORD_CONTRACT_LENGTH"));


        // ORD_MANUAL_BILLING_FLAG
//        newData.put("ORD_MANUAL_BILLING_FLAG", GetORD_MANUAL_BILLING_FLAGValue());
        orderAtrrItems.put(new JSONObject().put("value",
                        GetORD_MANUAL_BILLING_FLAGValue())
                .put("key", "ORD_MANUAL_BILLING_FLAG"));


        // ORD_SERVICE_DETAIL
//        newData.put("ORD_SERVICE_DETAIL", GetORD_SERVICE_DETAILValue());
        orderAtrrItems.put(new JSONObject().put("value", GetORD_SERVICE_DETAILValue()).put("key", "ORD_SERVICE_DETAIL"));


        // ORD_TECHNOLOGY
//        newData.put("ORD_TECHNOLOGY", GetORD_TECHNOLOGYValue());
        orderAtrrItems.put(new JSONObject().put("value",
                        GetORD_TECHNOLOGYValue())
                .put("key", "ORD_TECHNOLOGY"));


        isValueInOrderLine = isTelcoAndRemove();
        if (isValueInOrderLine) {
            //  value = "Y", ja OrderItemā ar ProductSubType = "Offer" un ActionCode = "Disconnect"
            //  un ir aizpildīts parametrs LastBillingDate un tā vērtība ir lielāka par tekošo datumu
            //  vai ja SF parametra 'Order Deactivation Cancel Flag' vērtība ir 'Y'. Parējos gadījumos "null". ???
            // ORD_DEACT_CANCEL_FLAG
//            newData.put("ORD_DEACT_CANCEL_FLAG", GetORD_ORD_DEACT_CANCEL_FLAGValue());
            orderAtrrItems.put(new JSONObject().put("value",
                            GetORD_ORD_DEACT_CANCEL_FLAGValue())
                    .put("key", "ORD_DEACT_CANCEL_FLAG"));


            //  value = OrderItem.LastBillingDate no OrderItem ar ProductSubType = "Offer".
            // ORD_LASTBILLINGDATE
//            newData.put("ORD_LASTBILLINGDATE", GetORD_LASTBILLINGDATEValue());
            orderAtrrItems.put(new JSONObject().put("value",
                            GetORD_LASTBILLINGDATEValue())
                    .put("key", "ORD_LASTBILLINGDATE"));
        }

        // ORD_OFFER_POPULATION
        isValueInOrderLine = isORDER_OFFER_POPULATIONValue();
        if (isValueInOrderLine) {
            orderAtrrItems.put(new JSONObject().put("value", "N").put("key", "ORD_OFFER_POPULATION"));
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "Y").put("key", "ORD_OFFER_POPULATION"));
        }

        // ORD_FALSE_ACTIVATION
        isValueInOrderLine = isPAPSFulfillmentStatusInComplete();
        if (isValueInOrderLine) {
            orderAtrrItems.put(new JSONObject().put("value", "Y").put("key", "ORD_FALSE_ACTIVATION"));
        } else {
            orderAtrrItems.put(new JSONObject().put("value", "").put("key", "ORD_FALSE_ACTIVATION"));

        }

        // ORD_BILLING_ACTIVATION_DATE
        s = GetOrderItemFieldValueByProductTypeTelco(
                "Telco", "Telco",
                "Offer",
                "BillActivationDate",
                true, true);

        try {
            Date date = formatFrom.parse(s);
            s = formatTo.format(date);
        } catch (Exception ex) {
            s = "";
        }

        orderAtrrItems.put(new JSONObject().put("value", isEmptyOrNull(s) ? "" : s).put("key", "ORD_BILLING_ACTIVATION_DATE"));



        // ORD_ORDEREDSERVICE
//        newData.put("ORD_ORDEREDSERVICETYPE", GetBaseData().getOrderedServiceType());
//        orderAtrrItems.put(new JSONObject().put("value", GetBaseData().getOrderedServiceType()).put("key", "ORD_ORDEREDSERVICETYPE"));


        s = GetOrderItemFieldValueByProductTypeTelco(
                "Telco", "Telco",
                "Offer",
                "OrderedServiceType",
                false, true);
        orderAtrrItems.put(new JSONObject().put("value", isEmptyOrNull(s) ? "" : s).put("key", "ORD_ORDEREDSERVICETYPE"));

        //addFieldToOutDetailsDataData(s, "ORD_ORDEREDSERVICETYPE");

        // ORD_REASON_ID
        s = GetOrderItemFieldValueByProductTypeTelco(
                "Telco", "Telco",
                "Offer",
                "OrderReason",
                false, true);
        orderAtrrItems.put(new JSONObject().put("value", isEmptyOrNull(s) ? "" : s).put("key", "ORD_REASON_ID"));


        // ORD_DONT_APPLY_PENALTY
        s = GetOrderItemFieldDinamicFieldValueByProdType(
                "Telco", "Telco",
                "Offer",
                "ATT_CONTRACT_PENALTY",
                false);
        orderAtrrItems.put(new JSONObject().put("value", s).put("key", "ORD_DONT_APPLY_PENALTY"));

        // 20. (SOAIP-2397) Pievienot dinamisko parametru ar key = "ORD_SERVICE_COUNT" un value = unikālo servisu skaits SF izsaukumā.
        orderAtrrItems.put(new JSONObject().put("value", String.valueOf(GetUnicalOrederIdCount())).put("key", "ORD_SERVICE_COUNT"));
        orderAtrrItems.put(new JSONObject().put("value", "Telco").put("key", "ORD_ORDEREDSERVICE"));
        orderAtrrItems.put(new JSONObject().put("value", GetBaseData().getAccountNo()).put("key", "ORD_CUSTOMERNO"));
        orderAtrrItems.put(new JSONObject().put("value", GetBaseData().getBillAccountNumber()).put("key", "ORD_BILLINGACCOUNTNO"));



        // pārbaudam adresi

            AccountAddressId = GetItemServiceAddressKey();
        System.out.println("accountaddressid: " + AccountAddressId);

        result.addressinfo = "AccountAddressId " + AccountAddressId + " orderedService: Telco";
        try {
            if (!isEmptyOrNull(AccountAddressId)) {
                GetBaseData().setAddressFound(false);
                GetOrderAddressData(AccountAddressId);
                result.addressinfo = "Adrese : " + AccountAddressId + "  atrasta = " + String.valueOf(GetBaseData().isAddressFound()) + "  : Telco";
                if (!GetBaseData().isAddressFound()) {
                    result.RetCode = "SOA_164[003]";
                    result.RetMsg = "Adrese : " + AccountAddressId + " nav atrasta.";
                    orderItems.getJSONObject(result.callCount).put("ErrorCode", "SOA_164[004]");
                    orderItems.getJSONObject(result.callCount).put("Description", "Adrese : " + AccountAddressId + " nav atrasta.");
                }
            }
        } catch (Exception e) {
            // ja addresskey padod kā sviestainu stringu, tad ir kļūda šeit
            result.RetCode = "SOA_164[003]";
            result.RetMsg = "Adrese : " + AccountAddressId + " nav atrasta.";
            orderItems.getJSONObject(result.callCount).put("ErrorCode", "SOA_164[004]");
            orderItems.getJSONObject(result.callCount).put("Description", "Adrese : " + AccountAddressId + " nav atrasta.");
            e.printStackTrace();
        }



        newData.put("orderdetails", orderAtrrItems);

        newData.put("orderOffers", ProcessOrderPricing(bundleItems, serviceBundle, getTelcoServiceNo(bundleItems)));

        return newData.toString();
    }



    private String GetItemServiceAddressKey() throws Exception {
        //ItemServiceAddressKey
        String res = "";
        JSONArray orderdataitems  = getOrderDataItems();
        JSONObject itemdata = null;

        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            res = GetJsonObjectStringValue(itemdata, "ItemServiceAddressKey", false);
            if (!isEmptyOrNull(res)) {
                return res;
            }
        }

        return res;
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
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            if (!"Remove".equalsIgnoreCase(orderedServiceType)) {
                orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                if ("Offer".equalsIgnoreCase(prdtSubType) && !"Disconnect".equalsIgnoreCase(orderItemAction)) {
                    return GetOrderItemDinamicValue(itemdata, "ATT_CONTRACT_TERM");
                }
            } else {
                if ("Offer".equalsIgnoreCase(prdtSubType) && "Disconnect".equalsIgnoreCase(orderItemAction)) {
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
                return GetOrderItemDinamicValue(itemdata, "ATT_MANUAL_BILL");
            }
        }
        return result;
    }

    public String GetORD_SERVICE_DETAILValue() throws Exception {
        String result = "";
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String serviceDetail = "";
        String serviceId = "";
        String productSubType   = "";
        String orderItemAction = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            serviceDetail = GetJsonObjectStringValue(itemdata, "ServiceDetail", false);
            serviceId = GetJsonObjectStringValue(itemdata, "ServiceId", false);
            productSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
            if ("ServiceBundle".equalsIgnoreCase(productSubType) && !serviceDetail.isEmpty() && serviceId.equals(serviceNumber)) {
                if (!"Disconnect".equalsIgnoreCase(orderItemAction)) {
                    return serviceDetail;
                } else {
                    result = serviceDetail;
                }
            }
        }
        return result;
    }

    public String GetORD_TECHNOLOGYValue() throws Exception {
        String result = "";
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        String accessTechnology = "";
        String accountingCode   = "";
        String orderItemAction = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            accessTechnology = GetJsonObjectStringValue(itemdata, "AccessTechnology", false);
            accountingCode = GetJsonObjectStringValue(itemdata, "AccountingCode", false);
            orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);

            if ("PD_TELCO_TECH_LINE".equalsIgnoreCase(accountingCode) && !accessTechnology.isEmpty()) {
                if (!"Disconnect".equalsIgnoreCase(orderItemAction)) {
                    return accessTechnology;
                } else {
                    result = accessTechnology;
                }
            }
        }

        return result;
    }

    public String GetORD_ORD_DEACT_CANCEL_FLAGValue() throws Exception {
        String result = "NULL";
        //JSONArray data  = getOrderDataItems();
        //int itemcount = data.length();
        //JSONObject itemdata = null;
        //String prdtSubType = "";
        //String lastBillingDate   = "";
        //String orderItemAction = "";
        //String ordDeactCancelFlag = GetBaseData().getOrdDeactCancelFlag();

        //Date todayDate = formatFrom.parse(formatFrom.format(new Date()));
        
        String ordDeactCancelFlag = GetJsonObjectStringValue(getOrderData(), "ORD_DEACT_CANCEL_FLAG", false);
        if ("Y".equalsIgnoreCase(ordDeactCancelFlag) || "true".equalsIgnoreCase(ordDeactCancelFlag)) {
                result = "Y";
        }

        /*         for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
            lastBillingDate = GetJsonObjectStringValue(itemdata, "LastBillingDate", false);
            orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);

            ordDeactCancelFlag = 
            if ("Offer".equalsIgnoreCase(prdtSubType) && "Disconnect".equalsIgnoreCase(orderItemAction) && !isEmptyOrNull(lastBillingDate)) {

                try {
                    if (formatFrom.parse(lastBillingDate).after(todayDate) || "Y".equals(ordDeactCancelFlag)) {
                        result = "Y";
                    }
                } catch (Exception ex) {
                    System.out.println("error parsing date_deact_flag");
                }


            }
        } */

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

                try {
                    Date date = formatFrom.parse(lastBillingDate);
                    result = formatTo.format(date);
                } catch (Exception ex) {
                    result = "";
                }

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
        String res = "";
        JSONObject itemdata = null;
        //ProductType = "Electricity"
        for (int i = 0; i < itemcount; i++) {
            itemdata = data.getJSONObject(i);
            prdType = GetJsonObjectStringValue(itemdata, "ProductType", false);
            if (productTypeCompareTo.equalsIgnoreCase(prdType)) {
                prdtSubType = GetJsonObjectStringValue(itemdata, "ProductSubType", false);
                orderItemAction = GetJsonObjectStringValue(itemdata, "OrderItemAction", false);
                val = GetJsonObjectStringValue(itemdata, field, false);

                if (itemSubtypeCompare.equalsIgnoreCase(prdtSubType) && !"Disconnect".equalsIgnoreCase(orderItemAction)) {
                    return val;
                }
                if (!val.isEmpty()) {
                    res = val;
                }
//                    try {
//                        // ja visus, tad atdala ar ";"
//                        if (allValues) {
//
//                        } else {
//                            if (mandatory && isEmptyOrNull(val)) {
//                                throw new Exception("Field " + field + " is mandatory");
//                            }
//                            break;
//                        }
//                    } catch (Exception e) {
//                        if (mandatory) {
//                            throw new Exception("Field " + field + " is mandatory");
//                        }
//                    }

            }
        }
        return res;
    }

    public String GetOrderItemFieldValueByProductTypeNotDisconnect(
            String productType, String productTypeCompareTo,
            String itemSubtypeCompare,
            String field,
            boolean mandatory) throws Exception {
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        String prdType = "";
        String prdtSubType = "";
        String orderItemAction = "";
        String val = ""; // vērtība, kur <OrderItemAction> <> 'Disconnect'
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
                    orderItemIdFromServiceNo = GetJsonObjectStringValue(d, "OrderItemId", false);
                    return serviceId;
                } else {
                    JSONObject a = getChildServiceId(bundleItems, GetJsonObjectStringValue(d, "OrderItemId", false));
                    if (null != a) {
                        orderItemIdFromServiceNo = GetJsonObjectStringValue(a, "OrderItemId", false);
                        return GetJsonObjectStringValue(a, "ServiceId", false);
                    }
                    return "";
                }
            }
        }
        return result;
    }

    private JSONObject getChildServiceId(JSONArray bundleItems, String orderItem_Id) throws Exception {
        JSONObject result = null;
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
                orderItemIdFromServiceNo = GetJsonObjectStringValue(d, "OrderItemId", false);
                return d;
            }
            //if (orderItem_Id.equalsIgnoreCase(rootOrderItemId) && !isEmptyOrNull(serviceId)) {
            //    return d;
            //} else {
            //    if (orderItemId.equalsIgnoreCase(rootOrderItemId)) {
            //        return null;
            //    } else {
            //        return getChildServiceId(bundleItems, orderItemId);
            //    }
            //}

        }
        return result;
    }

    private Map<String, JSONObject> filldatawithitems(List<String> servidslist) throws Exception {
        Map<String, JSONObject> result = new HashMap<>();
        String serviceNumber = "";
        String itemServiceNumber = "";
        String orderItemId = "";
        String parentOrderItemId = "";
        String orderItemId1 = "";
        String parentOrderItemId1 = "";
        String unicornServiceLevel = "";
        boolean isPrimary = false;
        
        JSONArray data  = getOrderDataItems();
        int itemcount = data.length();
        JSONObject itemdata = null;
        JSONObject itemdata1 = null;
        
        for (int i = 0; i < servidslist.size(); i++) {
            serviceNumber = servidslist.get(i); //
            // UnicornServiceLevel
            
            // sākumā pievieno visus, kam sakrīt serviceNumber
            for (int j = 0; j < itemcount; j++) {
                itemdata = data.getJSONObject(j);

                itemServiceNumber  = GetJsonObjectStringValue(itemdata, "ServiceId", false);
                //orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
                
                if (serviceNumber.equalsIgnoreCase(itemServiceNumber)) {
                    switch (i) {
                        case 0:
                            itemdata_primary = addParrentsAndChilds(itemdata, "Primary");
                            itemdata_primary.put(itemdata);
                            break;
                        case 1:
                            itemdata_secondary = addParrentsAndChilds(itemdata, "Secondary");
                            itemdata_secondary.put(itemdata);
                            break;
                        case 2:
                            itemdata_tertiary = addParrentsAndChilds(itemdata, "Tertiary");
                            itemdata_tertiary.put(itemdata);
                            break;
                        case 3:
                            itemdata_quarternary = addParrentsAndChilds(itemdata, "Quarternary");
                            itemdata_quarternary.put(itemdata);
                            break;
                    }
                    break;
                }
            } // end of for (int j = 0; j < itemcount; j++)
        } // end of for (int i = 0; i < servidslist.size(); i++) {
        return result;
    }

    private JSONArray addParrentsAndChilds(JSONObject bundleItem, String level) throws Exception {
        JSONArray res = new JSONArray();
        boolean isParent = false;
        String parentOrderItemId = "";
        String orderItemId = "";
        String rootOrderId = "";
        String unicornServiceLevel = "";
        String serviceId = "";
        JSONArray data  = getOrderDataItems();
        JSONObject itemdata = null;
        int itemcount = data.length();
        String parentOrderItemIdCurr = GetJsonObjectStringValue(bundleItem, "ParentOrderItemId", false);

        // add parrents
        do {
            for (int j = 0; j < itemcount; j++) {
                itemdata = data.getJSONObject(j);
                parentOrderItemId = GetJsonObjectStringValue(itemdata, "ParentOrderItemId", false);
                orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
                unicornServiceLevel = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
                // ja sakrīt items
                if (orderItemId.equalsIgnoreCase(parentOrderItemIdCurr)) {
                    // vai tas ir pēdējais
                    if (isEmptyOrNull(parentOrderItemId)) {
                        isParent = true;
                        rootOrderId = orderItemId;
                    }
                    res.put(itemdata);
                    if (!isEmptyOrNull(parentOrderItemId)) {
                        parentOrderItemIdCurr = parentOrderItemId;
                        break;
                    }
                }
            }

        } while (!isParent);

        // add childs
        String orderItemIdCurr = GetJsonObjectStringValue(bundleItem, "OrderItemId", false);
        boolean isFullFor = true;
        int count = 0;
        do {
            isFullFor = true;
            for (int j = 0; j < itemcount; j++) {
                itemdata = data.getJSONObject(j);
                parentOrderItemId = GetJsonObjectStringValue(itemdata, "ParentOrderItemId", false);
                orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
                unicornServiceLevel = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
                if (isEmptyOrNull(unicornServiceLevel) && parentOrderItemId.equalsIgnoreCase(orderItemIdCurr)) {
                    res.put(itemdata);
                    orderItemIdCurr = orderItemId;
                    isFullFor = false;
                    break;
                }
            }
        } while (!isFullFor);

        // skatamies vai nav citi levelji
        for (int j = 0; j < itemcount; j++) {
            itemdata = data.getJSONObject(j);
            unicornServiceLevel = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
            serviceId = GetJsonObjectStringValue(itemdata, "ServiceId", false);
            orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
            if (level.equalsIgnoreCase(unicornServiceLevel) && isEmptyOrNull(serviceId)) {
                // ja ir paņemam viņu
                res.put(itemdata);
                orderItemIdCurr = orderItemId;
                // un viņa childus
                do {
                    isFullFor = true;
                    for (int jj = 0; jj < itemcount; jj++) {
                        itemdata = data.getJSONObject(jj);
                        parentOrderItemId = GetJsonObjectStringValue(itemdata, "ParentOrderItemId", false);
                        orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
                        unicornServiceLevel = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
                        serviceId = GetJsonObjectStringValue(itemdata, "ServiceId", false);
                        //if (isEmptyOrNull(parentOrderItemId)) {isParent = true;}
                        if ((isEmptyOrNull(unicornServiceLevel) || isEmptyOrNull(serviceId))
                                && parentOrderItemId.equalsIgnoreCase(orderItemIdCurr)) {
                            res.put(itemdata);
                            orderItemIdCurr = orderItemId;
                            isFullFor = false;
                            break;
                        }
                    }
                } while (!isFullFor);
            }

        }
        // add offer childs
       /** orderItemIdCurr = rootOrderId;
        do {
            isFullFor = true;
            for (int j = 0; j < itemcount; j++) {
                itemdata = data.getJSONObject(j);
                parentOrderItemId = GetJsonObjectStringValue(itemdata, "ParentOrderItemId", false);
                orderItemId = GetJsonObjectStringValue(itemdata, "OrderItemId", false);
                unicornServiceLevel = GetJsonObjectStringValue(itemdata, "UnicornServiceLevel", false);
                serviceId = GetJsonObjectStringValue(itemdata, "ServiceId", false);
                //if (isEmptyOrNull(parentOrderItemId)) {isParent = true;}
                if ((isEmptyOrNull(unicornServiceLevel) || isEmptyOrNull(serviceId))
                        && parentOrderItemId.equalsIgnoreCase(orderItemIdCurr)) {
                    res.put(itemdata);
                    orderItemIdCurr = orderItemId;
                    isFullFor = false;
                    break;
                }
            }
        } while (!isFullFor);*/

        return res;
    }

}
