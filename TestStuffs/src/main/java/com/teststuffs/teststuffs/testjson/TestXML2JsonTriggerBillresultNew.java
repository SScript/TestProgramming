package com.teststuffs.teststuffs.testjson;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import java.util.Arrays;
import java.util.List;

public class TestXML2JsonTriggerBillresultNew {

    public static void main(String[] args) throws Exception {
        String data = "<tns:SendBillingResultVlocityRequest>\n" +
                "               <tns:Response>Billing Activation Failed</tns:Response>\n" +
                "               <tns:RequestId>req3</tns:RequestId>\n" +
                "               <tns:OrderResponses>\n" +
                "                  <tns:OrderId>80168000001lRIUAA2</tns:OrderId>\n" +
                "                  <tns:OrderNumber>00696641</tns:OrderNumber>\n" +
                "                  <tns:OrderItemId>80268000003c7lgAAA</tns:OrderItemId>\n" +
                "                  <tns:ServiceNumber>DLMS125652</tns:ServiceNumber>\n" +
                "                  <tns:OrderDate>11/05/2022 13:16:55</tns:OrderDate>\n" +
                "                  <tns:OrderStatus>Billing Activated</tns:OrderStatus>\n" +
                "                  <tns:OrderMessage/>\n" +
                "                  <tns:ServiceActivationDate>11/05/2022</tns:ServiceActivationDate>\n" +
                "                  <tns:ErrorCode/>\n" +
                "                  <tns:GroupId/>\n" +
                "               </tns:OrderResponses>\n" +
                "               <tns:OrderResponses>\n" +
                "                  <tns:OrderId>80168000001lRIUAA2</tns:OrderId>\n" +
                "                  <tns:OrderNumber>00696641</tns:OrderNumber>\n" +
                "                  <tns:OrderItemId>80268000003c7lgAAA</tns:OrderItemId>\n" +
                "                  <tns:ServiceNumber>DLMS125652</tns:ServiceNumber>\n" +
                "                  <tns:OrderDate>11/05/2022 13:16:55</tns:OrderDate>\n" +
                "                  <tns:OrderStatus>Billing Activated</tns:OrderStatus>\n" +
                "                  <tns:OrderMessage/>\n" +
                "                  <tns:ServiceActivationDate>11/05/2022</tns:ServiceActivationDate>\n" +
                "                  <tns:ErrorCode/>\n" +
                "                  <tns:GroupId/>\n" +
                "               </tns:OrderResponses>\n" +
                "            </tns:SendBillingResultVlocityRequest>";

        String blockedGroupId = "1,2";
        List<String> blockedGroupIditems = Arrays.asList(blockedGroupId.split(","));

        data = data.replace("tns:", "");
        JSONObject jsonData = XML.toJSONObject(data);
        JSONObject d = jsonData.getJSONObject("SendBillingResultVlocityRequest");
        System.out.println("JSONdata: " + d.toString());

        JSONArray arrdata = GetJSONArrObj(d, "OrderResponses");

        JSONObject row1 = arrdata.getJSONObject(0);
        System.out.println("JSONdata: " + row1.toString());

        JSONArray order = new JSONArray();
        JSONArray orderItems = new JSONArray();
        JSONObject rowdata = null;
        String destriptionStr = "";
        String groupIdStr = "";
        String serviceNumberStr = "";
        String orderMessageStr = "";
        boolean isGroupIdfilled = false;

        for (int i = 0; i < arrdata.length(); i++) {
            rowdata = arrdata.getJSONObject(i);
            if (!isGroupIdfilled) {
                groupIdStr = GetJsonObjectStringValue(rowdata, "GroupId", false);
            }
            orderMessageStr = GetJsonObjectStringValue(rowdata, "OrderMessage", false);
            serviceNumberStr = GetJsonObjectStringValue(rowdata, "ServiceNumber", false);
            orderItems
                    .put(new JSONObject()
                            .put("OrderItemId", GetJsonObjectStringValue(rowdata, "OrderItemId", true))
                            .put("ServiceNumber", serviceNumberStr)
                            .put("BillActivationDate", GetJsonObjectStringValue(rowdata, "OrderDate", true))
                            .put("ServiceActivationDate", GetJsonObjectStringValue(rowdata, "ServiceActivationDate", false))
                            .put("Status", GetJsonObjectStringValue(rowdata, "OrderStatus", false))
                            .put("Description", GetJsonObjectStringValue(rowdata, "OrderMessage", false))
                            .put("ErrorCode", GetJsonObjectStringValue(rowdata, "ErrorCode", false))
                            .put("GroupId", GetJsonObjectStringValue(rowdata, "GroupId", false))
                    );
            if (!isGroupIdfilled && !isEmptyOrNull(groupIdStr) && blockedGroupIditems.contains(groupIdStr)) {isGroupIdfilled = true;}

            destriptionStr = serviceNumberStr + ": " + (!isEmptyOrNull(orderMessageStr) ? orderMessageStr : "OK");
        }

        JSONObject finalData = new JSONObject();
        order.put(new JSONObject()
                .put("OrderId", GetJsonObjectStringValue(row1, "OrderId", true))
                .put("OrderNumber", GetJsonObjectStringValue(row1, "OrderNumber", true))
                .put("Status", GetJsonObjectStringValue(d, "Response", true))
                .put("BillActivationDate", GetJsonObjectStringValue(row1, "OrderDate", true))
                .put("Description", orderMessageStr)
                .put("ErrorCode", destriptionStr)
                .put("GroupId", groupIdStr)
                .put("OrderItem", orderItems)
        );
        finalData.put("Order", order);

        System.out.println("Final data: " + finalData.toString());
    }

    private static JSONArray GetJSONArrObj(JSONObject data, String arrName) {
        JSONArray result = new JSONArray();
        try {
            Object orderdataitems_o = data.get(arrName);
            if (orderdataitems_o instanceof JSONArray) {
                result = (JSONArray) orderdataitems_o;
            }
            if (orderdataitems_o instanceof JSONObject) {
                result.put(orderdataitems_o);
            }
        } catch (Exception e) {
        }

        return result;
    }

    public static String GetJsonObjectStringValue(JSONObject data, String jsonfieldName, boolean mandatory) throws Exception {
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

    private static String GetJsonObjectValue(Object objvalue) {
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

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }
}
