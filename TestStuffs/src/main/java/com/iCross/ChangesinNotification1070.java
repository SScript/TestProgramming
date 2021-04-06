package com.iCross;

import java.io.*;
import java.nio.charset.Charset;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.URL;
import java.net.URLEncoder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

public class ChangesinNotification1070 {

    protected static JSONObject obj;

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/iCross/liCrossAtribbutesResponse1.json");
        String jsonDataStr = IOUtils.toString(fis, "UTF-8");

        StringBuilder sb = new StringBuilder();

        Map<String, String> nameAddressMatch = new HashMap<>();

        JSONObject jsonData = new JSONObject(jsonDataStr);

        sb.append("<JSONXMLNotificationsRequest xmlns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\" xmlns:ns2=\"http://schemas.xmlsoap.org/ws/2003/05/partner-link/\" xmlns:plnk=\"http://docs.oasis-open.org/wsbpel/2.0/plnktype\" xmlns:ns1=\"http://xmlns.oracle.com/Upgrade/JSONXMLReachNotificationSOAReqABCSImpl/JSONXMLReachNotificationSOAReqABCSImpl\" xmlns:wsdl=\"http://schemas.xmlsoap.org/wsdl/\" xmlns:client=\"http://xmlns.oracle.com/DT/SendNotificationsVLocityReqABCSImpl/SendNotificationsVLocityReqABCSImpl\" xmlns:tns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\">\n");
        sb.append("<ListOfMessages>");

        //Resp respiCross = null;
        //int itemcount = objarr.length();
        //cikls pa objektiem
        //for (int i = 0; i < itemcount; i++) {
        //JSONObject obj = new JSONObject(respiCross.RetMsg);
        JSONArray orderdataitems = null;
        // fsmNodes
        try {
            Object itemObj = jsonData.get("fsmNodes");
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

        // pieņemam, ka var būt vairāki "fsmNodes"
        int nodescount = orderdataitems.length();
        JSONObject objdata = null;
        for (int i = 0; i < nodescount; i++) {
            objdata = orderdataitems.getJSONObject(i);

            String address = GetJsonObjectStringValueOrEmpty(objdata, "address");
            String addressAdditionalInfo = GetJsonObjectStringValueOrEmpty(objdata, "addressAdditionalInfo");

            JSONObject objIN = objdata.getJSONObject("customAttributes").getJSONObject("attributes");
            // skatamies Owner SMS
            // Īpašnieka apziņošana (jai ir aizpidlīts kaut viens LT_BLD_HOMEOWNER) - katrai unikālai kombinācijai LT_BLD_HOMEOWNER_EMAIL/LT_BLD_HOMEOWNER_PHONE_NR (ja aizpidlīti gan e-pasts, gan telefons, tad 2 izsaukumi) + <address> 
            String isSMS = GetJsonObjectStringValueOrEmpty(objIN, "LT_BLD_HOMEOWNER_PHONE_NR");
            if (!isEmptyOrNull(isSMS)) {
                // skatamies vai kombinācija jau ir pievienota
                String a = nameAddressMatch.get(isSMS);

                // ja tāda objekta nav vai ir objekts, bet cita adrese, tad jāpievieno Reach izsaukumam
                if (isEmptyOrNull(a) || (!isEmptyOrNull(a) && !a.equals(address))) {
                    // pievienojam sarakstam
                    nameAddressMatch.put(isSMS, address);
                    // formējam Reacj daļu
                    sb.append("<Message>");

                    sb.append(AddXMLFieldString("customerNo", "999"));
                    sb.append(AddXMLFieldString("notificationCommType", "CLICK_NTF"));
                    sb.append(AddXMLFieldString("requester", "CLICK"));
                    sb.append(AddXMLFieldString("firstNotificationStartTime", ""));
                    sb.append(AddXMLFieldString("sendingType", "I"));
                    sb.append(AddXMLFieldString("notificationaddress_SMS", isSMS));
                    //sb.append(AddXMLFieldString("notificationaddress_EMAIL",""));
                    sb.append(AddXMLFieldString("notificationaddress_MOBTOKEN", ""));
                    sb.append(AddXMLFieldString("mtetuserid", ""));
                    sb.append(AddXMLFieldString("mobileappid", "1"));

                    sb.append("<DynamicParametersList>");

                    sb.append("<DynamicParameter>")
                            .append("<Key>").append("actioncode").append("</Key>").append("<Value>")
                            .append(GetJsonObjectStringValueOrEmpty(objIN, "LT_BLD_HOMEOWNER_UNISERVE_SMS_ID"))
                            .append("</Value>").append("</DynamicParameter>");

                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("Address")
                            .append("</Key>")
                            .append("<Value>")
                            .append(address)
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    if (!isEmptyOrNull(addressAdditionalInfo)) {
                        sb.append("<DynamicParameter>")
                                .append("<Key>")
                                .append("Address")
                                .append("</Key>")
                                .append("<Value>")
                                .append(addressAdditionalInfo)
                                .append("</Value>")
                                .append("</DynamicParameter>");
                    }

                    //Customer -> no Obj objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("Customer")
                            .append("</Key>")
                            .append("<Value>")
                            .append("Customer")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //PLAN_DATE= datuma daļa no <AppointmentStart> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //PLAN_TIME = laika daļa no <AppointmentStart> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //PLAN_TIME_END = laika daļa no <AppointmentFinish> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //DU_NUM = <ExternalRefID> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //Ja ir jāsūta SMS:
                    //TemplateId = <LT_BLD_HOMEOWNER_UNISERVE_SMS_ID> - ja aizpildīts
                    String smsid = GetJsonObjectStringValueOrEmpty(objIN, "LT_BLD_HOMEOWNER_UNISERVE_SMS_ID");
                    if (!isEmptyOrNull(smsid)) {
                        sb.append("<DynamicParameter>")
                                .append("<Key>")
                                .append("TemplateId")
                                .append("</Key>")
                                .append("<Value>")
                                .append(smsid)
                                .append("</Value>")
                                .append("</DynamicParameter>");
                    }

                    sb.append("</DynamicParametersList>");
                    sb.append("</Message>");
                }
            }

            // skatamies Owner email
            String isEmail = GetJsonObjectStringValueOrEmpty(objIN, "LT_BLD_HOMEOWNER_EMAIL");
            if (!isEmptyOrNull(isEmail)) {
                // skatamies vai kombinācija jau ir pievienota
                String a = nameAddressMatch.get(isEmail);

                // ja tāda objekta nav vai ir objekts, bet cita adrese, tad jāpievieno Reach izsaukumam
                if (isEmptyOrNull(a) || (!isEmptyOrNull(a) && !a.equals(address))) {
                    sb.append("<Message>");

                    sb.append(AddXMLFieldString("customerNo", "999"));
                    sb.append(AddXMLFieldString("notificationCommType", "CLICK_NTF"));
                    sb.append(AddXMLFieldString("requester", "CLICK"));
                    sb.append(AddXMLFieldString("firstNotificationStartTime", ""));
                    sb.append(AddXMLFieldString("sendingType", "I"));
                    //sb.append(AddXMLFieldString("notificationaddress_SMS", isSMS));
                    sb.append(AddXMLFieldString("notificationaddress_EMAIL",isEmail));
                    sb.append(AddXMLFieldString("notificationaddress_MOBTOKEN", ""));
                    sb.append(AddXMLFieldString("mtetuserid", ""));
                    sb.append(AddXMLFieldString("mobileappid", "1"));

                    sb.append("<DynamicParametersList>");
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("actioncode")
                            .append("</Key>")
                            .append("<Value>")
                            .append(GetJsonObjectStringValueOrEmpty(objIN, "LT_BLD_HOMEOWNER_UNISERVE_ID"))
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("Address")
                            .append("</Key>")
                            .append("<Value>")
                            .append(address)
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    if (!isEmptyOrNull(addressAdditionalInfo)) {
                        sb.append("<DynamicParameter>")
                                .append("<Key>")
                                .append("Address")
                                .append("</Key>")
                                .append("<Value>")
                                .append(addressAdditionalInfo)
                                .append("</Value>")
                                .append("</DynamicParameter>");
                    }

                    //Customer -> no Obj objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("Customer")
                            .append("</Key>")
                            .append("<Value>")
                            .append("Customer")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //PLAN_DATE= datuma daļa no <AppointmentStart> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //PLAN_TIME = laika daļa no <AppointmentStart> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //PLAN_TIME_END = laika daļa no <AppointmentFinish> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //DU_NUM = <ExternalRefID> -> no objekta
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("PLAN_DATE")
                            .append("</Key>")
                            .append("<Value>")
                            .append("PLAN_DATE")
                            .append("</Value>")
                            .append("</DynamicParameter>");

                    //Ja jāsūta e-pasts:
                    //TemplateId = <LT_BLD_HOMEOWNER_UNISERVE_ID>
                    //Email_subject = <LT_BLD_HOMEOWNER_EMAIL_SUBJ>
                    String smsid = GetJsonObjectStringValueOrEmpty(objIN, "LT_BLD_HOMEOWNER_UNISERVE_SMS_ID");
                    if (!isEmptyOrNull(smsid)) {
                        sb.append("<DynamicParameter>")
                                .append("<Key>")
                                .append("Email_subject")
                                .append("</Key>")
                                .append("<Value>")
                                .append(GetJsonObjectStringValueOrEmpty(objIN, "LT_BLD_HOMEOWNER_EMAIL_SUBJ"))
                                .append("</Value>")
                                .append("</DynamicParameter>");

                    }

                    sb.append("</DynamicParametersList>");
                    sb.append("</Message>");
                }

            }

        }
            sb.append("</ListOfMessages>");
            sb.append("</JSONXMLNotificationsRequest>");

            FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/iCross/liCrossAtribbutesResult.xml"),
                sb.toString(), Charset.forName("UTF-8"));

            System.out.println(String.valueOf(sb.toString()));        
        //}

        //System.out.println(obj.getString("result"));
        //System.out.println(String.valueOf(obj.getBoolean("complete")));
    }

    private static Resp CalliCrossGetFSMAttributes(
            String ep, String serviceNumber, String username, String password,
            int connTimeout, int readTimeOut) throws IOException {

        Resp result = null;

        HttpURLConnection conn = null;
        BufferedReader in = null;
        String inputLine = "";
        StringBuffer response = new StringBuffer();

        String fullUrl = ep + "/?serviceName=" + serviceNumber;
        result.FullUrl = fullUrl;

        URL url = null;

        try {
            url = new URL(fullUrl);
        } catch (MalformedURLException e) {
            result.RetCode = "2";
            return result;
        }

        try {
            String authorization = username + ":" + password;
            byte[] encodedBytes = Base64.getEncoder().encode(authorization.getBytes());
            authorization = "Basic " + new String(encodedBytes);

            //HttpURLConnection conn = (HttpURLConnection) url.openConnection(proxy);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept-Charset", "UTF-8");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("Authorization", authorization);

            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setConnectTimeout(connTimeout);
            conn.setReadTimeout(readTimeOut);

            System.out.println("ResponseCode: " + conn.getResponseCode());

            in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

            result.RespHttpCodeOrigin = String.valueOf(conn.getResponseCode());

            if (conn.getResponseCode() == 200) {
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                result.RetMsg = response.toString();
                JSONObject obj = new JSONObject(response.toString());

            }

        } catch (Exception e) {
            result.RespCode = "SOA_227[099]";
            result.RespHttpCodeOrigin = String.valueOf(conn.getResponseCode());

            if (conn.getResponseCode() == 404) {
                try {
                    in = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                    result.RespFullOriginiCrossMsg = response.toString();
                } catch (Exception e1) {
                    response.append("Response read error:");
                    response.append(e1.getMessage());
                } finally {
                    in.close();
                }
                if (result.RespFullOriginiCrossMsg.contains("errorMessage")) {
                    JSONObject obj = new JSONObject(response.toString());
                    result.RetMsg = "iCross webserviss atgrieza kdu: " + obj.getString("errorMessage");
                }
                result.RespCode = "SOA_227[003]";
            } else {

                if (conn.getResponseCode() == 400) {
                    result.RespCode = "SOA_227[003]";
                    result.RetMsg = "iCross webserviss atgrieza kdu: missing mandatory parameter or wrong parameters combination";
                }

                // nav autorizcijas
                if (conn.getResponseCode() == 401) {
                    result.RespCode = "SOA_227[003]";
                    result.RetMsg = "iCross webserviss atgrieza kdu: wrong auth";
                }

                // nav method
                if (conn.getResponseCode() == 405) {
                    result.RespCode = "SOA_227[003]";
                    result.RetMsg = "iCross webserviss atgrieza kdu: Method not allowed";
                }

                // global error
                if (conn.getResponseCode() == 500) {
                    result.RespCode = "SOA_227[099]";
                    result.RetMsg = "No answer from iCross";
                } else {
                    result.RetMsg = "Global error: " + e.getMessage();
                }
            }

        }

        result.RetCode = "1";
        return result;
    }

    private static String GetJsonObjectStringValueOrEmpty(JSONObject orderData, String objName) throws Exception {
        try {
            return GetJsonObjectStringValue(orderData, objName);
        } catch (Exception e) {
            throw new Exception(objName + ": " + e.getMessage());
        }
    }

    private static String AddXMLFieldString(String xmlfieldname, String valToXml) {
        if (!isEmptyOrNull(valToXml)) {
            return "<" + xmlfieldname + ">" + valToXml + "</" + xmlfieldname + ">";
        } else {
            return "<" + xmlfieldname + "/>";
        }
    }

    private static String GetJsonObjectStringValue(JSONObject obj, String field) {
        String valToXml = "";
        Object objvalue = null;
        try {
            objvalue = obj.get(field);
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

    private static String FormatDate(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        String dd1 = d.substring(8, 10);
        String mm1 = d.substring(5, 7);
        String yy1 = d.substring(0, 4);
        String time = d.substring(11, 19);
        //System.out.println(dd1 + "/" + mm1 + "/" + yy1 + " " + time);
        return dd1 + "/" + mm1 + "/" + yy1 + " " + time;
    }

    private static String FormatDateShort(String d) {
        // ir   -> 2020-07-15 10:00:00
        // vaig -> 15/07/2020 10:00:00
        String dd1 = d.substring(8, 10);
        String mm1 = d.substring(5, 7);
        String yy1 = d.substring(0, 4);
        return dd1 + "/" + mm1 + "/" + yy1;
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().isEmpty())) {
            return true;
        }
        return false;
    }

    private static boolean isNull(Object obj) {
        if (null == obj) {
            return true;
        }
        return false;
    }

}
