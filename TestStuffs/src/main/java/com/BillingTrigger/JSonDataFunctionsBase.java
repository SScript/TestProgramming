package com.BillingTrigger;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;

public class JSonDataFunctionsBase {

    static final String STR_SPLIT_PAYMENT = "Split payment";

    // ienâkoðie dati
    protected String env;
    protected String jsonFullData;

    protected JSONObject orderDataFull;
    protected JSONObject orderData;
    protected JSONArray orderDataItems;

    // rezultâtam
    protected JSONObject outData;
    protected JSONArray outDetailsData;
    protected JSONArray outOffersData;

    protected RequestBaseData baseData;

    protected String AccountAddressId = "";

    public JSonDataFunctionsBase(String inFullData, String env) {
        this.jsonFullData = inFullData;
        this.orderDataFull = new JSONObject(this.jsonFullData);
        this.env = env;
    }

    public String getEnv() {
        return env;
    }

    public JSONObject getOrderDataFull() {
        return this.orderDataFull;
    }

    public JSONObject getOrderData() {
        if (null == this.orderData) {
            this.orderData = this.orderDataFull.getJSONObject("Order");
        }
        return this.orderData;
    }

    public JSONArray getOrderDataItems() {
        if (null == this.orderDataItems) {
            this.orderDataItems = GetJSONArrayObj(getOrderData(), "OrderItems");
        }
        return orderDataItems;
    }

    public void setOrderDataItems(JSONArray orderDataItems) {
        this.orderDataItems = orderDataItems;
    }

    public void addFieldToOutDataData(String field, String value) {
        if (null == outData) {
            outData = new JSONObject();
        }
        this.outData.put(field, value);
    }

    public void addArrFieldToOutDataData(String field, JSONArray value) {
        if (null == outData) {
            outData = new JSONObject();
        }
        this.outData.put(field, value);
    }

    public void addFieldToOutDetailsDataData(String value, String keyValue) {
        if (null == outDetailsData) {
            outDetailsData = new JSONArray();
        }
        this.outDetailsData.put(new JSONObject().put("value", value).put("key", keyValue));
    }

    public JSONArray getOutDetailsData() {
        if (null == this.outDetailsData) {
            this.outDetailsData = new JSONArray();
        }
        return outDetailsData;
    }

    public JSONArray getOutOffersData() {
        if (null == this.outOffersData) {
            this.outOffersData = new JSONArray();
        }
        return outOffersData;
    }

    public JSONObject getFullOutJsonData() {
        if (null != this.outDetailsData) {
            this.outData.put("orderdetails", this.outDetailsData);
        }
        if (null != this.outOffersData) {
            this.orderData.put("orderOffers", this.outOffersData);
        }
        return this.outData;
    }

    public RequestBaseData GetBaseData() throws Exception {
        if (null == baseData) {
            baseData = new RequestBaseData();

            baseData.setGuid(java.util.UUID.randomUUID().toString());
            baseData.setCaller(GetJsonObjectStringValue(getOrderDataFull(), "Requester", true));

            baseData.setOrderId(GetJsonObjectStringValue(getOrderData(), "OrderId", true));
            baseData.setOrderNumber(GetJsonObjectStringValue(getOrderData(), "OrderNumber", true));
            baseData.setOrderDate(GetJsonObjectStringValue(getOrderData(), "OrderDate", true));
            baseData.setAccountNo(GetJsonObjectStringValue(getOrderData(), "AccountNo", true));
            baseData.setBillAccountNumber(GetJsonObjectStringValue(getOrderData(), "BillAccountNumber", true));
            baseData.setAddressKey(GetJsonObjectStringValue(getOrderData(), "AddressKey", false));
            baseData.setDownPaymentBillNo(GetJsonObjectStringValue(getOrderData(), "DownPaymentBillNo", false));
            baseData.setMonthDelay(GetJsonObjectStringValue(getOrderData(), "MonthDelay", false));
            baseData.setBillActivationDate(GetJsonObjectStringValue(getOrderData(), "BillActivationDate", false));
            baseData.setOrderedService(("".equalsIgnoreCase(GetJsonObjectStringValue(getOrderData(), "OrderedService", false)) )
                    ? "Split payment"
                    : GetJsonObjectStringValue(getOrderData(), "OrderedService", false));
            baseData.setOrderedServiceType(GetJsonObjectStringValue(getOrderData(), "OrderedServiceType", false));
            baseData.setRemovalReason(GetJsonObjectStringValue(getOrderData(), "RemovalReason", false));
            baseData.setOrderReason(GetJsonObjectStringValue(getOrderData(), "OrderReason", false));
            baseData.setNotes(GetJsonObjectStringValue(getOrderData(), "Notes", false));
            baseData.setPaymentMode(GetJsonObjectStringValue(getOrderData(), "PaymentMode", false));
            baseData.setOrdDeactCancelFlag(GetJsonObjectStringValue(getOrderData(), "ORD_DEACT_CANCEL_FLAG", false));
        }

        return baseData;
    }

    public void setBaseData(RequestBaseData baseData) {
        this.baseData = baseData;
    }

    public JSONArray GetJSONArrayObj(JSONObject data, String arrName) {
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

    public String GetJsonObjectStringValue(JSONObject data, String jsonfieldName, boolean mandatory) throws Exception {
        String result = "";
        try {
            result = GetJsonObjectValue(data.get(jsonfieldName));
        } catch (Exception e) {
            if (mandatory) {
                throw new Exception("Field: " + jsonfieldName + " is mandatory");
            } else {
                result = "";
            }
        }

        return result;
    }

    private String GetJsonObjectValue(Object objvalue) {
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

    public boolean isNull(Object obj) {
        if (null == obj) {
            return true;
        }

        return false;
    }

    public String xmlEscapeText(String t) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < t.length(); i++) {
            char c = t.charAt(i);
            switch (c) {
                //case '<':
                //    sb.append("&lt;");
                //    break;
                //case '>':
                //    sb.append("&gt;");
                //    break;
                case '\"':
                    sb.append("&quot;");
                    break;
                case '&':
                    sb.append("&amp;");
                    break;
                case '\'':
                    sb.append("&apos;");
                    break;
                default:
                    //if (c > 0x7e) {
                    //    sb.append("&#" + ((int) c) + ";");
                    //} else
                    sb.append(c);
            }
        }
        return sb.toString();
    }

    public String getBillActivationDate(String billDate) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String billActivationDate = "";
        try {
            Date date = simpleDateFormat.parse(billDate);
            billActivationDate = simpleDateFormat.format(date);
        } catch (Exception ex) {
            billActivationDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());;
        }

        return billActivationDate;

    }

    public String FormatDate(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        String dd1 = d.substring(8, 10);
        String mm1 = d.substring(5, 7);
        String yy1 = d.substring(0, 4);
        String time = d.substring(11, 19);
        //System.out.println(dd1 + "/" + mm1 + "/" + yy1 + " " + time);
        return dd1 + "/" + mm1 + "/" + yy1 + " " + time;
    }

    public String FormatDateShort(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        if (!isEmptyOrNull(d)) {
            String dd1 = d.substring(8, 10);
            String mm1 = d.substring(5, 7);
            String yy1 = d.substring(0, 4);
            return dd1 + "/" + mm1 + "/" + yy1;
        } else {
            return "";
        }
    }

    public void PrintLog(String str) {
        if ("LOCAL".equalsIgnoreCase(getEnv())) {
            System.out.println(str);
        }
    }

}
