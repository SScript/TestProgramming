package com;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Iterator;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.json.*;

public class ProcessJsonData {

    public static void main(String[] args) throws Exception {
        JSONObject orderdata;
        JSONArray orderdataitems = null;
        JSONObject itemdata;
        JSONObject itemattrdata;
        String AccountAddressId = "";
        String ServiceAddressKey = "";

        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/InDataJson01.json");
        String longJsonString = IOUtils.toString(fis, "UTF-8");

        //JSONObject obj = new JSONObject(jdata);
        JSONObject obj = new JSONObject(longJsonString);

        orderdata = obj.getJSONObject("order");
        try {
        
            Object orderdataitems_o = orderdata.get("orderItem");
        if (orderdataitems_o instanceof JSONArray) {
            orderdataitems = (JSONArray) orderdataitems_o;
        }
        if (orderdataitems_o instanceof JSONObject) {

            orderdataitems = new JSONArray();
            orderdataitems.put(orderdataitems_o);
        }
        } catch (Exception e) {
            orderdataitems = new JSONArray();
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("<listOfOrder>");
        sb.append("<listOfOrderHeader>");
        sb.append("<order>");
        sb.append(GetJsonObjectValue(orderdata, "GeneratePdfOnline", "generatePdfOnline"));
        sb.append(GetJsonObjectValue(orderdata, "Id", "id"));
        sb.append(GetJsonObjectValue(orderdata, "orderDate", "orderDate"));
        sb.append(GetJsonObjectValue(orderdata, "orderNumber", "orderNumber"));
        sb.append(GetJsonObjectValue(orderdata, "channel", "channel"));
        sb.append(GetJsonObjectValue(orderdata, "source", "source"));
        sb.append(GetJsonObjectValue(orderdata, "account", "account"));
        sb.append(GetJsonObjectValue(orderdata, "accountNumber", "accountNumber"));
        sb.append(GetJsonObjectValue(orderdata, "accountContactFirstName", "accountContactFirstName"));
        sb.append(GetJsonObjectValue(orderdata, "accountContactLastName", "accountContactLastName"));
        sb.append(GetJsonObjectValue(orderdata, "accountContactEmailAddress", "accountContactEmailAddress"));

        sb.append(GetJsonObjectValue(orderdata, "accountAddressId", "accountAddressId"));
        // adreses lauki
        //sb.append(GetOrderAddressData());
        //--
        sb.append(GetJsonObjectValue(orderdata, "customerSegment", "customerSegment"));
        sb.append(GetJsonObjectValue(orderdata, "customerSubSegment", "customerSubSegment"));
        sb.append(GetJsonObjectValue(orderdata, "accountContactPin", "accountContactPin"));
        sb.append(GetJsonObjectValue(orderdata, "companyRegistrationNumber", "companyRegistrationNumber"));
        sb.append(GetJsonObjectValue(orderdata, "vatNumber", "vatNumber"));
        //pārbaudīt birthDate formātu
        sb.append(GetJsonObjectValue(orderdata, "birthDate", "birthDate"));
        sb.append(GetJsonObjectValue(orderdata, "branch", "branch"));
        sb.append(GetJsonObjectValue(orderdata, "accountType", "accountType"));
        sb.append(GetJsonObjectValue(orderdata, "residentType", "residentType"));
        sb.append(GetJsonObjectValue(orderdata, "subStatus", "subStatus"));
        // ???
        sb.append(GetJsonObjectValue(orderdata, "hardCopyAgreement", "hardCopyAgreement"));
        sb.append(GetJsonObjectValue(orderdata, "foDeliveryAgreement", "foDeliveryAgreement"));
        sb.append(GetJsonObjectValue(orderdata, "orderCreator", "orderCreator"));
        sb.append(GetJsonObjectValue(orderdata, "KCIOnlyFlg", "kciOnlyFlg"));
        sb.append(GetJsonObjectValue(orderdata, "BulkOrderFlg", "bulkOrderFlg"));
        // ???
        sb.append(GetJsonObjectValue(orderdata, "Priority", "priority"));
        sb.append(GetJsonObjectValue(orderdata, "AmendOrderFlg", "amendOrderFlg"));
        // ???
        sb.append(GetJsonObjectValue(orderdata, "AmendPrevOrderNumber", "amendPrevOrderNumber"));

        sb.append("<listOfOrderItem>");

        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            sb.append("<orderItem>");
            itemdata = orderdataitems.getJSONObject(i);

            sb.append(GetJsonObjectValue(itemdata, "Id", "id"));
            sb.append(GetJsonObjectValue(itemdata, "actionCode", "actionCode"));
            sb.append(GetJsonObjectValue(itemdata, "rootOrderItemId", "rootOrderItemId"));
            sb.append(GetJsonObjectValue(itemdata, "parentOrderItemId", "parentOrderItemId"));
            sb.append(GetJsonObjectValue(itemdata, "salesOrderType", "salesOrderType"));
            sb.append(GetJsonObjectValue(itemdata, "status", "status"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "rootAssetIntegrationId", "rootAssetIntegrationId"));
            sb.append(GetJsonObjectValue(itemdata, "assetIntegrationId", "assetIntegrationId"));
            sb.append(GetJsonObjectValue(itemdata, "productId", "productId"));
            sb.append(GetJsonObjectValue(itemdata, "partNumber", "partNumber"));
            sb.append(GetJsonObjectValue(itemdata, "serviceId", "serviceId"));
            sb.append(GetJsonObjectValue(itemdata, "product", "product"));
            sb.append(GetJsonObjectValue(itemdata, "productType", "productType"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "revisedLineItemId", "revisedLineItemId"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "prodPromInstanceId", "prodPromInstanceId"));
            sb.append(GetJsonObjectValue(itemdata, "scheduledShipDate", "scheduledShipDate"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "billingAccountNumber", "billingAccountNumber"));

            // adreses
            //sb.append(GetOrderItemAddressData());
            // ???
            sb.append(GetJsonObjectValue(itemdata, "linkedLineItemId", "linkedLineItemId"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "prodPromSourceId", "prodPromSourceId"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "promotionGroupName", "promotionGroupName"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "myTETUserId", "myTetUserId"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "subType", "subType"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "parentServiceId", "parentServiceId"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "subActionCode", "subActionCode"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "lineDescription", "lineDescription"));
            // ???
            sb.append(GetJsonObjectValue(itemdata, "shipMethod", "shipMethod"));
            // SOAIP-1802 add ProductSubType
            sb.append(GetJsonObjectValue(itemdata, "ProductSubType", "ProductSubType"));

            sb.append("<listOfOrderItemXA>");
            String val = "";

            try {
                JSONObject atrr = itemdata.getJSONObject("JSONAttribute");

                Iterator<String> keys = atrr.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    JSONArray a = atrr.getJSONArray(key);
                    int itemattrcount = a.length();
                    for (int j = 0; j < itemattrcount; j++) {
                        itemattrdata = a.getJSONObject(j);
                        String valp = GetJsonObjectItemAttrValue(itemattrdata, "valuedatatype__c");
                        if ("Picklist".equals(valp)) {
                            try {
                                val = GetJsonAtrrObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo")
                                                  .getJSONObject("selectedItem").get("value"));
                            } catch (Exception e) {
                                val = "";
                            }
                        } else {
                            try {
                                val = GetJsonAtrrObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo").get("value"));
                            } catch (Exception e) {
                                val = "";
                            }
                        }

                        if (!isEmptyOrNull(val)) {
                            sb.append("<orderItemXA>");
                            sb.append("<value>").append(val).append("</value>");
                            sb.append(GetJsonObjectValue(itemattrdata, "attributedisplayname__c", "atrribute"));
                            sb.append("</orderItemXA>");
                        }
                    }
                }
                
                // SOAIP-1155 add UsageUnitPrice
                try {
                val = GetJsonAtrrObjectStringValue(itemdata.get("UsageUnitPrice"));
                    if (!isEmptyOrNull(val)) {
                        sb.append("<orderItemXA>");
                        sb.append("<value>").append(val).append("</value>");
                        sb.append("<atrribute>UsageUnitPrice</atrribute>");
                        sb.append("</orderItemXA>");
                }
                } catch (Exception ee) {}

            } catch (Exception e) {
            }
            sb.append("</listOfOrderItemXA>");
            sb.append("</orderItem>");
        }

        sb.append("</listOfOrderItem>");
        sb.append("</order>");
        sb.append("</listOfOrderHeader>");
        sb.append("</listOfOrder>");


        System.out.println(sb.toString());
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/InDataJson01res.xml"),
                sb.toString(), Charset.forName("UTF-8"));
    }

    private static String GetJsonAtrrObjectStringValue(Object objvalue) {
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

    private static String GetJsonObjectValue(JSONObject data, String jsonfieldName, String xmlfieldname) {
        String valToXml = "";
        try {
            Object objvalue = data.get(jsonfieldName);
            if (objvalue instanceof Boolean) {
                Boolean boolToUse = ((Boolean) objvalue).booleanValue();

                switch (jsonfieldName) {
                case "BulkOrderFlg":
                case "foDeliveryAgreement":
                case "orderCreator":
                case "KCIOnlyFlg":
                case "AmendOrderFlg":
                    if (boolToUse) {
                        valToXml = "Y";
                    } else {
                        valToXml = "N";
                    }
                    break;
                case "residentType":
                    if (boolToUse) {
                        valToXml = "Rezidents";
                    } else {
                        valToXml = "Nerezidents";
                    }
                    break;

                default:
                    valToXml = boolToUse.toString();
                    switch (jsonfieldName) {
                    case "AmendOrderFlg":
                        if (!"No".equals(valToXml)) {
                            valToXml = "Y";
                        } else {
                            valToXml = "N";
                        }
                        break;
                    }
                }


            } else if (objvalue instanceof Integer || objvalue instanceof Long) {
                long intToUse = ((Number) objvalue).longValue();
                valToXml = String.valueOf(intToUse);
            } else if (objvalue instanceof Float || objvalue instanceof Double) {
                double floatToUse = ((Number) objvalue).doubleValue();
                valToXml = String.valueOf(floatToUse);
            } else if (JSONObject.NULL.equals(objvalue)) {
                valToXml = "";
            } else {
                valToXml = data.getString(jsonfieldName);
                switch (jsonfieldName) {
                case "GeneratePdfOnline":
                    if ("1".equals(valToXml)) {
                        valToXml = "true";
                    } else {
                        valToXml = "false";
                    }
                    break;
                case "accountAddressId":
                    //AccountAddressId = valToXml;
                    break;
                }
            }
        } catch (Exception e) {
            valToXml = "";
        }

        if (!isEmptyOrNull(valToXml)) {
            switch (jsonfieldName) {
            case "birthDate":
                String dd = valToXml.substring(0, 2);
                String mm = valToXml.substring(3, 5);
                String yy = valToXml.substring(6, 10);
                valToXml = yy + "-" + mm + "-" + dd + "T00:00:01";
                break;
            }
            return "<" + xmlfieldname + ">" + valToXml + "</" + xmlfieldname + ">";
        } else {
            switch (jsonfieldName) {
            case "birthDate":
                return "<birthDate xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\" />";
                //break;
            default:
                return "<" + xmlfieldname + "/>";
                //break;
            }
        }
    }

    private static String GetJsonObjectItemAttrValue(JSONObject itemattrdata, String fieldName) {
        try {
            return itemattrdata.getString(fieldName);
        } catch (Exception e) {
            return "";
        }
    }

 

    private static boolean isNull(Object obj) {
        if (null == obj) {
            return true;
        }

        return false;
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
