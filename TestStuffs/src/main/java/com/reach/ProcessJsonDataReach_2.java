/**
 * DT.ELE - SendNotificationsVLocityReqABCSImpl
 *  + Telco izmaiņas
 */
package com.reach;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.naming.InitialContext;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;

public class ProcessJsonDataReach_2 {

    private JSONArray orderdataarray;
    private JSONArray orderdataitems;
    private JSONArray casedataarray;
    private JSONObject casedata;
    private JSONObject itemdata;
    private JSONObject itemattrdata;
    private String addressId = "";
    private String ServiceAddressKey = "";
    private String NotificationCommType = "";

    private boolean isOrderData = false;
    private boolean isOrderItems = false;
    private boolean isCaseData = false;

    public Resp ProcessJsonData(String jsonData) throws Exception {
        Resp res = new Resp();
        Object orderdataitems_o;

        JSONObject obj;
        JSONObject orderdata;

        obj = new JSONObject(jsonData);

        // check if is Order data

        try {
            orderdataarray = obj.getJSONArray("Order");
            orderdata = orderdataarray.getJSONObject(0);
            isOrderData = true;
        } catch (Exception e) {
            orderdata = null;
            isOrderData = false;
        }

        // check if is orderitems data
        try {
            isOrderItems = false;
            orderdataitems_o = orderdata.get("OrderItems");
            if (orderdataitems_o instanceof JSONArray) {
                orderdataitems = (JSONArray) orderdataitems_o;
            }
            if (orderdataitems_o instanceof JSONObject) {
                orderdataitems = new JSONArray();
                orderdataitems.put(orderdataitems_o);
            }
            isOrderItems = true;
        } catch (Exception e) {
            isOrderItems = false;
        }

        Object objCASE = null;
        casedata = null;
        Boolean isCaseStructureAdded = false;
        try {
            objCASE = obj.get("Case");
            if (objCASE instanceof JSONArray) {
                casedataarray = (JSONArray) objCASE;
            }
            if (objCASE instanceof JSONObject) {
                casedataarray = new JSONArray();
                casedataarray.put(objCASE);
            }
            //casedataarray = obj.getJSONArray("Case");
            casedata = casedataarray.getJSONObject(0);
            isCaseStructureAdded = true;
        } catch (Exception e) {
            isCaseStructureAdded = false;
        }

        // sadaļa ELE_Calculator
        Object objELE = null;
        JSONArray elecalcdataarray = null;
        JSONObject elecalcdata = null;
        boolean isELECalcStructureAdded = false;
        try {
            objELE = obj.get("ELE_Calculator");
            if (objELE instanceof JSONArray) {
                elecalcdataarray = (JSONArray) objELE;
            }
            if (objELE instanceof JSONObject) {
                elecalcdataarray = new JSONArray();
                elecalcdataarray.put(objELE);
            }
            //elecalcdataarray = obj.getJSONArray("ELE_Calculator");
            elecalcdata = elecalcdataarray.getJSONObject(0);
            isELECalcStructureAdded = true;
        } catch (Exception e) {
            isELECalcStructureAdded = false;
        }

        StringBuilder sb = new StringBuilder();
        try {
            sb.append("<JSONXMLNotificationsRequest xmlns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\" xmlns:ns2=\"http://schemas.xmlsoap.org/ws/2003/05/partner-link/\" xmlns:plnk=\"http://docs.oasis-open.org/wsbpel/2.0/plnktype\" xmlns:ns1=\"http://xmlns.oracle.com/Upgrade/JSONXMLReachNotificationSOAReqABCSImpl/JSONXMLReachNotificationSOAReqABCSImpl\" xmlns:wsdl=\"http://schemas.xmlsoap.org/wsdl/\" xmlns:client=\"http://xmlns.oracle.com/DT/SendNotificationsVLocityReqABCSImpl/SendNotificationsVLocityReqABCSImpl\" xmlns:tns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\">\n");
            sb.append("<ListOfMessages>");
            sb.append("<Message>");

            sb.append(GetJsonObjectValue(obj, "CustomerNo", "customerNo", true));
            sb.append(GetJsonObjectValue(obj, "NotificationCommType", "notificationCommType", true));
            sb.append(GetJsonObjectValue(obj, "Requester", "requester", true));
            sb.append(GetJsonObjectValue(obj, "FirstNotificationStartTime", "firstNotificationStartTime", false));
            sb.append(GetJsonObjectValue(obj, "SendingType", "sendingType", true));

            if ("VLOCITY_NOTIF_2".equals(NotificationCommType)) {
                sb.append("<notificationaddress_SMS/>");
                sb.append("<notificationaddress_EMAIL/>");
            } else {
                sb.append(GetJsonObjectValue(obj, "Phone", "notificationaddress_SMS", false));
                sb.append(GetJsonObjectValue(obj, "Email", "notificationaddress_EMAIL", false));
            }

            sb.append("<notificationaddress_MOBTOKEN/>"); //vienmēr tukšs
            sb.append("<mtetuserid/>"); //vienmēr tukšs
            sb.append("<mobileappid>1</mobileappid>"); //vienmēr 1

            sb.append("<DynamicParametersList>");
            // CustomerType SOAIP-1724
            String custType = GetJsonAtrrObjectStringValue(obj, "VLOrderCustomerType", false);
            switch (custType.toUpperCase()) {
                case "CONSUMER":
                    sb.append(AddDinamicParam("CustomerType", "Private"));
                    break;
                case "BUSINESS":
                    sb.append(AddDinamicParam("CustomerType", "Business"));
                    break;
                default:
                    sb.append(AddDinamicParam("CustomerType", ""));
                    break;
            }

            // actioncode -> vēl no galvenā bloka
            // UNISERVE template identifier - SOA will remove spaces in the REACH call.
            //(SOAIP-1079) - if at least one orderItem have ProductType = 'Electricity' and actioncode = 'OrderSummary', than send value 'OrderSummary_Electricity'
            String actcode = GetJsonAtrrObjectStringValue(obj, "ActionCode", true).replaceAll("\\s","");
            if ("OrderSummary".equals(actcode) && isLeastOneProdType_Electricity()) {
                sb.append(AddDinamicParam("actioncode", "OrderSummary_Electricity"));
            } else {
                sb.append(AddDinamicParam("actioncode", actcode));
            }

            //ReadyMadeAddress
            if ("VLOCITY_NOTIF_1".equals(NotificationCommType)) {
                sb.append(AddDinamicParam("ReadyMadeAddress", "Y"));
            } else {
                sb.append(AddDinamicParam("ReadyMadeAddress", "N"));
            }

            // SOAIP-1791 - add AuthenticationMethod and CustomerType
            sb.append(AddDinamicParam("AuthenticationMethod", GetJsonAtrrObjectStringValue(orderdata, "AuthenticationMethod", false)));
            sb.append(AddDinamicParam("CustomerType", GetJsonAtrrObjectStringValue(orderdata, "CustomerType", false)));

            //OrderSubType (SOAIP-1076)
            if (isOrderData && isOrderItems) {
                sb.append(AddDinamicParam("OrderSubType", GetOrderSubTypeValue()));
            } else {
                sb.append(AddDinamicParam("OrderSubType", ""));
            }

            // ja ir padoti Order sadaļas dati
            if (isOrderData) {
                //VLOrderId -> SOAIP-1771
                sb.append(AddDinamicParam("VLOrder", GetJsonAtrrObjectStringValue(orderdata, "VLOrderId", true)));
                //VLOrderId
                sb.append(AddDinamicParam("VLOrderId", GetJsonAtrrObjectStringValue(orderdata, "VLOrderNumber", true)));

                //VLOrderCustomerName
                sb.append(AddDinamicParam("VLOrderCustomerName", GetJsonAtrrObjectStringValue(orderdata, "VLOrderCustomerName", true)));
                //VLOrderDeliveryType
                if ("OrderSummary_Telco".equalsIgnoreCase(actcode)) {
                    // If ActionCode = 'OrderSummary_Telco':
                    // if exist OrderItem with ProductCode = 'PD_TELCO_INSTALL_PACKAGE', then DeliveryMethod from the same OrderItem
                    //    else Name from OrderItem with ProductSubType = 'Installation'
                    sb.append(AddDinamicParam("VLOrderDeliveryType", GetVLOrderDeliveryTypeTelco(orderdataitems)));
                } else {
                    // else - VLOrderDeliveryType
                    sb.append(AddDinamicParam("VLOrderDeliveryType", GetJsonAtrrObjectStringValue(orderdata, "VLOrderDeliveryType", false)));
                }

                String VLOrderDeliveryType = "";
                try {
                    VLOrderDeliveryType = GetJsonAtrrObjectStringValue(orderdata, "VLOrderDeliveryType", false);
                } catch (Exception e) {
                    VLOrderDeliveryType = "";
                }
                //VLOrderDeliveryAddress
                // Ja ActionCode = 'OrderSummary_Telco':
                //  Ja ir OrderItem ar ProductCode = 'PD_TELCO_INSTALL_PACKAGE', tad ja:
                //    DeliveryMethod = 'Courier', tad CourierAddressString
                //    DeliveryMethod = 'PickUpPoint', tad ParcelMachineAddress
                //    DeliveryMethod  = 'StoreFront', tad ?
                //    DeliveryMethod = 'AlreadyDelivered', tad nepadot šo parametru
                //    else
                //      OrderItem.serviceAccountAddress
                // else
                //   Ja <VLOrderDeliveryType> ir tukšs, tad tukšs
                //   Ja <VLOrderDeliveryType> = 'DPD Courier', tad Addressconcat no AK_ADMIN db tabulas LTK_FULL_ADDRESSES_MD, meklēt pēc addresskey = <VLOrderDeliveryAddress>,
                //   Ja <VLOrderDeliveryType> = 'Store front', tad <VLWarehauserName>.
                //     Pārējos gadījumos - <VLPickUpPoint>.
                if ("OrderSummary_Telco".equalsIgnoreCase(actcode)) {
                    String s = GetVLOrderDeliveryAddressTelco(orderdataitems);
                    if (!"ALREADYDELIVERED".equalsIgnoreCase(s)) {
                        sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetVLOrderDeliveryAddressTelco(orderdataitems)));
                    }
                } else {
                    switch (VLOrderDeliveryType) {
                        case "":
                            sb.append(AddDinamicParam("VLOrderDeliveryAddress", ""));
                            break;
                        case "DPD Courier":
                            //sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetOrderAddressData(orderdata)));
                            sb.append(AddDinamicParam("VLOrderDeliveryAddress", "aaaa"));
                            break;
                        case "Store Front":
                            sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetJsonAtrrObjectStringValue(orderdata, "VLWarehauserName", false)));
                            break;
                        default:
                            sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetJsonAtrrObjectStringValue(orderdata, "VLPickUpPoint", false)));
                            break;
                    }
                }
                // VLOrderDeliveryContactPerson
                if ("OrderSummary_Telco".equalsIgnoreCase(actcode)) {
                    String s = GetVLOrderDeliveryContactPersonTelco(orderdataitems);
                    if (!"".equalsIgnoreCase(s)) {
                        sb.append(AddDinamicParam("VLOrderDeliveryContactPerson", s));
                    }
                }

                String s = GetOrderItemFieldValueByProductType("Telco", "MonthlyTotal");
                // VLOrderMonthlyTotal
                if (!isEmptyOrNull(s)) {
                    sb.append(AddDinamicParam("VLOrderMonthlyTotal", s));
                }
                // VLOrderTotalTotal
                s = GetOrderItemFieldValueByProductType("Telco", "TotalOneTimeAndRecurring");
                if (!isEmptyOrNull(s)) {
                    sb.append(AddDinamicParam("VLOrderTotalTotal", s));
                }

                //VLOrderContactData
                if ("VLOCITY_NOTIF_2".equals(NotificationCommType)) {
                    sb.append(AddDinamicParam("VLOrderContactData", ""));
                } else {
                    sb.append("<DynamicParameter>")
                            .append("<Key>")
                            .append("VLOrderContactData")
                            .append("</Key>")
                            .append("<Value>")
                            .append(GetJsonAtrrObjectStringValue(orderdata, "VLOrderContactName", true))
                            .append(", ")
                            .append(GetJsonAtrrObjectStringValue(orderdata, "VLOrderContactPhone", false))
                            .append(", ")
                            .append(GetJsonAtrrObjectStringValue(orderdata, "VLOrderContactEmail", false))
                            .append("</Value>")
                            .append("</DynamicParameter>");
                }
                //VLOrderTotal
                sb.append(AddDinamicParam("VLOrderTotal", GetJsonAtrrObjectStringValue(orderdata, "VLOrderTotal", true)));

                //VLOrderFstPayment
                String VLOrderFstPayment = GetVLOrderFstPaymentValue();
                if (!isEmptyOrNull(VLOrderFstPayment)) {
                    sb.append(AddDinamicParam("VLOrderFstPayment", VLOrderFstPayment));
                }

                //VLOrderDeliveryCharge
                String VLOrderDeliveryCharge = GetVLOrderDeliveryChargeValue();
                if (!isEmptyOrNull(VLOrderDeliveryCharge)) {
                    sb.append(AddDinamicParam("VLOrderDeliveryCharge", VLOrderDeliveryCharge));
                }

                //VLOrderInstallmentPeriod
                String VLOrderInstallmentPeriod = GetVLOrderInstallmentPeriodValue();
                if (!isEmptyOrNull(VLOrderInstallmentPeriod)) {
                    sb.append(AddDinamicParam("VLOrderInstallmentPeriod", VLOrderInstallmentPeriod));
                }

                //VLOrderInstallmentMonthPaym
                String VLOrderInstallmentMonthPaym = GetOrderItemFieldValueByProductType("SplitPayment", "VLRecurringCharge"); //GetVLOrderInstallmentMonthPaymValue();
                if (!isEmptyOrNull(VLOrderInstallmentMonthPaym)) {
                    sb.append(AddDinamicParam("VLOrderInstallmentMonthPaym", VLOrderInstallmentMonthPaym));
                }

                //EstimateDeliveryTime -> vēl no galvenā bloka
                sb.append(AddDinamicParam("EstimateDeliveryTime", GetJsonAtrrObjectStringValue(orderdata, "EstimateDeliveryTime", false)));

                //VLBillNumber
                sb.append(AddDinamicParam("VLBillNumber", GetJsonAtrrObjectStringValue(orderdata, "VLBillNumber", false)));

                //VLSinBillAmount
                sb.append(AddDinamicParam("VLSinBillAmount", GetJsonAtrrObjectStringValue(orderdata, "SinBillAmount", false)));

                //VLAgreementNumber
                sb.append(AddDinamicParam("VLAgreementNumber", GetJsonAtrrObjectStringValue(orderdata, "VLAgreementNumber", false)));

                //VLSaleChannel
                sb.append(AddDinamicParam("VLSaleChannel", GetJsonAtrrObjectStringValue(orderdata, "VLSaleChannel", false)));

                //PaymentMode
                sb.append(AddDinamicParam("PaymentMode", GetJsonAtrrObjectStringValue(orderdata, "PaymentMode", true)));

                //VLCancelReason
                sb.append(AddDinamicParam("VLCancelReason", GetJsonAtrrObjectStringValue(orderdata, "CancelReason", false)));

                // ServiceNumber (SOAIP-1076)
                sb.append(AddDinamicParam("ServiceNumber", GetServiceNumberValue()));

                // OldCustomerNo
                sb.append(AddDinamicParam("OldCustomerNo", GetJsonAtrrObjectStringValue(orderdata, "OldCustomerNo", false)));

                // OldOrderCustomerName
                sb.append(AddDinamicParam("OldOrderCustomerName", GetJsonAtrrObjectStringValue(orderdata, "OldOrderCustomerName", false)));

                //AcceptanceDueDate
                sb.append(AddDinamicParam("AcceptanceDueDate", GetAcceptanceDueDate(orderdata)));

                // AcceptanceAddress
                sb.append(AddDinamicParam("AcceptanceAddress", GetAcceptanceAddress(orderdata)));

                // ServiceStartDate
                sb.append(AddDinamicParam("ServiceStartDate", GetServiceStartDate(orderdata)));

                // VLOrderItemX fields
                String VLOrderItemXFields = GetVLOrderItemXFields();
                if (!isEmptyOrNull(VLOrderItemXFields)) {
                    sb.append(VLOrderItemXFields);
                }

            } // end of if (orderdata != null) { ... ja ir padoti Order dati

            if (casedata != null) {
                // Case.CaseNumber
                sb.append(AddDinamicParam("CaseNumber", GetJsonAtrrObjectStringValue(casedata, "CaseNumber", true)));
                // Case.CaseStatus
                sb.append(AddDinamicParam("CaseStatus", GetJsonAtrrObjectStringValue(casedata, "CaseStatus", true)));
                // Case.CaseType
                sb.append(AddDinamicParam("CaseType", GetJsonAtrrObjectStringValue(casedata, "CaseType", false)));
            }

            // Elektrības sadaļa
            if (isELECalcStructureAdded) {
                // AverageConsumtion
                sb.append(AddDinamicParam("AverageConsumtion", GetJsonAtrrObjectStringValue(elecalcdata, "AverageConsumtion", true)));
                // TechnicalInformation
                sb.append(AddDinamicParam("TechnicalInformation", GetJsonAtrrObjectStringValue(elecalcdata, "TechnicalInformation", true)));
                // TechnicalInformationAmperation
                sb.append(AddDinamicParam("TechnicalInformationAmperation", GetJsonAtrrObjectStringValue(elecalcdata, "TechnicalInformationAmperation", true)));
                // CompetitorPlan
                sb.append(AddDinamicParam("CompetitorPlan", GetJsonAtrrObjectStringValue(elecalcdata, "CompetitorPlan", true)));
                // CompetitorPrice
                sb.append(AddDinamicParam("CompetitorPrice", GetJsonAtrrObjectStringValue(elecalcdata, "CompetitorPrice", true)));
                // CompetitorMonthlyPayment
                sb.append(AddDinamicParam("CompetitorMonthlyPayment", GetJsonAtrrObjectStringValue(elecalcdata, "CompetitorMonthlyPayment", true)));
                // Comment
                sb.append(AddDinamicParam("Comment", GetJsonAtrrObjectStringValue(elecalcdata, "Comment", false)));
                // IsWat
                sb.append(AddDinamicParam("IsWat", GetJsonAtrrObjectStringValue(elecalcdata, "IsWat", false)));
                //VLOrderItemX fields for ELE_Calculator
                String VLOrderItemXFieldsELE_Calculator  = GetVLOrderXFieldsELE_Calculator (elecalcdata);
                if (!isEmptyOrNull(VLOrderItemXFieldsELE_Calculator )) {
                    sb.append(VLOrderItemXFieldsELE_Calculator);
                }

            } // end of if (isELECalcStructureAdded) {

            sb.append("</DynamicParametersList>");

            sb.append("</Message>");
            sb.append("</ListOfMessages>");
            sb.append("</JSONXMLNotificationsRequest>");

            res.RetXmlStr = xmlEscapeText(sb.toString());

        } catch (Exception e) {
            res.RetXmlStr = sb.toString();
            res.RetError = e.getMessage();
        }
        return res;
    }

    /**
     * Ja ActionCode = 'OrderSummary_Telco' un ir OrderItem ar ProductCode = 'PD_TELCO_INSTALL_PACKAGE' un ja DeliveryMethod = 'Courier',
     *   tad parametru DeliveryContactName, DeliveryContactEmail un DeliveryContactPhone vērtības - konkatinēt,atdalītājs - komats
     *   parējos gadījumos - nesūtīt parametru
     * @param orderdataitems
     * @return
     * @throws Exception
     */
    private String GetVLOrderDeliveryContactPersonTelco(JSONArray orderdataitems) throws Exception {
        int itemc = orderdataitems.length();
        String result = "";
        String prdCode = "";
        String prdDeliveryMethod = "";
        JSONObject d = null;
        if (isOrderItems) {
            try {
                for (int i = 0; i < itemc; i++) {
                    d = orderdataitems.getJSONObject(i);
                    prdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                    prdDeliveryMethod = GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);

                    if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(prdCode)) {
                        if ("COURIER".equalsIgnoreCase(prdDeliveryMethod)) {
                            String s1 = GetJsonAtrrObjectStringValue(d, "DeliveryContactName", false);
                            String s2 = GetJsonAtrrObjectStringValue(d, "DeliveryContactEmail", false);
                            String s3 = GetJsonAtrrObjectStringValue(d, "DeliveryContactPhone", false);
                            result = s1;
                            if (isEmptyOrNull(result)) {result = s2;} else {result = result + ", " + s2;}
                            if (isEmptyOrNull(result)) {result = s3;} else {result = result + ", " + s3;}
                        }
                    }
                }
            } catch (Exception e) {}
        }
        return result;
    }

    /**
     * Ja ir OrderItem ar ProductCode = 'PD_TELCO_INSTALL_PACKAGE', tad ja:
     *   DeliveryMethod = 'Courier', tad CourierAddressString
     *   DeliveryMethod = 'PickUpPoint', tad ParcelMachineAddress
     *   DeliveryMethod  = 'StoreFront', tad ?
     *   DeliveryMethod = 'AlreadyDelivered', tad nepadot šo parametru
     *     else
     *       OrderItem.serviceAccountAddress
     * @param orderdataitems
     * @return
     * @throws Exception
     */
    private String GetVLOrderDeliveryAddressTelco(JSONArray orderdataitems) throws Exception {
        int itemc = orderdataitems.length();
        String result = "";
        String prdCode = "";
        String prdDeliveryMethod = "";
        JSONObject d = null;
        if (isOrderItems) {
            try {
                for (int i = 0; i < itemc; i++) {
                    d = orderdataitems.getJSONObject(i);
                    prdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                    prdDeliveryMethod = GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);

                    if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(prdCode)) {
                        switch (prdDeliveryMethod.toUpperCase()) {
                            case "COURIER":
                                return GetJsonAtrrObjectStringValue(d, "CourierAddressString", false);
                                //break;
                            case "PICKUPPOINT":
                                return GetJsonAtrrObjectStringValue(d, "ParcelMachineAddress", false);
                                //break;
                            case "STOREFRON":
                                return GetJsonAtrrObjectStringValue(d, "ParcelMachineAddress1", false);
                                //break;
                            case "ALREADYDELIVERED":
                                return "ALREADYDELIVERED";
                                //break;
                            default:
                                return GetJsonAtrrObjectStringValue(d, "serviceAccountAddress", false);
                                //break;
                        }
                    } else {
                        if ("Installation".equalsIgnoreCase(prdDeliveryMethod)) {
                            result = GetJsonAtrrObjectStringValue(d, "Name", false);
                        }
                    }
                }
            } catch (Exception e) {}
        }
        return result;
    }
    /**
     * if exist OrderItem with ProductCode = 'PD_TELCO_INSTALL_PACKAGE', then DeliveryMethod from the same OrderItem
     * else Name from OrderItem with ProductSubType = 'Installation'
     *
     * @param orderdataitems
     * @return
     */
    private String GetVLOrderDeliveryTypeTelco(JSONArray orderdataitems) throws Exception {
        int itemc = orderdataitems.length();
        String result = "";
        String prdCode = "";
        String prdSubType = "";
        JSONObject d = null;
        if (isOrderItems) {
            try {
                for (int i = 0; i < itemc; i++) {
                    d = orderdataitems.getJSONObject(i);
                    prdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                    prdSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                    if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(prdCode)) {
                        return GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);
                    } else {
                        if ("Installation".equalsIgnoreCase(prdSubType)) {
                            result = GetJsonAtrrObjectStringValue(d, "Name", false);
                        }
                    }
                }
            } catch (Exception e) {}
        }

        return result;
    }
    private String GetServiceStartDate(JSONObject orderData) throws Exception {
        String res = "";
        String nd = "";
        JSONObject d = null;

        // ServiceStartDate ir katrā orderitemā
        if (isOrderItems) {
            for (int i = 0; i < orderdataitems.length(); i++) {
                d = orderdataitems.getJSONObject(i);
                nd = GetJsonAtrrObjectStringValue(d, "ServiceStartDate", false);
                if (isEmptyOrNull(res) && !isEmptyOrNull(nd)) {
                    res = nd;
                } else {
                    if (!isEmptyOrNull(nd)) {
                        res = CompareDates(res, nd);
                    }
                }
            }
        }

        return res;
    }

    /**
     * if OrderItems ar ProductType = Electricity,
     *  then  OrderItems.ObjectAddress - konkatinēt no visiem OrderItem, kur ProductSubType = 'Root Object' (SOAIP-1938), atdalītājs - komats.
     * @param orderData
     * @return
     */
    private String GetAcceptanceAddress(JSONObject orderData) throws Exception {
        List<String> ls = new ArrayList<String>();
        String r = "";
        String productType;
        String productSubType;
        JSONObject d = null;

        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            d = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(d, "ProductType", true);
            productSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false); //mandatory only for Electricity
            if ("Electricity".equals(productType) && "Root Object".equals(productSubType)) {
                r = GetJsonAtrrObjectStringValue(d, "ObjectAddress", false);
                if (!isEmptyOrNull(r)) {
                    ls.add(r);
                }
            }
        }
        if (ls.size() > 0) {
            return String.join(",", ls);
        } else {
            return "";
        }
    }

    /**
     * ContractAccDueDate vai SinBillDueDate - jāizvelās mazākais no visiem.
     * @param orderData
     * @return
     */
    private String GetAcceptanceDueDate(JSONObject orderData) throws Exception {
        String res = "";
        String nd = "";
        JSONObject d = null;
        // SinBillDueDate ir viens, no ordera datiem
        res = GetJsonAtrrObjectStringValue(orderData, "SinBillDueDate", false);

        // ContractAccDueDate ir katrā orderitemā
        if (isOrderItems) {
            for (int i = 0; i < orderdataitems.length(); i++) {
                d = orderdataitems.getJSONObject(i);
                nd = GetJsonAtrrObjectStringValue(d, "ContractAccDueDate", false);
                if (isEmptyOrNull(res) && !isEmptyOrNull(nd)) {
                    res = nd;
                } else {
                    if (!isEmptyOrNull(nd)) {
                        res = CompareDates(res, nd);
                    }
                }
            }
        }

        return res;
    }

    private String CompareDates(String currentDate, String newDate) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date start = sdf.parse(currentDate);
        Date end = sdf.parse(newDate);
        System.out.println();

        if (start.before(end)) {
            return currentDate;
        } else {
            return newDate;
        }
    }

    private String AddDinamicParam(String key, String value) {
        StringBuilder sb = new StringBuilder();
        if (!isEmptyOrNull(value)) {
            sb.append("<DynamicParameter>")
                    .append("<Key>").append(key).append("</Key>")
                    .append("<Value>").append(value).append("</Value>").append("</DynamicParameter>");
        } else {
            sb.append("<DynamicParameter>")
                    .append("<Key>").append(key).append("</Key>")
                    .append("<Value/>").append("</DynamicParameter>");
        }
        return sb.toString();
    }

    /**
     * if at least one orderItem have ProductType = 'Electricity'
     * @return
     */
    private boolean isLeastOneProdType_Electricity() throws Exception {
        String productType;
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
            if ("Electricity".equals(productType)) {
                return true;
            }
        }
        return false;
    }

    /**
     * if order contains at least one OrderItem with OrderSubType = 'Restructuring', than value is 'Restructuring'
     if order contains at least one OrderItem with OrderSubType = 'Ownership Change', than value is "Ownership Change"
     if order contains at least one OrderItem with OrderSubType = 'Delete Insurance/Warranty', than value is "Delete Insurance/Warranty"
     * @return
     */
    private String GetOrderSubTypeValue() throws Exception {
        String productType;
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "OrderSubType", false);
            if ("Restructuring".equals(productType)) {
                return "Restructuring";
            }
            if ("Ownership Change".equals(productType)) {
                return "Ownership Change";
            }
            if ("Delete Insurance/Warranty".equals(productType)) {
                return "Delete Insurance/Warranty";
            }
        }
        return "";
    }

    /**
     * ServiceNumber, where  ProductType = SplitPayment or 'Electricity'
     * WE document number - if ProductType = 'Warranty' or 'Insurance'
     *
     * @return
     */
    private String GetServiceNumberValue() throws Exception {
        String productType;
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
            if ("SplitPayment".equals(productType) || "Electricity".equals(productType)) {
                return GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false);
            }
        }
        return "";
    }

    // ELE_Calculator
    private String GetVLOrderXFieldsELE_Calculator(JSONObject elecalcdata) throws Exception {
        StringBuilder sb = new StringBuilder();
        String fieldName = "";
        JSONArray eledataitems = null;
        try {
            Object orderdataitems_o = elecalcdata.get("MonthlyPayments");
            if (orderdataitems_o instanceof JSONArray) {
                eledataitems = (JSONArray) orderdataitems_o;
            }
            if (orderdataitems_o instanceof JSONObject) {
                eledataitems = new JSONArray();
                eledataitems.put(orderdataitems_o);
            }
        } catch (Exception e) {
            eledataitems = new JSONArray();
        }
        JSONObject data = null;
        for (int i = 0; i < eledataitems.length(); i++) {
            data = eledataitems.getJSONObject(i);
            // TPNameX
            fieldName = "TPName" + (i + 1);
            sb.append(AddDinamicParam(fieldName, (GetJsonAtrrObjectStringValue(data, "TPName", true) + " " +
                    GetJsonAtrrObjectStringValue(data, "TPContractTerm", false)).trim()));
            // TPMonthlyPaymentX
            fieldName = "TPMonthlyPayment" + (i + 1);
            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(data, "TPMonthlyPayment", false)));
            // TPAnnualSavingX
            fieldName = "TPAnnualSaving" + (i + 1);
            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(data, "TPAnnualSaving", true)));
            // TPPriceX
            fieldName = "TPPrice" + (i + 1);
            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(data, "TPPrice", true)));
            // TPTotalPriceX
            fieldName = "TPTotalPrice" + (i + 1);
            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(data, "TPTotalPrice", true)));
            // ElectricityPartX
            fieldName = "ElectricityPart" + (i + 1);
            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(data, "ElectricityPart", true)));
            // SelectedX
            fieldName = "Selected" + (i + 1);
            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(data, "Selected", false)));
        }

        return sb.toString();
    }

    private String GetVLOrderItemXFields() throws Exception {
        StringBuilder sb = new StringBuilder();
        String productType = "";
        String productSubType = "";
        String productActionCode = "";
        String productCode = "";

        int itemcount = orderdataitems.length();
        String fieldName = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
            productSubType = GetJsonAtrrObjectStringValue(itemdata, "ProductSubType", false); //mandatory only for Electricity
            productActionCode = GetJsonAtrrObjectStringValue(itemdata, "ActionCode", false);
            productCode = GetJsonAtrrObjectStringValue(itemdata, "ProductCode", false);

            //Tiek ņemti tikai OrderItems ar ProductType = ConsumerGoods, Insurance , Warranty  and PersonalLiabilityInsurance.
            if ("ConsumerGoods".equals(productType) || "Insurance".equals(productType) ||
                    "Warranty".equals(productType) || "PersonalLiabilityInsurance".equals(productType)) {

                fieldName = "VLOrderItem" + (i + 1) + "Id";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "OrderItemId", true)));

                fieldName = "VLOrderItem" + (i + 1) + "Name";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "Name", true)));

                fieldName = "VLOrderItem" + (i + 1) + "Amount";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "VLOneTimeCharge", true)));

                fieldName = "VLOrderItem" + (i + 1) + "InitialPrice";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "PriceBeforDiscount", false)));

                fieldName = "VLOrderItem" + (i + 1) + "Picture";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "Picture", false)));

                fieldName = "VLOrderItem" + (i + 1) + "AddInfo1";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "AddInfo1", false)));

                fieldName = "VLOrderItem" + (i + 1) + "ParentId";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ParentOrderItemId", false)));

                fieldName = "VLOrderItem" + (i + 1) + "RootId";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "RootOrderItemId", false)));

                // VLOrderItemXSerialNumber
                /*
                if ProductType = 'ConsumerGoods' - ServiceNumber
                If ProductType = 'Insurance' or 'Warranty', then - ServiceNumber from Item, with OrderItemId = insuarnce/warranty item.ParentOrderItemId
                else - null
                */
                fieldName = "VLOrderItem" + (i + 1) + "SerialNumber";
                switch (productType) {
                    case "ConsumerGoods":
                        sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false)));
                        break;
                    case "Insurance":
                    case "Warranty":
                        sb.append(AddDinamicParam(fieldName, GetItemFieldValueByOtherField(orderdataitems, itemdata, "OrderItemId", "ParentOrderItemId")));
                        break;
                    default:
                        sb.append(AddDinamicParam(fieldName, ""));
                        break;
                }

                // VLOrderItemXWEdocument
                //ServiceNumber if ProductType = 'Insurance' or 'Warranty' else - null
                fieldName = "VLOrderItem" + (i + 1) + "WEdocument";
                if ("Insurance".equals(productType) || "Warranty".equals(productType)) {
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false)));
                }

                // VLOrderItemXRemoveWEdocument
                // True if OrderSubType = 'Delete Insurance/Warranty', else - false
                fieldName = "VLOrderItem" + (i + 1) + "RemoveWEdocument";
                String v1 = GetJsonAtrrObjectStringValue(itemdata, "OrderSubType", false);
                String v2 = GetJsonAtrrObjectStringValue(itemdata, "OrderItemAction", false);
                if ("Delete Insurance/Warranty".equals(v1) && "Disconnect".equals(v2)) {
                    sb.append(AddDinamicParam(fieldName, "True"));
                } else {
                    sb.append(AddDinamicParam(fieldName, "False"));
                }
            }

            //Tiek ņemti OrderItems ar ProductType = Electricity un ProductSubType = 'Plan' (SOAIP-1938)
            if ("Electricity".equals(productType) && "Plan".equals(productSubType)) {
                fieldName = "VLOrderItem" + (i + 1) + "Name";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ObjectAddress  ", false)));
                // VLOrderItemXStartDate
                fieldName = "VLOrderItem" + (i + 1) + "StartDate";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ServiceStartDate", false)));
                // VLOrderItemXTarifPlan
                fieldName = "VLOrderItem" + (i + 1) + "TarifPlan";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "TPName", true)));
                //VLOrderItemXEic SOAIP-1760
                fieldName = "VLOrderItem" + (i + 1) + "Eic";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false)));
                // VLOrderItemXAction  SOAIP-1760
                fieldName = "VLOrderItem" + (i + 1) + "Action";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "OrderItemAction", false)));
                // VLOrderItemXTerm
                fieldName = "VLOrderItem" + (i + 1) + "Term";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ContractTerm", false)));
                // VLOrderItemXPrice
                fieldName = "VLOrderItem" + (i + 1) + "Price";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "UsageUnitPrice", false)));
            }

            // Tiek ņemti OrderItems ar ProductType = Telco un ProductSubType = Offer
            if ("Telco".equals(productType) && "Offer".equals(productSubType)) {
                fieldName = "VLOrderItem" + (i + 1) + "Name";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "Name  ", false)));
                // VLOrderItemXStartDate
                fieldName = "VLOrderItem" + (i + 1) + "StartDate";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ServiceStartDate", false)));
                // VLOrderItemXTerm
                fieldName = "VLOrderItem" + (i + 1) + "Term";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "TelcoContractTerm", false)));
                // OrderItemXRCcharge
                fieldName = "VLOrderItem" + (i + 1) + "RCcharge";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "VLRecurringCharge", false)));
            }

            // Tiek ņemti OrderItems ar ProductType = Telco
            // VLOrderItemXProductYName, VLOrderItemXProductYRC, VLOrderItemXProductYNRC
            if ("Telco".equals(productType) && "Offer".equals(productSubType)) {
                String ShowInVlocityOrderSummaryFlag = "";
                String PrdSubType = "";
                String PrdCode = "";
                JSONObject d = null;
                int c = 0;
                for (int j = 0; j < itemcount; j++) {
                    d = orderdataitems.getJSONObject(j);
                    ShowInVlocityOrderSummaryFlag = GetJsonAtrrObjectStringValue(d, "ShowInVlocityOrderSummaryFlag", false);
                    PrdSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                    PrdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                    if ("true".equalsIgnoreCase(ShowInVlocityOrderSummaryFlag)
                            && !("ServiceBundle".equalsIgnoreCase(PrdSubType) || "Offer".equalsIgnoreCase(PrdSubType)
                            && !"PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(PrdCode))) {
                        c = c + 1;
                        fieldName = "VLOrderItem" + i + "Product" + c + "Name";
                        sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "Name", false)));
                        fieldName = "VLOrderItem" + i + "Product" + c + "RC";
                        sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "VLRecurringCharge", false)));
                        fieldName = "VLOrderItem" + i + "Product" + c + "YNRC";
                        sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "VLOneTimeCharge", false)));
                    }
                }
            }

            // ja ActionCode = 'OrderSummary_Telco'
            if ("OrderSummary_Telco".equalsIgnoreCase(productActionCode)) {
                // if exist OrderItem with ProductCode = 'PD_TELCO_INSTALL_PACKAGE'
                boolean is_PD_TELCO_INSTALL_PACKAGE = false;
                String PrdCode = "";
                String DelMEth = "";
                String PrdSubType = "";
                JSONObject d = null;
                String ProductSubTypeInstallationName = "";
                for (int j = 0; j < itemcount; j++) {
                    d = orderdataitems.getJSONObject(j);
                    PrdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                    DelMEth = GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);
                    PrdSubType = GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);
                    if ("Installation".equalsIgnoreCase(PrdSubType)) {
                        ProductSubTypeInstallationName = GetJsonAtrrObjectStringValue(d, "Name", false);
                    }
                    if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(PrdCode)) {
                        is_PD_TELCO_INSTALL_PACKAGE = true;
                        // VLOrderItemXDeliveryType
                        fieldName = "VLOrderItem" + i + "DeliveryType";
                        sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false)));
                        // VLOrderItemXDeliveryAddress
                        fieldName = "VLOrderItem" + i + "DeliveryAddress";
                        switch (DelMEth.toUpperCase()) {
                            case "COURIER":
                                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "CourierAddressString", false)));
                                break;
                            case "PICKUPPOINT":
                                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "ParcelMachineAddress", false)));
                                break;
                            case "STOREFRON":
                                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "ParcelMachineAddress1", false)));
                                break;
                            case "ALREADYDELIVERED":
                                break;
                        }
                        // VLOrderItemXDeliveryContactPerson
                        if ("Courier".equalsIgnoreCase(DelMEth)) {
                            fieldName = "VLOrderItem" + i + "DeliveryContactPerson";
                            String s1 = GetJsonAtrrObjectStringValue(d, "DeliveryContactName", false);
                            String s2 = GetJsonAtrrObjectStringValue(d, "DeliveryContactEmail", false);
                            String s3 = GetJsonAtrrObjectStringValue(d, "DeliveryContactPhone", false);
                            String result = s1;
                            if (isEmptyOrNull(result)) {result = s2;} else {result = result + ", " + s2;}
                            if (isEmptyOrNull(result)) {result = s3;} else {result = result + ", " + s3;}
                            sb.append(AddDinamicParam(fieldName, result));
                        }
                    }
                }
                // paskatamies vai ir bijis -> if exist OrderItem with ProductCode = 'PD_TELCO_INSTALL_PACKAGE', ja nav, tad ...
                if (!is_PD_TELCO_INSTALL_PACKAGE) {
                    // VLOrderItemXDeliveryType -> else Name from OrderItem with ProductSubType = 'Installation'
                    fieldName = "VLOrderItem" + i + "DeliveryType";
                    sb.append(AddDinamicParam(fieldName, ProductSubTypeInstallationName));
                    // VLOrderItemXDeliveryAddress -> else OrderItem.serviceAccountAddress
                    fieldName = "VLOrderItem" + i + "DeliveryAddress";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "serviceAccountAddress", false)));
                    // VLOrderItemXDeliveryContactPerson -> else nesūtīt parametru
                }
            } // end of -> if ("OrderSummary_Telco".equalsIgnoreCase(productActionCode))

            // VLOrderItemXTetLogin
            // OrderItems.TetLogin no OrderItem, kur ProductCode = 'PD_TELCO_OTT_CHANNEL'
            if ("PD_TELCO_OTT_CHANNEL".equalsIgnoreCase(productCode)) {
                fieldName = "VLOrderItem" + i + "TetLogin";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "TetLogin", false)));
            }
        }
        return sb.toString();
    }

    /**
     * ServiceNumber from Item, with OrderItemId = insuarnce/warranty item.ParentOrderItemId
     * @param orderdataitems - all orderdataitems
     * @param itemdata - current itemdata
     * @param sField - lauks, kuram jāmeklē vērtība no pField
     * @param pField - esošā itema lauks, pēc kura meklē sField lauku
     * @return
     */
    private String GetItemFieldValueByOtherField(JSONArray orderdataitems, JSONObject itemdata, String sField, String pField) throws Exception {
        String result = "";
        JSONObject itemdata_ = null;
        String parentOrderItemId = GetJsonAtrrObjectStringValue(itemdata, pField, true);

        int itemcount = orderdataitems.length();
        String sValue = "";
        if (!isEmptyOrNull(parentOrderItemId)) {
            for (int i = 0; i < itemcount; i++) {
                itemdata_ = orderdataitems.getJSONObject(i);
                sValue = GetJsonAtrrObjectStringValue(itemdata_, sField, false);
                if (sValue.equals(parentOrderItemId)) {
                    result = GetJsonAtrrObjectStringValue(itemdata_, "ServiceNumber", false);
                    break;
                }
            }
        } else {
            result = "";
        }

        return result;
    }

    /**
     * GetVLOrderInstallmentPeriodValue Value from OrderItems attribute "Term"
     * where ProductType = SplitPayment
     */
    private String GetVLOrderInstallmentPeriodValue() throws Exception {
        String res = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                String ProductType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
                if ("SplitPayment".equals(ProductType)) {
                    try {
                        JSONObject atrr = itemdata.getJSONObject("JSONAttribute");
                        Iterator<String> keys = atrr.keys();
                        while (keys.hasNext()) {
                            String key = keys.next();
                            JSONArray a = atrr.getJSONArray(key);
                            int itemattrcount = a.length();
                            for (int j = 0; j < itemattrcount; j++) {
                                itemattrdata = a.getJSONObject(j);
                                String valp = GetJsonObjectItemAttrValue("attributedisplayname__c");
                                if ("Term".equals(valp)) {
                                    res =
                                            GetJsonAtrrObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo"),"value", false);
                                }
                            }
                        }

                    } catch (Exception e) {
                        res = "";
                    }
                }
            }
        }
        return res;
    }

    private String GetOrderItemFieldValueByProductType(String prdType, String itemField) throws Exception {
        String result = "";
        String finalRes = "";
        String ProductType = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                //SplitPayment
                ProductType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
                if (prdType.equals(ProductType)) {
                    finalRes = GetJsonAtrrObjectStringValue(itemdata, itemField, true);
                }
            }
            return String.valueOf(finalRes);
        } else {
            return "";
        }
    }

    /**
     * Month payment
     * OrderItems.VLRecurringCharge where  ProductType = SplitPayment
     */
    /*private String GetVLOrderInstallmentMonthPaymValue() throws Exception {
        String result = "";
        String finalRes = "";
        String ProductType = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                //SplitPayment
                ProductType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
                if ("SplitPayment".equals(ProductType)) {
                    finalRes = GetJsonAtrrObjectStringValue(itemdata, "VLRecurringCharge", true);
                }
            }
            return String.valueOf(finalRes);
        } else {
            return "";
        }
    }*/

    /**
     * Order delivery charge - summa no visiem piegādes produktu cenam
     * OrderItems.VLOneTimeCharge, where ProductType = Shipping
     *
     */
    private String GetVLOrderDeliveryChargeValue() throws Exception {
        String result = "";
        double finalResCount = 0;
        String ProductType = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                //SplitPayment
                ProductType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
                if ("Shipping".equals(ProductType)) {
                    finalResCount =
                            finalResCount + Double.valueOf(GetJsonAtrrObjectStringValue(itemdata, "VLOneTimeCharge", true));
                }
            }
            return String.valueOf(finalResCount);
        } else {
            return "";
        }
    }

    /**
     * First payment amount
     * OrderItems.VLOneTimeCharge, where ProductType = Shipping
     */
    private String GetVLOrderFstPaymentValue() throws Exception {
        String result = "";
        double finalResCount = 0;
        String ProductType = "";
        if (isOrderItems) {
            int itemcount = orderdataitems.length();
            for (int i = 0; i < itemcount; i++) {
                itemdata = orderdataitems.getJSONObject(i);
                //SplitPayment
                ProductType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
                if ("SplitPayment".equals(ProductType)) {
                    finalResCount =
                            finalResCount + Double.valueOf(GetJsonAtrrObjectStringValue(itemdata, "VLOneTimeCharge", true));
                }
            }
            return String.valueOf(finalResCount);
        } else {
            return "";
        }
    }

    private String GetJsonAtrrObjectStringValue(JSONObject data, String jsonfieldName, boolean mandatory) throws Exception {
        String result = "";
        try {
            result = GetJsonObjectStringValue(data.get(jsonfieldName));
        } catch (Exception e) {
            if (mandatory) {
                throw new Exception("Field: " + jsonfieldName + " is mandatory");
            } else {
                result = "";
            }
        }
        return result;
    }

    private String GetJsonObjectStringValue(Object objvalue) {
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

    private String GetJsonObjectValue(JSONObject data, String jsonfieldName, String xmlfieldname, boolean mandatory) throws Exception {
        String valToXml = "";
        try {
            valToXml = GetJsonObjectStringValue(data.get(jsonfieldName));
        } catch (Exception e) {
            // ja obligātais un nav atrasts, tad error
            if (mandatory) {
                throw new Exception("Field: " + jsonfieldName + " is mandatory");
            } else {
                valToXml = "";
            }
        }

        switch (jsonfieldName) {
            case "NotificationCommType":
                NotificationCommType = valToXml;
                break;
            case "EstimateDeliveryTime":
                valToXml = FormatDate(valToXml);
                break;
        }

        // replace special symbols
        valToXml = xmlEscapeText(valToXml);

        if (!isEmptyOrNull(valToXml)) {
            return "<" + xmlfieldname + ">" + valToXml + "</" + xmlfieldname + ">";
        } else {
            return "<" + xmlfieldname + "/>";
        }
    }

    private String xmlEscapeText(String t) {
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

    private String GetOrderAddressData(JSONObject orderdata) throws Exception {

        DataSource ds = null;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        String val = "";
        try {
            addressId = GetJsonAtrrObjectStringValue(orderdata, "VLOrderDeliveryAddress", true);
        } catch (Exception e) {
            addressId = "";
        }
        // ja ir padota addreses kods
        if (!isEmptyOrNull(addressId)) {
            String sql =
                    "select addressconcat, flatname, postofficecode, nvl(othertext,'') as othertext, " +
                            "lowestlevelid, lowestleveltype from ak_owner.ltk_full_addresses_md where addresskey=" + addressId;

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("jdbc/AKADMIN"); //eis/DB/AKADMIN
            conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.execute();
            rs = pstmt.getResultSet();

            while (rs.next()) {
                //addAuditTrailEntry(rs.getString("NAME_LV"));
                val = rs.getString("addressconcat");
                if (isEmptyOrNull(val)) {
                    val = "";
                }
            }
            rs.close();
            pstmt.close();
            conn.close();
        }
        return val;
    }

    private String FormatDate(String d) {
        // var ienākt:
        // ir   -> 2020-07-15 10:00:00
        // vai -> 15/07/2020 10:00:00
        String dd1 = "";
        String mm1 = "";
        String yy1 = "";
        if (!isEmptyOrNull(d)) {
            String s = String.valueOf(d.charAt(4));
            if ("-".equals(s)) {
                dd1 = d.substring(8,10);
                mm1 = d.substring(5,7);
                yy1 = d.substring(0,4);
                return dd1 + "." + mm1 + "." + yy1;
            } else {
                s = String.valueOf(d.charAt(2));
                if ("/".equals(s)) {
                    dd1 = d.substring(0,2);
                    mm1 = d.substring(3,5);
                    yy1 = d.substring(6,10);
                    return dd1 + "." + mm1 + "." + yy1;
                } else {
                    return "";
                }
            }
        } else {
            return "";
        }
    }

    private String GetJsonObjectItemAttrValue(String fieldName) {
        try {
            return itemattrdata.getString(fieldName);
        } catch (Exception e) {
            return "";
        }
    }

    private boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }
}