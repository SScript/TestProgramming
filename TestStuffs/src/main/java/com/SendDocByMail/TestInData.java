package com.SendDocByMail;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;

public class TestInData {
    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/SendDocByMail/InData.xml");
        String longDataString = IOUtils.toString(fis, "UTF-8");
        JSONObject jsonData = XML.toJSONObject(longDataString);

        String val = "";
        try {
            JSONObject order = jsonData.getJSONObject("SendDocByMailAPIReq").getJSONObject("Order");
            val = GetJsonObjectStringValue(order, "OrderId", true);
            val = GetJsonObjectStringValue(order, "OrderNumber", true);
            val = GetJsonObjectStringValue(order, "OrderDate ", true);
            val = GetJsonObjectStringValue(order, "AccountId", true);
            val = GetJsonObjectStringValue(order, "AccountNo", true);
            val = GetJsonObjectStringValue(order, "AccountName", true);
            val = GetJsonObjectStringValue(order, "WayBillNo", true);
            val = GetJsonObjectStringValue(order, "DeliveryMethod", true);

            JSONArray orderdataitems = null;
            try {
                Object itemObj = order.get("OrderItems");
                if (itemObj instanceof JSONArray) {
                    orderdataitems = (JSONArray) itemObj;
                }
                if (itemObj instanceof JSONObject) {

                    orderdataitems = new JSONArray();
                    orderdataitems.put(itemObj);
                }
            } catch (Exception e) {
                orderdataitems = new JSONArray();
            }

            int itemcount = orderdataitems.length();
            for (int i = 0; i < itemcount; i++) {
                val = GetJsonObjectStringValue(order, "OrderItemId", true);
                val = GetJsonObjectStringValue(order, "ProductType", true);
                val = GetJsonObjectStringValue(order, "Name", true);
                val = GetJsonObjectStringValue(order, "AccountingCode", true);
                val = GetJsonObjectStringValue(order, "RootOrderItemId", true);
            }

        } catch (Exception e) {
            //throw new Exception("Field Order is mandatory");
            System.out.println(e.getMessage());
        }
        System.out.println(jsonData.toString());
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/SendDocByMail/resJsonData.json"),
                jsonData.toString(), Charset.forName("UTF-8"));


    }

    private static String GetJsonObjectStringValue(JSONObject objekts, String field, boolean mandatory) throws Exception {
        String val = "";
        Object objvalue = null;
        try {
            objvalue = objekts.get(field);
            if (objvalue instanceof Boolean) {
                Boolean boolToUse = ((Boolean) objvalue).booleanValue();
                val = boolToUse.toString();
            } else if (objvalue instanceof Integer || objvalue instanceof Long) {
                long intToUse = ((Number) objvalue).longValue();
                val = String.valueOf(intToUse);
            } else if (objvalue instanceof Float || objvalue instanceof Double) {
                double floatToUse = ((Number) objvalue).doubleValue();
                val = String.valueOf(floatToUse);
            } else if (JSONObject.NULL.equals(objvalue)) {
                val = "";
            } else {
                val = ((String) objvalue).toString();
            }
        } catch (Exception e) {
            val = "";
        }
        if (mandatory && isEmptyOrNull(val)) {
            throw new Exception("Field " + field + " is mandatory");
        }
        return val;
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }

}
