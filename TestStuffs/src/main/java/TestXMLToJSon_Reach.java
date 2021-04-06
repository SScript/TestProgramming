
import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;
import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.json.XML;
import java.util.Base64;
import org.apache.commons.io.IOUtils;
import org.json.JSONArray;

public class TestXMLToJSon_Reach {

    public static void main(String[] args) {
        try {
            FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/inputXML.xml");
            String xmlDataStr = IOUtils.toString(fis, "UTF-8");

            JSONObject jsonData = XML.toJSONObject(xmlDataStr);
            JSONObject fullData = jsonData.getJSONObject("SendDocByMailAPIReq");
            JSONObject orderData = fullData.getJSONObject("Order");
            int insuranceCounter = 0;
            int warantyCounter = 0;

            // skatamies itemus
            JSONArray orderdataitems = null;
            JSONObject itemdata = null;

            try {
                Object itemObj = orderData.get("OrderItems");
                if (itemObj instanceof JSONArray) {
                    orderdataitems = (JSONArray) itemObj;
                }
                if (itemObj instanceof JSONObject) {

                    orderdataitems = new JSONArray();
                    orderdataitems.put(itemObj);
                }
            } catch (Exception e) {
                orderdataitems = null;
            }

            StringBuilder sb = new StringBuilder();

            sb.append("<JSONXMLNotificationsRequest xmlns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\" xmlns:ns2=\"http://schemas.xmlsoap.org/ws/2003/05/partner-link/\" xmlns:plnk=\"http://docs.oasis-open.org/wsbpel/2.0/plnktype\" xmlns:ns1=\"http://xmlns.oracle.com/Upgrade/JSONXMLReachNotificationSOAReqABCSImpl/JSONXMLReachNotificationSOAReqABCSImpl\" xmlns:wsdl=\"http://schemas.xmlsoap.org/wsdl/\" xmlns:client=\"http://xmlns.oracle.com/DT/SendNotificationsVLocityReqABCSImpl/SendNotificationsVLocityReqABCSImpl\" xmlns:tns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\">\n");
            sb.append("<ListOfMessages>");
            sb.append("<Message>");

            sb.append(AddXMLFieldString("customerNo", GetJsonObjectStringValue(orderData.get("AccountNo"))));
            sb.append(AddXMLFieldString("notificationCommType", "VLOCITY_NOTIF_1"));
            sb.append(AddXMLFieldString("requester", GetJsonObjectStringValue(fullData.get("Requester"))));
            sb.append(AddXMLFieldString("firstNotificationStartTime", ""));
            sb.append(AddXMLFieldString("sendingType", "I"));
            sb.append(AddXMLFieldString("notificationaddress_SMS", GetJsonObjectStringValue(orderData.get("OrderContactMobile"))));
            sb.append(AddXMLFieldString("notificationaddress_EMAIL", GetJsonObjectStringValue(orderData.get("OrderContactEmail"))));
            sb.append(AddXMLFieldString("notificationaddress_MOBTOKEN", ""));
            sb.append(AddXMLFieldString("mtetuserid", ""));
            sb.append(AddXMLFieldString("mobileappid", "1"));
            sb.append("<DynamicParametersList>");

            // actioncode
            sb.append("<DynamicParameter>").append("<Key>").append("actioncode").append("</Key>")
                    .append("<Value>")
                    .append("ADD_DOCUMENTS_1")
                    .append("</Value>")
                    .append("</DynamicParameter>");

            // ReadyMadeAddress
            sb.append("<DynamicParameter>").append("<Key>").append("ReadyMadeAddress").append("</Key>")
                    .append("<Value>")
                    .append("Y")
                    .append("</Value>")
                    .append("</DynamicParameter>");

            // VLOrderId
            sb.append("<DynamicParameter>").append("<Key>").append("VLOrderId").append("</Key>")
                    .append("<Value>")
                    .append(GetJsonObjectStringValue(orderData.get("OrderNumber")))
                    .append("</Value>")
                    .append("</DynamicParameter>");

            // AccountId
            sb.append("<DynamicParameter>").append("<Key>").append("AccountId").append("</Key>")
                    .append("<Value>")
                    .append(GetJsonObjectStringValue(orderData.get("AccountId")))
                    .append("</Value>")
                    .append("</DynamicParameter>");

            // OrderId
            sb.append("<DynamicParameter>").append("<Key>").append("OrderId").append("</Key>")
                    .append("<Value>")
                    .append(GetJsonObjectStringValue(orderData.get("OrderId")))
                    .append("</Value>")
                    .append("</DynamicParameter>");

            // DeliveryMethod
            sb.append("<DynamicParameter>").append("<Key>").append("DeliveryMethod").append("</Key>")
                    .append("<Value>")
                    .append(GetJsonObjectStringValue(orderData.get("DeliveryMethod")))
                    .append("</Value>")
                    .append("</DynamicParameter>");

            // Waybill_number
            sb.append("<DynamicParameter>").append("<Key>").append("Waybill_number").append("</Key>")
                    .append("<Value>")
                    .append(GetJsonObjectStringValue(orderData.get("WayBillNo")))
                    .append("</Value>")
                    .append("</DynamicParameter>");

            // Waybill_containt
            sb.append("<DynamicParameter>").append("<Key>").append("Waybill_number").append("</Key>")
                    .append("<Value>")
                    .append(GetJsonObjectStringValue(orderData.get("WayBillPdf")))
                    .append("</Value>")
                    .append("</DynamicParameter>");

            if (orderdataitems != null) {
                int itemcount = orderdataitems.length();
                String productType = "";
                String pdfData = "";
                String fieldNameDyn = "";
                for (int i = 0; i < itemcount; i++) {
                    //'Insurance', 'Warranty' vai 'PersonalLiabilityInsurance'
                    itemdata = orderdataitems.getJSONObject(i);
                    productType = GetJsonObjectStringValue(itemdata.get("ProductType"));
                    switch (productType) {
                        case "Insurance":
                        case "PersonalLiabilityInsurance":
                            pdfData = GetJsonObjectStringValue(itemdata.get("itemPdf"));
                            if (!isEmptyOrNull(pdfData)) {
                                insuranceCounter++;
                                fieldNameDyn = "Insurance" + insuranceCounter + "_number";
                                sb.append("<DynamicParameter>").append("<Key>").append(fieldNameDyn).append("</Key>")
                                    .append("<Value>")
                                    .append(GetJsonObjectStringValue(itemdata.get("ServiceId")))
                                    .append("</Value>")
                                    .append("</DynamicParameter>");
                                
                                fieldNameDyn = "Insurance" + insuranceCounter + "_content";
                                sb.append("<DynamicParameter>").append("<Key>").append(fieldNameDyn).append("</Key>")
                                    .append("<Value>")
                                    .append(pdfData)
                                    .append("</Value>")
                                    .append("</DynamicParameter>");
                            }
                            break;
                        case "Warranty":
                            pdfData = GetJsonObjectStringValue(itemdata.get("itemPdf"));
                            if (!isEmptyOrNull(pdfData)) {
                                warantyCounter++;
                                fieldNameDyn = "Warranty" + warantyCounter + "_number";
                                sb.append("<DynamicParameter>").append("<Key>").append(fieldNameDyn).append("</Key>")
                                    .append("<Value>")
                                    .append(GetJsonObjectStringValue(itemdata.get("ServiceId")))
                                    .append("</Value>")
                                    .append("</DynamicParameter>");
                                
                                fieldNameDyn = "Warranty" + warantyCounter + "_content";
                                sb.append("<DynamicParameter>").append("<Key>").append(fieldNameDyn).append("</Key>")
                                    .append("<Value>")
                                    .append(pdfData)
                                    .append("</Value>")
                                    .append("</DynamicParameter>");
                            }
                            break;
                    }
                }
            }

            sb.append("</DynamicParametersList>");

            sb.append("</Message>");
            sb.append("</ListOfMessages>");
            sb.append("</JSONXMLNotificationsRequest>");

            System.out.println(jsonData.toString());
            FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/jsondatain.json"),
                    jsonData.toString(), Charset.forName("UTF-8"));

            System.out.println(sb.toString());
            FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/reachxml.xml"),
                    sb.toString(), Charset.forName("UTF-8"));

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    private static String GetJsonObjectStringValue(Object objvalue) {
        String valToXml = "";
        try {
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
        } catch (Exception e) {
            valToXml = "";
        }

        return valToXml;
    }

    private static String AddXMLFieldString(String xmlfieldname, String valToXml) {
        if (!isEmptyOrNull(valToXml)) {
            return "<" + xmlfieldname + ">" + valToXml + "</" + xmlfieldname + ">";
        } else {
            return "<" + xmlfieldname + "/>";
        }
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
