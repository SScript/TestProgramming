/**
 * DT.ELE - SendNotificationsVLocityReqABCSImpl
 *  + Telco izmai?as
 */
package com.reach;

import java.sql.*;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;

import java.util.stream.Collectors;

import javax.naming.InitialContext;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;

public class ProcessJsonDataReach extends JSonDataFunctions {

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
        orderdataitems = GetJSONArrObj(orderdata, "OrderItems");
        if (orderdataitems.length() == 0) {
            isOrderItems = false;
        } else {
            isOrderItems = true;
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

        // sada?a ELE_Calculator
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

        // sada?a OrderUpdate
        Object objOrderUpdate = null;
        JSONArray orderUpdatearray = new JSONArray();
        JSONObject orderUpdatedata = null;
        JSONObject orderUpdateItemdata = null;
        boolean isOrderUpdateStructureAdded = false;
        try {
            orderUpdatedata = obj.getJSONObject("OrderUpdate");
            orderUpdateItemdata = orderUpdatedata.getJSONObject("Item");
            isOrderUpdateStructureAdded = true;
        } catch (Exception e) {
            isOrderUpdateStructureAdded = false;
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

            sb.append("<notificationaddress_MOBTOKEN/>"); //vienm?r tuk?s
            sb.append("<mtetuserid/>"); //vienm?r tuk?s
            sb.append("<mobileappid>1</mobileappid>"); //vienm?r 1

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

            // actioncode -> v?l no galven? bloka
            // UNISERVE template identifier - SOA will remove spaces in the REACH call.
            //(SOAIP-1079) - if at least one orderItem have ProductType = 'Electricity' and actioncode = 'OrderSummary', than send value 'OrderSummary_Electricity'
            String actcode = GetJsonAtrrObjectStringValue(obj, "ActionCode", true).replaceAll("\\s", "");
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

            // SOAIP-1791 - add AuthenticationMethod and CustomerType (p?rsaucam par CustomerStatusType)
            sb.append(AddDinamicParam("AuthenticationMethod", GetJsonAtrrObjectStringValue(obj, "AuthenticationMethod", false)));
            sb.append(AddDinamicParam("CustomerStatusType", GetJsonAtrrObjectStringValue(obj, "CustomerType", false)));

            // CustomerSubSegment SOAIP-2199
            sb.append(AddDinamicParam("CustomerSubSegment", GetJsonAtrrObjectStringValue(orderdata, "CustomerSubSegment", false)));

            // SOABG-1502
            // resume_date  SOAIP-2199
            String resumeDate = GetResumeDateValueFromSuspendEndDate(orderdataitems);
            if (!isEmptyOrNull(resumeDate)) {
                sb.append(AddDinamicParam("resume_date", FormatDate(resumeDate)));
            }
            if ("ResumeOrder".equalsIgnoreCase(actcode)) {
                // IsDebt SOAIP-2199
                sb.append(AddDinamicParam("IsDebt", GetJsonAtrrObjectStringValue(orderdata, "IsDebt", false)));
            }
            
            
            String gdprMobile = GetJsonAtrrObjectStringValue(obj, "GDPR_mobile", false);
            if (!isEmptyOrNull(gdprMobile)) {
            sb.append(AddDinamicParam("GDPR_mobile", gdprMobile));
            }

            String gdprEmail = GetJsonAtrrObjectStringValue(obj, "GDPR_email", false);
            if (!isEmptyOrNull(gdprEmail)) {
            sb.append(AddDinamicParam("GDPR_email", gdprEmail));
            }
            

            //OrderSubType (SOAIP-1076, SOAIP-2313)
            if (isOrderUpdateStructureAdded) {
                sb.append(AddDinamicParam("OrderSubType",
                        GetJsonAtrrObjectStringValue(orderUpdatedata, "OrderSubType", false)
                ));
            } else {
                if (isOrderData && isOrderItems) {
                    sb.append(AddDinamicParam("OrderSubType", GetOrderSubTypeValue()));
                } else {
                    sb.append(AddDinamicParam("OrderSubType", ""));
                }
            }

            String VLOrderDeliveryType = "";

            // J?padod ja no Vlocity sa?emta strukt?ra Order (SOAIP-1019) un nav TELCO order (SOAIP-2257)
            if (isOrderData) {
                if (!actcode.toLowerCase().contains("telco")) {
                    VLOrderDeliveryType = GetJsonAtrrObjectStringValue(orderdata, "VLOrderDeliveryType", false);
                    sb.append(AddDinamicParam("VLOrderDeliveryType", VLOrderDeliveryType));
                }
            }

            if (isOrderData || isOrderUpdateStructureAdded) {
                //VLOrderDeliveryType
                if ("OrderSummary_Telco".equalsIgnoreCase(actcode)) {
                    // If ActionCode = 'OrderSummary_Telco':
                    // if exist OrderItem with ProductCode = 'PD_TELCO_INSTALL_PACKAGE', then DeliveryMethod from the same OrderItem
                    //    else Name from OrderItem with ProductSubType = 'Installation'
                    sb.append(AddDinamicParam("VLOrderDeliveryType_SelfInstall", GetVLOrderDeliveryTypeSelfInstallTelco(orderdataitems)));
                    sb.append(AddDinamicParam("VLOrderDeliveryType_Fitter", GetVLOrderDeliveryTypeFitterTelco(orderdataitems)));
                } else {
                    if ("ChangeAgreedDate_telco".equalsIgnoreCase(actcode)) {
                        String installationType = "";
                        installationType = GetJsonAtrrObjectStringValue(orderUpdateItemdata, "InstallationType", true);
                        if (!"Ier?ko?ana ar meistaru".equals(installationType)) {
                            sb.append(AddDinamicParam("VLOrderDeliveryType_SelfInstall", installationType));
                            sb.append(AddDinamicParam("VLOrderDeliveryType_Fitter", ""));
                        } else {
                            sb.append(AddDinamicParam("VLOrderDeliveryType_SelfInstall", ""));
                            sb.append(AddDinamicParam("VLOrderDeliveryType_Fitter", installationType));
                        }
                    }
                }

                String insttype = "";
                // AgreedDate (SOAIP-2313)
                if ("ChangeAgreedDate_telco".equalsIgnoreCase(actcode)) {
                    insttype = GetJsonAtrrObjectStringValue(orderUpdateItemdata, "InstallationType", true);
                    if (!"Ier?ko?ana ar meistaru".equalsIgnoreCase(insttype)) {
                        sb.append(AddDinamicParam("AgreedDate",
                                FormatDate(GetJsonAtrrObjectStringValue(orderUpdateItemdata, "NewAgreedDate", false))
                        ));
                    }
                } else {
                    // AgreedDate (SOAIP-2016)
                    sb.append(AddDinamicParam("AgreedDate",
                            FormatDate(GetItemFieldValueByTwoFields(orderdataitems, "ProductSubType", "Installation", "ServiceType", "Self", "ServiceStartDate"))));
                }

                // VlOfferName SOAIP-2257
                sb.append(AddDinamicParam("VlOfferName", GetVlOfferName(orderdataitems)));


                // VlOfferName_SelfInstall SOAIP-2257
                if ("ChangeAgreedDate_telco".equalsIgnoreCase(actcode)) {
                    String installationType = "";
                    installationType = GetJsonAtrrObjectStringValue(orderUpdateItemdata, "InstallationType", true);
                    if (!"Ier?ko?ana ar meistaru".equals(installationType)) {
                        sb.append(AddDinamicParam("VlOfferName_SelfInstall", GetJsonAtrrObjectStringValue(orderUpdateItemdata, "OfferName", true)));
                    } else {
                        sb.append(AddDinamicParam("VlOfferName_Fitter", GetJsonAtrrObjectStringValue(orderUpdateItemdata, "OfferName", true)));
                    }
                } else {
                    sb.append(AddDinamicParam("VlOfferName_SelfInstall", GetVlOfferNameSelfInstallValue(orderdataitems)));
                    sb.append(AddDinamicParam("VlOfferName_Fitter", GetVlOfferNameFitterValue(orderdataitems)));
                }

                //VLOrderId
                if ("ChangeAgreedDate_telco".equalsIgnoreCase(actcode)) {
                    sb.append(AddDinamicParam("VLOrderId",
                            GetJsonAtrrObjectStringValue(orderUpdatedata, "OrderNumber", true)
                    ));
                } else {
                    sb.append(AddDinamicParam("VLOrderId", GetJsonAtrrObjectStringValue(orderdata, "VLOrderNumber", true)));
                }

                //VLOrderContactData
                if ("VLOCITY_NOTIF_2".equals(NotificationCommType)) {
                    sb.append(AddDinamicParam("VLOrderContactData", ""));
                } else {
                    if ("ChangeAgreedDate_telco".equalsIgnoreCase(actcode)) {
                        insttype = GetJsonAtrrObjectStringValue(orderUpdateItemdata, "InstallationType", true);
                        sb.append("<DynamicParameter>")
                                .append("<Key>")
                                .append("VLOrderContactData")
                                .append("</Key>")
                                .append("<Value>")
                                .append(GetJsonAtrrObjectStringValue(orderUpdatedata, "OrderContactName", true))
                                .append(", ")
                                .append(GetJsonAtrrObjectStringValue(orderUpdatedata, "OrderContactPhone", true))
                                .append("</Value>")
                                .append("</DynamicParameter>");
                        if ("Ier?ko?ana ar meistaru".equalsIgnoreCase(insttype)) {
                            System.out.println("this");

                            sb.append(AddDinamicParam("TetReservationDate",
                                    FormatDate(GetJsonAtrrObjectStringValue(orderUpdateItemdata, "NewAgreedDate", false)))
                            );
                            sb.append(AddDinamicParam("TetReservationTimePeriod",
                                    GetJsonAtrrObjectStringValue(orderUpdateItemdata, "NewAgreedTimePeriod", false))
                            );
                        }
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
                }
            }

            // ja ir padoti Order sada?as dati
            if (isOrderData) {
                //VLOrderId -> SOAIP-1771
                sb.append(AddDinamicParam("VLOrder", GetJsonAtrrObjectStringValue(orderdata, "VLOrderId", true)));

                //VLOrderCustomerName
                sb.append(AddDinamicParam("VLOrderCustomerName", GetJsonAtrrObjectStringValue(orderdata, "VLOrderCustomerName", true)));

                //VLOrderDeliveryAddress
                // Ja ActionCode = 'OrderSummary_Telco':
                //  Ja ir OrderItem ar ProductCode = 'PD_TELCO_INSTALL_PACKAGE', tad ja:
                //    DeliveryMethod = 'Courier', tad CourierAddressString
                //    DeliveryMethod = 'PickUpPoint', tad ParcelMachineAddress
                //    DeliveryMethod  = 'StoreFront', tad ?
                //    DeliveryMethod = 'AlreadyDelivered', tad nepadot ?o parametru
                //    else
                //      OrderItem.serviceAccountAddress
                // else
                //   Ja <VLOrderDeliveryType> ir tuk?s, tad tuk?s
                //   Ja <VLOrderDeliveryType> = 'DPD Courier', tad Addressconcat no AK_ADMIN db tabulas LTK_FULL_ADDRESSES_MD, mekl?t p?c addresskey = <VLOrderDeliveryAddress>,
                //   Ja <VLOrderDeliveryType> = 'Store front', tad <VLWarehauserName>.
                //     P?r?jos gad?jumos - <VLPickUpPoint>.
                if ("OrderSummary_Telco".equalsIgnoreCase(actcode)) {
                    String s = GetVLOrderDeliveryAddressTelco(orderdataitems);
                    if (!"ALREADYDELIVERED".equalsIgnoreCase(s)) {
                        sb.append(AddDinamicParam("VLOrderDeliveryAddress_SelfInstall", GetVLOrderDeliveryAddressTelco(orderdataitems)));
                    }
                    sb.append(AddDinamicParam("VLOrderDeliveryAddress_Fitter", GetVLOrderDeliveryAddressFitter(orderdataitems)));
                } else {
                    // Ja ActionCode = "ChangeAgreedDate_telco" un OrderUpdate.Item.InstallationType = "Ier?ko?ana ar meistaru", tad OrderUpate.Item.SAAddress
                    if ("ChangeAgreedDate_telco".equalsIgnoreCase(actcode)) {
                        String installationType = "";
                        installationType = GetJsonAtrrObjectStringValue(orderUpdateItemdata, "InstallationType", true);
                        if ("Ier?ko?ana ar meistaru".equals(installationType)) {
                            sb.append(AddDinamicParam("VLOrderDeliveryAddress_Fitter", GetJsonAtrrObjectStringValue(orderUpdateItemdata, "SAAddress", true)));
                        } else {
                            sb.append(AddDinamicParam("VLOrderDeliveryAddress_SelfInstall", GetJsonAtrrObjectStringValue(orderUpdateItemdata, "SAAddress", true)));
                        }
                    } else {
                        if (!actcode.toLowerCase().contains("telco")) {
                            switch (VLOrderDeliveryType) {
                                case "":
                                    sb.append(AddDinamicParam("VLOrderDeliveryAddress", ""));
                                    break;
                                case "DPD Courier":
                                    sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetOrderAddressData(orderdata)));
                                    //sb.append(AddDinamicParam("VLOrderDeliveryAddress", "aaaa"));
                                    break;
                                case "LVPasts Courier":
                                    sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetOrderAddressData(orderdata)));
                                    //sb.append(AddDinamicParam("VLOrderDeliveryAddress", "aaaa"));
                                    break;
                                case "Store Front":
                                    sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetJsonAtrrObjectStringValue(orderdata, "VLWarehauserName", false)));
                                    break;
                                default:
                                    sb.append(AddDinamicParam("VLOrderDeliveryAddress", GetJsonAtrrObjectStringValue(orderdata, "VLPickUpPoint", false)));
                                    break;
                            }
                        }
                    }
                }


                // VLOrderReturnType SOAIP-1928
                if ("OrderSummary_Telco".equalsIgnoreCase(actcode)) {
                    // VLOrderReturnType
                    String val = GetVLOrderReturnTypeValue(orderdataitems);
                    if (!isEmptyOrNull(val)) {
                        sb.append(AddDinamicParam("VLOrderReturnType", val));
                    }
                    // VLOrderReturnAddress  SOAIP-1928
                    val = GetVLOrderReturnAddressValue(orderdataitems);
                    if (!isEmptyOrNull(val)) {
                        sb.append(AddDinamicParam("VLOrderReturnAddress", val));
                    }
                    // VLOrderReturnContactData  SOAIP-1928
                    val = GetVLOrderReturnContactDataValue(orderdataitems);
                    if (!isEmptyOrNull(val)) {
                        sb.append(AddDinamicParam("VLOrderReturnContactData", val));
                    }
                }

                // VLOrderDeliveryContactPerson
                if ("OrderSummary_Telco".equalsIgnoreCase(actcode)) {
                    String s = GetVLOrderDeliveryContactPersonTelco(orderdataitems);
                    if (!"".equalsIgnoreCase(s)) {
                        sb.append(AddDinamicParam("VLOrderDeliveryContactPerson", s));
                    }
                }

                String s = GetJsonAtrrObjectStringValue(orderdata, "VLOrderMonthlyTotal", false);
                // VLOrderMonthlyTotal
                if (!isEmptyOrNull(s) && isItemWithProductTypeX(("Telco"))) {
                    sb.append(AddDinamicParam("VLOrderMonthlyTotal", s));
                }

                // VLOrderMonthlyTotalWithoutDiscount SOAIP-2015 && SOAIP-2257
                String VLOrderMonthlyTotalWithoutDiscount = GetVLOrderMonthlyTotalWithoutDiscountValue(orderdata);
                if (!isEmptyOrNull(VLOrderMonthlyTotalWithoutDiscount)) {
                    sb.append(AddDinamicParam("VLOrderMonthlyTotalWithoutDiscount", VLOrderMonthlyTotalWithoutDiscount));
                }

                // VLOrderTotalTotal
                s = GetJsonAtrrObjectStringValue(orderdata, "VLOrderTotalTotal", false);
                if (!isEmptyOrNull(s) && isItemWithProductTypeX(("Telco"))) {
                    sb.append(AddDinamicParam("VLOrderTotalTotal", s));
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

                //EstimateDeliveryTime -> v?l no galven? bloka
                sb.append(AddDinamicParam("EstimateDeliveryTime", GetJsonAtrrObjectStringValue(orderdata, "EstimateDeliveryTime", false)));

                //VLBillNumber
                sb.append(AddDinamicParam("VLBillNumber", GetJsonAtrrObjectStringValue(orderdata, "VLBillNumber", false)));

                //VLBillAmount (SOAIP-2016)
                sb.append(AddDinamicParam("VLBillAmount", GetJsonAtrrObjectStringValue(orderdata, "VLBillAmount", false)));

                //VLBillStatus (SOAIP-2016)
                sb.append(AddDinamicParam("VLBillStatus", GetJsonAtrrObjectStringValue(orderdata, "VLBillStatus", false)));

                //VLSinBillNumber (SOAIP-2016)
                sb.append(AddDinamicParam("VLSinBillNumber", GetJsonAtrrObjectStringValue(orderdata, "VLSinBillNumber", false)));

                //VLSinBillAmount
                sb.append(AddDinamicParam("VLSinBillAmount", GetJsonAtrrObjectStringValue(orderdata, "SinBillAmount", false)));

                //VLSinBillStatus (SOAIP-2016)
                sb.append(AddDinamicParam("VLSinBillStatus", GetJsonAtrrObjectStringValue(orderdata, "VLSinBillStatus", false)));

                //DebtAmmount (SOAIP-2016)
                String debtAmmountVal = GetJsonAtrrObjectStringValue(orderdata, "DebtAmmount", false);
                sb.append(AddDinamicParam("DebtAmmount", debtAmmountVal));

                // DebtPayed (SOAIP-2016)
                if (!isEmptyOrNull(debtAmmountVal)) {
                    if (Double.valueOf(debtAmmountVal).compareTo(Double.valueOf("5")) == 1) { // If DebtAmount > 5, then False
                        sb.append(AddDinamicParam("DebtPayed", "false"));
                    } else {
                        sb.append(AddDinamicParam("DebtPayed", "true"));
                    }
                } else {
                    sb.append(AddDinamicParam("DebtPayed", "true"));
                }

                // FitterVisitNeed  (SOAIP-2016)
                sb.append(AddDinamicParam("FitterVisitNeed", GetJsonFitterVisitNeedValue(orderdataitems, "Installation", "Fitter", false)));
                // FillerTimeIsSelected (SOAIP-2016)
                sb.append(AddDinamicParam("FillerTimeIsSelected", GetJsonFitterVisitNeedValue(orderdataitems, "Installation", "Fitter", true)));

                // IsContractSigned (SOAIP-2016) => no IsContractSkipped SOAIP-2064   // SOABG-1519
                s = GetJsonAtrrObjectStringValue(orderdata, "IsContractSkipped", false);
                if ("true".equalsIgnoreCase(s)) {
                    sb.append(AddDinamicParam("IsContractSigned", "true"));
                } else {
                    s = isOrderItemFieldWithDifferentValue(orderdataitems, "ContractStatus", "Contract Accepted");
                    if ("true".equalsIgnoreCase(s)) {
                        sb.append(AddDinamicParam("IsContractSigned", "false"));
                    } else {
                        sb.append(AddDinamicParam("IsContractSigned", "true"));
                    }
                }

                // TetReservationStartTime (SOAIP-2016)
                sb.append(AddDinamicParam("TetReservationStartTime", GetItemFieldValueByTwoFields(orderdataitems, "ProductSubType", "Installation",
                        "ServiceType", "Fitter", "TetReservationStartTime")));

                // TetReservationFinishTime (SOAIP-2016)
                sb.append(AddDinamicParam("TetReservationFinishTime", GetItemFieldValueByTwoFields(orderdataitems, "ProductSubType", "Installation",
                        "ServiceType", "Fitter", "TetReservationFinishTime")));

                //VLAgreementNumber
                sb.append(AddDinamicParam("VLAgreementNumber", GetJsonAtrrObjectStringValue(orderdata, "VLAgreementNumber", false)));

                // ContractAcceptanceMode (SOAIP-2016)
                sb.append(AddDinamicParam("VLAgreementNumber", GetJsonAtrrObjectStringValue(orderdata, "VLAgreementNumber", false)));

                //VLSaleChannel
                sb.append(AddDinamicParam("VLSaleChannel", GetJsonAtrrObjectStringValue(orderdata, "VLSaleChannel", false)));

                //PaymentMode
                sb.append(AddDinamicParam("PaymentMode", GetJsonAtrrObjectStringValue(orderdata, "PaymentMode", true)));

                //VLCancelReason
                sb.append(AddDinamicParam("VLCancelReason", GetJsonAtrrObjectStringValue(orderdata, "CancelReason", false)));

                // VlOfferName_remove (SOAIP-2064)
                sb.append(AddDinamicParam("VlOfferName_remove", GetVlOfferNameValueRemove(orderdataitems)));

                // ServiceNumber (SOAIP-1076, SOAIP-2064)
                sb.append(AddDinamicParam("ServiceNumber", GetServiceNumberValue(orderdataitems)));


                // VlVoip SOAIP-2233
                sb.append(AddDinamicParam("VlVoip", GetVlVoipValue(orderdataitems)));

                // EquipmentName SOAIP-2064
                sb.append(AddDinamicParam("EquipmentName", GetEquipmentNameValue(orderdataitems)));

                // OldCustomerNo
                sb.append(AddDinamicParam("OldCustomerNo", GetJsonAtrrObjectStringValue(orderdata, "OldCustomerNo", false)));

                // OldOrderCustomerName
                sb.append(AddDinamicParam("OldOrderCustomerName", GetJsonAtrrObjectStringValue(orderdata, "OldOrderCustomerName", false)));

                //AcceptanceDueDate
                sb.append(AddDinamicParam("AcceptanceDueDate", FormatDate(GetAcceptanceDueDate(orderdata))));

                // AcceptanceAddress
                sb.append(AddDinamicParam("AcceptanceAddress", GetAcceptanceAddress(orderdata)));

                // ServiceStartDate
                sb.append(AddDinamicParam("ServiceStartDate", FormatDate(GetServiceStartDate(orderdataitems))));

                // DiscountText
                sb.append(AddDinamicParam("DiscountText", FormatDiscountText(orderdata)));

                //Swap
                String swapval = GetJsonAtrrObjectStringValue(orderdata, "Swap", false);
                if (!isEmptyOrNull(swapval)) {
                    sb.append(AddDinamicParam("Swap", swapval));
                }

                // TetPlusEmail
                ResValues resv = isOrderWithItemAtrrFieldWithValue(orderdataitems, "attributeuniquecode__c", "ATT_EMAIL");
                sb.append(AddDinamicParam("TetPlusEmail", resv.RetString1Value));

                // ParcelId SOAIP-2085
                String parcelIdval = GetJsonAtrrObjectStringValue(orderdata, "ParcelId", false);
                if (!isEmptyOrNull(parcelIdval)) {
                    parcelIdval = parcelIdval.contains(",") ? parcelIdval.substring(0, parcelIdval.indexOf(',')) : parcelIdval;
                    sb.append(AddDinamicParam("ParcelId", parcelIdval));
                }

                // AppliedPromotionX fields
                String AppliedPromotionXFields = GetAppliedPromotionXFields(orderdata);
                if (!isEmptyOrNull(AppliedPromotionXFields)) {
                    sb.append(AppliedPromotionXFields);
                }

                //VLOrderItemX fields
                String VLOrderItemXFields = GetVLOrderItemXFields(obj);
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

            // Elektr?bas sada?a
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
                String VLOrderItemXFieldsELE_Calculator = GetVLOrderXFieldsELE_Calculator(elecalcdata);
                if (!isEmptyOrNull(VLOrderItemXFieldsELE_Calculator)) {
                    sb.append(VLOrderItemXFieldsELE_Calculator);
                }

            } // end of if (isELECalcStructureAdded) {

            sb.append("</DynamicParametersList>");

            sb.append("</Message>");
            sb.append("</ListOfMessages>");
            sb.append("</JSONXMLNotificationsRequest>");

            res.RetXmlStr = sb.toString();

            String oldCustNo = GetJsonAtrrObjectStringValue(orderdata, "OldCustomerNo", false);
            String custNo = GetJsonAtrrObjectStringValue(obj, "CustomerNo", true);
            String oldCustomerDeceased = GetJsonAtrrObjectStringValue(orderdata, "OldCustomerDeceased", false);
            boolean isTelco = isItemWithProductTypeX("Telco");

            if ("OrderCancelled_telco".equalsIgnoreCase(actcode) && !isEmptyOrNull(oldCustNo) && !oldCustNo.equalsIgnoreCase(custNo)
                    && ("N".equalsIgnoreCase(oldCustomerDeceased) || "FALSE".equalsIgnoreCase(oldCustomerDeceased))
                    && isTelco) {
                res.RetXmlStr2th = FormatRetXMLStr1(obj);
            }

            if (isOrderUpdateStructureAdded) {
                if ("ChangeAgreedDate_telco".equalsIgnoreCase(actcode)) {
                    String orderSubType = GetJsonAtrrObjectStringValue(orderUpdatedata, "OrderSubType", false);
                    oldCustNo = GetJsonAtrrObjectStringValue(orderUpdatedata, "OldCustomerNo", false);
                    oldCustomerDeceased = GetJsonAtrrObjectStringValue(orderUpdatedata, "OldCustomerDeceased", false);
                    if ("Ownership Change".equalsIgnoreCase(orderSubType) && !isEmptyOrNull(oldCustNo) && !oldCustNo.equalsIgnoreCase(custNo)
                            && ("N".equalsIgnoreCase(oldCustomerDeceased) || "FALSE".equalsIgnoreCase(oldCustomerDeceased))
                    ) {
                        res.RetXmlStr2th = FormatRetXMLStr2(obj);
                    }
                }
            }


        } catch (Exception e) {
            res.RetXmlStr = sb.toString();
            res.RetError = e.getMessage();
        }

        return res;
    }

    /**
     * SOAIP-2263 -> DT. Vlocity <> Reach: Pas?t?juma kopsavilkums un citas notifik?cijas (SOA_137) - W3. MACD Cancelation message
     *
     * @return
     */
    private String FormatRetXMLStr1(JSONObject obj) throws Exception {
        String res = "";
        StringBuilder sb = new StringBuilder();

        sb.append("<JSONXMLNotificationsRequest xmlns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\" xmlns:ns2=\"http://schemas.xmlsoap.org/ws/2003/05/partner-link/\" xmlns:plnk=\"http://docs.oasis-open.org/wsbpel/2.0/plnktype\" xmlns:ns1=\"http://xmlns.oracle.com/Upgrade/JSONXMLReachNotificationSOAReqABCSImpl/JSONXMLReachNotificationSOAReqABCSImpl\" xmlns:wsdl=\"http://schemas.xmlsoap.org/wsdl/\" xmlns:client=\"http://xmlns.oracle.com/DT/SendNotificationsVLocityReqABCSImpl/SendNotificationsVLocityReqABCSImpl\" xmlns:tns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\">\n");
        sb.append("<ListOfMessages>");
        sb.append("<Message>");

        sb.append(GetJsonObjectValue(obj, "CustomerNo", "customerNo", true));
        sb.append(GetJsonObjectValue(obj, "NotificationCommType", "notificationCommType", true));
        sb.append(GetJsonObjectValue(obj, "Requester", "requester", true));
        sb.append(GetJsonObjectValue(obj, "FirstNotificationStartTime", "firstNotificationStartTime", false));
        sb.append(GetJsonObjectValue(obj, "SendingType", "sendingType", true));

        sb.append("<notificationaddress_SMS/>");
        sb.append("<notificationaddress_EMAIL/>");

        sb.append("<notificationaddress_MOBTOKEN/>"); //vienm?r tuk?s
        sb.append("<mtetuserid/>"); //vienm?r tuk?s
        sb.append("<mobileappid>1</mobileappid>"); //vienm?r 1

        sb.append("<DynamicParametersList>");
        // actioncode
        sb.append(AddDinamicParam("actioncode", "OrderSummary_Electricity"));
        // VlOfferName
        sb.append(AddDinamicParam("VlOfferName", GetVlOfferNameValue(orderdataitems)));
        sb.append("</DynamicParametersList>");
        sb.append("</Message>");
        sb.append("</ListOfMessages>");
        sb.append("</JSONXMLNotificationsRequest>");

        return res;
    }

    /**
     * SOAIP-2313 -> DT. Vlocity <> Reach: Pas?t?juma kopsavilkums un citas notifik?cijas (SOA_137) - izmai?as saska?ota laika izmai?u notifik?cijai
     *
     * @return
     */
    private String FormatRetXMLStr2(JSONObject obj) throws Exception {
        String res = "";
        StringBuilder sb = new StringBuilder();

        // sada?a ELE_Calculator
        Object objOrderUpdate = null;
        JSONArray orderUpdatearray = new JSONArray();
        JSONObject orderUpdatedata = null;
        boolean isELECalcStructureAdded = false;
        try {
            objOrderUpdate = obj.get("OrderUpdate");
            if (objOrderUpdate instanceof JSONArray) {
                orderUpdatearray = (JSONArray) objOrderUpdate;
            }
            if (objOrderUpdate instanceof JSONObject) {
                orderUpdatearray = new JSONArray();
                orderUpdatearray.put(objOrderUpdate);
            }
            orderUpdatedata = orderUpdatearray.getJSONObject(0);
        } catch (Exception e) {
        }

        JSONObject orderUpdateItem = orderUpdatedata.getJSONObject("Item");
        String installationType = GetJsonAtrrObjectStringValue(orderUpdateItem, "InstallationType", true);

        sb.append("<JSONXMLNotificationsRequest xmlns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\" xmlns:ns2=\"http://schemas.xmlsoap.org/ws/2003/05/partner-link/\" xmlns:plnk=\"http://docs.oasis-open.org/wsbpel/2.0/plnktype\" xmlns:ns1=\"http://xmlns.oracle.com/Upgrade/JSONXMLReachNotificationSOAReqABCSImpl/JSONXMLReachNotificationSOAReqABCSImpl\" xmlns:wsdl=\"http://schemas.xmlsoap.org/wsdl/\" xmlns:client=\"http://xmlns.oracle.com/DT/SendNotificationsVLocityReqABCSImpl/SendNotificationsVLocityReqABCSImpl\" xmlns:tns=\"http://www.soa.com/xml/JSONXMLNotificationsIO\">\n");
        sb.append("<ListOfMessages>");
        sb.append("<Message>");

        sb.append(GetJsonObjectValue(orderUpdatedata, "OldCustomerNo", "customerNo", true));
        sb.append(AddXMLField("NotificationCommType", "VLOCITY_NOTIF_2"));
        sb.append(GetJsonObjectValue(obj, "Requester", "requester", true));
        sb.append(GetJsonObjectValue(obj, "FirstNotificationStartTime", "firstNotificationStartTime", false));
        sb.append(GetJsonObjectValue(obj, "SendingType", "sendingType", true));

        sb.append("<notificationaddress_SMS/>");
        sb.append("<notificationaddress_EMAIL/>");

        sb.append("<notificationaddress_MOBTOKEN/>"); //vienm?r tuk?s
        sb.append("<mtetuserid/>"); //vienm?r tuk?s
        sb.append("<mobileappid>1</mobileappid>"); //vienm?r 1

        sb.append("<DynamicParametersList>");
        // actioncode
        sb.append(AddDinamicParam("actioncode", "ChangeAgreedDate_OldCust"));
        // VlOfferName

        sb.append(AddDinamicParam("VlOfferName", GetJsonAtrrObjectStringValue(orderUpdateItem, "OfferName", true)));

        if (!"Ier?ko?ana ar meistaru".equalsIgnoreCase(installationType)) {
            sb.append(AddDinamicParam("AgreedDate",
                    FormatDate(GetJsonAtrrObjectStringValue(orderUpdateItem, "NewAgreedDate", false)))
            );

        }
        if ("Ier?ko?ana ar meistaru".equalsIgnoreCase(installationType)) {
            sb.append(AddDinamicParam("TetReservationDate",
                    FormatDate(GetJsonAtrrObjectStringValue(orderUpdateItem, "NewAgreedDate", false)))
            );
            sb.append(AddDinamicParam("TetReservationTimePeriod\t",
                    GetJsonAtrrObjectStringValue(orderUpdateItem, "NewAgreedTimePeriod", false))
            );
        }
        sb.append("</DynamicParametersList>");
        sb.append("</Message>");
        sb.append("</ListOfMessages>");
        sb.append("</JSONXMLNotificationsRequest>");

        return res;
    }

    /**
     * Ja ActionCode = 'OrderSummary_Telco' un ir OrderItem ar ProductCode = 'PD_TELCO_INSTALL_PACKAGE' un ja DeliveryMethod = 'Courier',
     * tad parametru DeliveryContactName, DeliveryContactEmail un DeliveryContactPhone v?rt?bas - konkatin?t,atdal?t?js - komats
     * par?jos gad?jumos - nes?t?t parametru
     *
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
                            if (isEmptyOrNull(result)) {
                                result = s2;
                            } else {
                                result = result + ", " + s2;
                            }
                            if (isEmptyOrNull(result)) {
                                result = s3;
                            } else {
                                result = result + ", " + s3;
                            }
                        }
                    }
                }
            } catch (Exception e) {
            }
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
            } catch (Exception e) {
            }
        }

        return result;
    }

    private String GetVLOrderDeliveryTypeSelfInstallTelco(JSONArray orderdataitems) throws Exception {
        int itemc = orderdataitems.length();
        String result = "";
        String prdCode = "";
        JSONObject d = null;
        if (isOrderItems) {
            try {
                for (int i = 0; i < itemc; i++) {
                    d = orderdataitems.getJSONObject(i);
                    prdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                    if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(prdCode)) {
                        return GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false);
                    }
                }
            } catch (Exception e) {
            }
        }

        return result;
    }

    private String GetVLOrderDeliveryTypeFitterTelco(JSONArray orderdataitems) throws Exception {
        int itemc = orderdataitems.length();
        String result = "";
        String prdSubType = "";
        String tetServiceType = "";
        JSONObject d = null;
        if (isOrderItems) {
            try {
                for (int i = 0; i < itemc; i++) {
                    d = orderdataitems.getJSONObject(i);
                    prdSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                    tetServiceType = GetJsonAtrrObjectStringValue(d, "Tet_Service_Type__c", false);
                    if ("Installation".equalsIgnoreCase(prdSubType) && "Fitter".equalsIgnoreCase(tetServiceType)) {
                        return GetJsonAtrrObjectStringValue(d, "Name", false);
                    }
                }
            } catch (Exception e) {
            }
        }

        return result;
    }

    private String FormatDiscountText(JSONObject orderdata) throws Exception {
        Object data = null;
        JSONArray apr = new JSONArray();
        String res = "";
        try {
            data = orderdata.get("AppliedPromotion");
            if (data instanceof JSONArray) {
                apr = (JSONArray) data;
            }
            if (data instanceof JSONObject) {
                apr = new JSONArray();
                apr.put(data);
            }

            JSONObject d = null;
            List<String> ls = new ArrayList<String>();
            String r = "";
            String papsFulfillmentStatus = "";
            int itemcount = apr.length();
            for (int i = 0; i < itemcount; i++) {
                d = apr.getJSONObject(i);
                r = GetJsonAtrrObjectStringValue(d, "PromotionName", false);
                papsFulfillmentStatus = GetJsonAtrrObjectStringValue(d, "PAPSFulfillmentStatus", false);

                if (!isEmptyOrNull(r) && !"InComplete".equals(papsFulfillmentStatus)) {
                    ls.add(r);
                }
            }
            if (ls.size() > 0) {
                return String.join(",", ls);
            } else {
                return "";
            }
        } catch (Exception e) {
            res = "";
        }
        return res;
    }

    /**
     * if OrderItems ar ProductType = Electricity,
     * then  OrderItems.ObjectAddress - konkatin?t no visiem OrderItem, kur ProductSubType = 'Root Object' (SOAIP-1938), atdal?t?js - komats.
     *
     * @param orderData
     * @return
     */
    private String GetAcceptanceAddress(JSONObject orderData) throws Exception {
        List<String> ls = new ArrayList<String>();
        String r = "";
        String productType;
        String productSubType;
        String orderItemAction;
        JSONObject d = null;

        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            d = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(d, "ProductType", true);
            productSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false); //mandatory only for Electricity
            orderItemAction = GetJsonAtrrObjectStringValue(d, "OrderItemAction", false);
            if ("Electricity".equals(productType) && "Root Object".equals(productSubType)) {
                r = GetJsonAtrrObjectStringValue(d, "ObjectAddress", false);
                if (!isEmptyOrNull(r)) {
                    ls.add(r);
                }
            } else {
                if ("Telco".equals(productType)) {
                    if (("Offer".equalsIgnoreCase(productSubType)) && ("Add".equalsIgnoreCase(orderItemAction) || "Change".equalsIgnoreCase(orderItemAction) || "Existing".equalsIgnoreCase(orderItemAction))) {
                        return GetJsonAtrrObjectStringValue(d, "serviceAccountAddress", false);
                    }
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
     * ContractAccDueDate vai SinBillDueDate - j?izvel?s maz?kais no visiem.
     *
     * @param orderData
     * @return
     */
    private String GetAcceptanceDueDate(JSONObject orderData) throws Exception {
        String res = "";
        String nd = "";
        JSONObject d = null;
        // SinBillDueDate ir viens, no ordera datiem
        res = GetJsonAtrrObjectStringValue(orderData, "SinBillDueDate", false);

        // ContractAccDueDate ir katr? orderitem?
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
     *
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
     * if order contains at least one OrderItem with OrderSubType = 'Ownership Change', than value is "Ownership Change"
     * if order contains at least one OrderItem with OrderSubType = 'Delete Insurance/Warranty', than value is "Delete Insurance/Warranty"
     *
     * @return
     */
    private String GetOrderSubTypeValue() throws Exception {
        String orderSubType;
        String productType;
        String productSubType;
        String productCode;
        int itemcount = orderdataitems.length();
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);

            orderSubType = GetJsonAtrrObjectStringValue(itemdata, "OrderSubType", false);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
            productSubType = GetJsonAtrrObjectStringValue(itemdata, "ProductSubType", false);
            productCode = GetJsonAtrrObjectStringValue(itemdata, "ProductCode", true);

            // Ja ProductType = Telco, tad OrderSubType no pirm?  OrderItem ar ProductSubType = Offer un ProductCode < 'PD_TELCO_TECH_LINE_NONCOMMERCIAL' (SOAIP-2257)
            if ("Telco".equalsIgnoreCase(productType)) {

                if ("Offer".equals(productSubType) && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equals(productCode)) {
                    return orderSubType;
                }
                //
            } else {


                if ("Restructuring".equals(orderSubType)) {
                    return "Restructuring";
                }
                if ("Ownership Change".equals(orderSubType)) {
                    return "Ownership Change";
                }
                if ("Delete Insurance/Warranty".equals(orderSubType)) {
                    return "Delete Insurance/Warranty";
                }
                // SOAIP-1761
                if ("Tariff Change".equals(orderSubType)) {
                    return "Tariff Change";
                }

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

    private String GetAppliedPromotionXFields(JSONObject orderdata) throws Exception {
        StringBuilder sb = new StringBuilder();
        String productType = "";
        Object data = null;
        JSONArray apr = new JSONArray();
        JSONObject d = null;

        try {
            data = orderdata.get("AppliedPromotion");
            if (data instanceof JSONArray) {
                apr = (JSONArray) data;
            }
            if (data instanceof JSONObject) {
                apr = new JSONArray();
                apr.put(data);
            }
        } catch (Exception e) {
            return "";
        }

        String fieldName = "";
        int itemcount = orderdataitems.length();
        //String fieldName = "";
        for (int i = 0; i < itemcount; i++) {
            d = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(d, "ProductType", true);
            if ("Telco".equalsIgnoreCase(productType)) {
                itemcount = apr.length();
                String val = "";
                String promotionAction = "";
                String papsFulfillmentStatus = "";
                for (int j = 0; j < itemcount; j++) {
                    d = apr.getJSONObject(j);
                    val = GetJsonAtrrObjectStringValue(d, "PromotionName", true);
                    promotionAction = GetJsonAtrrObjectStringValue(d, "PromotionAction", true);
                    papsFulfillmentStatus = GetJsonAtrrObjectStringValue(d, "PAPSFulfillmentStatus", false);
                    // DiscountNameX
                    if (!isEmptyOrNull(val)) {
                        if (!isEmptyOrNull(promotionAction)) {
                            if ("Add".equalsIgnoreCase(promotionAction) && !"InComplete".equals(papsFulfillmentStatus)) {
                                sb.append(AddDinamicParam("DiscountName" + (j + 1), val));
                            }
                        }
                    }
                    // DiscountTermX
                    val = GetJsonAtrrObjectStringValue(d, "PromotionTerm", true);
                    if (!isEmptyOrNull(val)) {
                        if (!isEmptyOrNull(promotionAction)) {
                            if ("Add".equalsIgnoreCase(promotionAction) && !"InComplete".equals(papsFulfillmentStatus)) {
                                sb.append(AddDinamicParam("DiscountTerm" + (j + 1), val));
                            }
                        }
                    }
                    // DiscountAmountX
                    val = GetJsonAtrrObjectStringValue(d, "DiscountAmount", true);
                    if (!isEmptyOrNull(val)) {
                        if (!isEmptyOrNull(promotionAction)) {
                            if ("Add".equalsIgnoreCase(promotionAction) && !"InComplete".equals(papsFulfillmentStatus)) {
                                sb.append(AddDinamicParam("DiscountAmount" + (j + 1), val));
                            }
                        }
                    }
                }
            }
        }

        return sb.toString();
    }

    private String GetVLOrderItemXFields(JSONObject obj) throws Exception {
        StringBuilder sb = new StringBuilder();
        String productType = "";
        String productSubType = "";
        String productActionCode = "";
        String productCode = "";
        String fulfilmentStatus = "";
        String orderItemId = "";
        String parentOrderItemId = "";
        String tetPriceSource = "";
        boolean vlOrderItemCountFlag = false;
        int c = 1;

        int itemcount = orderdataitems.length();
        String fieldName = "";
        for (int i = 0; i < itemcount; i++) {
            itemdata = orderdataitems.getJSONObject(i);
            productType = GetJsonAtrrObjectStringValue(itemdata, "ProductType", true);
            productSubType = GetJsonAtrrObjectStringValue(itemdata, "ProductSubType", false); //mandatory only for Electricity
            productActionCode = GetJsonAtrrObjectStringValue(obj, "ActionCode", false);
            productCode = GetJsonAtrrObjectStringValue(itemdata, "ProductCode", false);
            fulfilmentStatus = GetJsonAtrrObjectStringValue(itemdata, "FulfilmentStatus", false);
            orderItemId = GetJsonAtrrObjectStringValue(itemdata, "OrderItemId", true);
            parentOrderItemId = GetJsonAtrrObjectStringValue(itemdata, "ParentOrderItemId", false);
            tetPriceSource = GetJsonAtrrObjectStringValue(itemdata, "Tet_Price_Source", false);

            // flag dom?ts priek? t?, lai ir korekta numer?cija vlOrderItemX ar variabli 'c'
            if (vlOrderItemCountFlag) {
                c++;
                vlOrderItemCountFlag = false;
            }


            //Tiek ?emti tikai OrderItems ar ProductType = ConsumerGoods, Insurance , Warranty  and PersonalLiabilityInsurance.
            if ("ConsumerGoods".equals(productType) || "Insurance".equals(productType) ||
                    "Warranty".equals(productType) || "PersonalLiabilityInsurance".equals(productType)) {


                fieldName = "VLOrderItem" + (c) + "Id";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "OrderItemId", true)));

                fieldName = "VLOrderItem" + (c) + "Name";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "Name", true)));

                fieldName = "VLOrderItem" + (c) + "Amount";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "VLOneTimeCharge", true)));

                fieldName = "VLOrderItem" + (c) + "InitialPrice";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "PriceBeforDiscount", false)));

                fieldName = "VLOrderItem" + (c) + "Picture";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "Picture", false)));

                //fieldName = "VLOrderItem" + (c) + "AddInfo1";
                //sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "AddInfo1", false)));

                fieldName = "VLOrderItem" + (c) + "ParentId";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ParentOrderItemId", false)));

                fieldName = "VLOrderItem" + (c) + "RootId";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "RootOrderItemId", false)));

                // VLOrderItemXSerialNumber
                /*
                if ProductType = 'ConsumerGoods' - ServiceNumber
                If ProductType = 'Insurance' or 'Warranty', then - ServiceNumber from Item, with OrderItemId = insuarnce/warranty item.ParentOrderItemId
                else - null
                */
                fieldName = "VLOrderItem" + (c) + "SerialNumber";
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
                fieldName = "VLOrderItem" + (c) + "WEdocument";
                if ("Insurance".equals(productType) || "Warranty".equals(productType)) {
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false)));
                }

                // VLOrderItemXRemoveWEdocument
                // True if OrderSubType = 'Delete Insurance/Warranty', else - false
                fieldName = "VLOrderItem" + (c) + "RemoveWEdocument";
                String v1 = GetJsonAtrrObjectStringValue(itemdata, "OrderSubType", false);
                String v2 = GetJsonAtrrObjectStringValue(itemdata, "OrderItemAction", false);
                if ("Delete Insurance/Warranty".equals(v1) && "Disconnect".equals(v2)) {
                    sb.append(AddDinamicParam(fieldName, "True"));
                } else {
                    sb.append(AddDinamicParam(fieldName, "False"));
                }
                vlOrderItemCountFlag = true;
            }

            //Tiek ?emti OrderItems ar ProductType = Electricity un ProductSubType = 'Plan' (SOAIP-1938)
            if ("Electricity".equals(productType) && "Plan".equals(productSubType)) {
                // VLOrderItemXName
                fieldName = "VLOrderItem" + (c) + "Name";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ObjectAddress", false)));
                // VLOrderItemXStartDate
                fieldName = "VLOrderItem" + (c) + "StartDate";
                sb.append(AddDinamicParam(fieldName, FormatDate(GetJsonAtrrObjectStringValue(itemdata, "ServiceStartDate", false))));
                // VLOrderItemXTarifPlan
                fieldName = "VLOrderItem" + (c) + "TarifPlan";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "TPName", true)));
                //VLOrderItemXEic SOAIP-1760
                fieldName = "VLOrderItem" + (c) + "Eic";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ServiceNumber", false)));
                // VLOrderItemXAction  SOAIP-1760
                fieldName = "VLOrderItem" + (c) + "Action";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "OrderItemAction", false)));
                // VLOrderItemXTerm
                fieldName = "VLOrderItem" + (c) + "Term";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ContractTerm", false)));
                // VLOrderItemXPrice
                fieldName = "VLOrderItem" + (c) + "Price";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "UsageUnitPrice", false)));
                vlOrderItemCountFlag = true;
            }
            // Tiek ?emti OrderItems ar ProductType = Telco un ProductSubType = Offer
            if ("Telco".equals(productType)) {

                // SOAIP-2257 iz?emot fulfilmentstatus InComplete
                if (!"InComplete".equals(fulfilmentStatus) && "Offer".equals(productSubType)
                        && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equalsIgnoreCase(productCode)) {

                    String val = "";
                    fieldName = "VLOrderItem" + (c) + "Name";
                    ResValues res = isOrderItemAtrrFieldWithValue(itemdata, "attributeuniquecode__c", "ATT_VOIP_MINUTES");
                    if (res.RetBoolValue) {
                        val = GetJsonAtrrObjectStringValue(itemdata, "Name", false) + " " +
                                res.RetString1Value;
                    } else {
                        if ("Offer".equals(productSubType) && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equalsIgnoreCase(productCode)) {
                            val = GetJsonAtrrObjectStringValue(itemdata, "Name", false);
                        } else {
                            val = GetJsonAtrrObjectStringValue(itemdata, "Name", false);
                        }
                    }
                    sb.append(AddDinamicParam(fieldName, val));

                    fieldName = "VLOrderItem" + (c) + "Id";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "OrderItemId", true)));
                    fieldName = "VLOrderItem" + (c) + "Amount";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "VLOneTimeCharge", true)));
                    fieldName = "VLOrderItem" + (c) + "InitialPrice";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "PriceBeforDiscount", false)));
                    fieldName = "VLOrderItem" + (c) + "Picture";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "Picture", false)));
                    fieldName = "VLOrderItem" + (c) + "ParentId";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "ParentOrderItemId", false)));
                    fieldName = "VLOrderItem" + (c) + "RootId";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "RootOrderItemId", false)));


                    // VLOrderItemXStartDate
                    fieldName = "VLOrderItem" + (c) + "StartDate";
                    sb.append(AddDinamicParam(fieldName, FormatDate(GetJsonAtrrObjectStringValue(itemdata, "ServiceStartDate", false))));
                    // VLOrderItemXAction
                    fieldName = "VLOrderItem" + (c) + "Action";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "OrderItemAction", false)));
                    // VLOrderItemXTerm
                    fieldName = "VLOrderItem" + (c) + "Term";
                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "TelcoContractTerm", false)));

                    // OrderItemXRCcharge // SOAIP-2645
                    fieldName = "VLOrderItem" + (c) + "RCcharge";
                    if ("Child".equalsIgnoreCase(tetPriceSource)) {
                        sb.append(AddDinamicParam(fieldName, getTetPriceSourceFromChildItem(orderItemId)));
                    } else {
                        sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "VLRecurringCharge", false)));
                    }
                    vlOrderItemCountFlag = true;
                }
            }

            // Tiek ?emti OrderItems ar ProductType = Telco
            // VLOrderItemXProductYName, VLOrderItemXProductYRC, VLOrderItemXProductYNRC

            if ("Telco".equals(productType)
                    && "Offer".equals(productSubType)
                    && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equalsIgnoreCase(productCode)
                    && !"InComplete".equals(fulfilmentStatus)) {
                String ShowInVlocityOrderSummaryFlag = "";
                String PrdSubType = "";
                String PrdCode = "";
                String ServiceLine = "";
                String rootOrderItemId = "";
                JSONObject d = null;
                int cc = 0;



                for (int j = 0; j < itemcount; j++) {

                    d = orderdataitems.getJSONObject(j);
                    ShowInVlocityOrderSummaryFlag = GetJsonAtrrObjectStringValue(d, "ShowInVlocityOrderSummaryFlag", false);
                    PrdSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);
                    PrdCode = GetJsonAtrrObjectStringValue(d, "ProductCode", false);
                    ServiceLine = GetJsonAtrrObjectStringValue(d, "ServiceLine", false);
                    rootOrderItemId = GetJsonAtrrObjectStringValue(d, "RootOrderItemId", true);

                    if (orderItemId.equals(rootOrderItemId)) {
                        ResValues r = isOrderItemAtrrFieldWithValue(d, "attributeuniquecode__c", "ATT_VOIP_MINUTES");

                        if (("true".equalsIgnoreCase(ShowInVlocityOrderSummaryFlag)
                                && !("ServiceBundle".equalsIgnoreCase(PrdSubType) || "Offer".equalsIgnoreCase(PrdSubType))
                                && !"PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(PrdCode) && !"Voice Technical Line".equalsIgnoreCase(ServiceLine)
                                && !"InComplete".equals(fulfilmentStatus))
                                || (r.RetBoolValue)
                        ) {
                            cc++;
                            fieldName = "VLOrderItem" + (c) + "Product" + (cc) + "Name";
                            if (!r.RetBoolValue) {
                                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "Name", false)));
                            } else {
                                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "Name", false) + " " + r.RetString1Value));
                            }
                            fieldName = "VLOrderItem" + (c) + "Product" + (cc) + "RC";
                            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "VLRecurringCharge", false)));
                            fieldName = "VLOrderItem" + (c) + "Product" + (cc) + "NRC";
                            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "VLOneTimeCharge", false)));
                            fieldName = "VLOrderItem" + (c) + "Product" + (cc) + "Action";
                            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "OrderItemAction", false)));

                            vlOrderItemCountFlag = true;
                        }
                    }

                }
            }

            if ("Telco".equals(productType) && !"InComplete".equals(fulfilmentStatus) && "Offer".equals(productSubType) && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equals(productCode)) {

                // ja ActionCode = 'OrderSummary_Telco'
                if ("OrderSummary_Telco".equalsIgnoreCase(productActionCode)) {
                    // if exist OrderItem with ProductCode = 'PD_TELCO_INSTALL_PACKAGE'
                    String DelMEth = "";
                    JSONObject d = null;
                    String ProductSubTypeInstallationName = "";

                    DelMEth = GetJsonAtrrObjectStringValue(itemdata, "DeliveryMethod", false);

                    if ("Telco".equals(productType) && !"InComplete".equals(fulfilmentStatus) && "Offer".equals(productSubType)
                            && !"PD_TELCO_TECH_LINE_NONCOMMERCIAL".equals(productCode)) {


                        if ("PD_TELCO_INSTALL_PACKAGE".equalsIgnoreCase(productCode)) {
                            // VLOrderItemXDeliveryType
                            fieldName = "VLOrderItem" + (c) + "DeliveryType";
                            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "DeliveryMethod", false)));
                            // VLOrderItemXDeliveryAddress
                            fieldName = "VLOrderItem" + (c) + "DeliveryAddress";

                            switch (DelMEth.toUpperCase()) {
                                case "COURIER":
                                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "CourierAddressString", false)));
                                    break;
                                case "PICKUPPOINT":
                                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "ParcelMachineAddress", false)));
                                    break;
                                case "STOREFRONT":
                                    sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(d, "ParcelMachineAddress1", false)));
                                    break;
                                case "ALREADYDELIVERED":
                                    break;
                            }
                            // VLOrderItemXDeliveryContactPerson
                            if ("Courier".equalsIgnoreCase(DelMEth)) {
                                fieldName = "VLOrderItem" + (c) + "DeliveryContactPerson";
                                String s1 = GetJsonAtrrObjectStringValue(d, "DeliveryContactName", false);
                                String s2 = GetJsonAtrrObjectStringValue(d, "DeliveryContactEmail", false);
                                String s3 = GetJsonAtrrObjectStringValue(d, "DeliveryContactPhone", false);
                                String result = s1;
                                if (isEmptyOrNull(result)) {
                                    result = s2;
                                } else {
                                    result = result + ", " + s2;
                                }
                                if (isEmptyOrNull(result)) {
                                    result = s3;
                                } else {
                                    result = result + ", " + s3;
                                }
                                sb.append(AddDinamicParam(fieldName, result));
                            }
                        } else {
                            if ("Installation".equalsIgnoreCase(productSubType)) {
                                ProductSubTypeInstallationName = GetJsonAtrrObjectStringValue(d, "Name", false);
                            }

                            // paskatamies vai ir bijis -> if exist OrderItem with ProductCode = 'PD_TELCO_INSTALL_PACKAGE', ja nav, tad ...

                            // VLOrderItemXDeliveryType -> else Name from OrderItem with ProductSubType = 'Installation'
                            fieldName = "VLOrderItem" + (c) + "DeliveryType";
                            sb.append(AddDinamicParam(fieldName, ProductSubTypeInstallationName));
                            // VLOrderItemXDeliveryAddress -> else OrderItem.serviceAccountAddress
                            fieldName = "VLOrderItem" + (c) + "DeliveryAddress";

                            sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "serviceAccountAddress", false)));
                            // VLOrderItemXDeliveryContactPerson -> else nes?t?t parametru
                        }
                        vlOrderItemCountFlag = true;



                    }


                } // end of -> if ("OrderSummary_Telco".equalsIgnoreCase(productActionCode))
            }

            // VLOrderItemXTetLogin
            // OrderItems.TetLogin no OrderItem, kur ProductCode = 'PD_TELCO_OTT_CHANNEL'
            if ("PD_TELCO_OTT_CHANNEL".equalsIgnoreCase(productCode) && !"InComplete".equals(fulfilmentStatus)) {
                fieldName = "VLOrderItem" + getOfferItemCounter(parentOrderItemId) + "TetLogin";
                sb.append(AddDinamicParam(fieldName, GetJsonAtrrObjectStringValue(itemdata, "TetLogin", false)));
            }

        }
        return sb.toString();
    }


    private String getTetPriceSourceFromChildItem(String orderItemId)throws Exception {

        String tetPriceSource = "";
        String rootOrderItemId = "";
        JSONObject d = null;
        int itemcount = orderdataitems.length();

        for (int j = 0; j < itemcount; j++) {

            d = orderdataitems.getJSONObject(j);
            tetPriceSource = GetJsonAtrrObjectStringValue(d, "Tet_Price_Source", false);
            rootOrderItemId = GetJsonAtrrObjectStringValue(itemdata, "RootOrderItemId", false);

            if (rootOrderItemId.equals(orderItemId) && "Applicable".equalsIgnoreCase(tetPriceSource)) {
                return GetJsonAtrrObjectStringValue(d, "VLRecurringCharge", false);
            }

        }

        return "";
    }

    private int getOfferItemCounter(String parentOrderItemId)throws Exception {

        int itemcount = orderdataitems.length();

        int offerCounter = 0;
        String orderItemId = "";
        String productSubType = "";

        JSONObject d = null;
        if (isOrderItems) {
            for (int i = 0; i < itemcount; i++) {
                d = orderdataitems.getJSONObject(i);
                orderItemId = GetJsonAtrrObjectStringValue(d, "OrderItemId", false);
                productSubType = GetJsonAtrrObjectStringValue(d, "ProductSubType", false);

                if ("Offer".equalsIgnoreCase(productSubType)) {
                    offerCounter++;

                    if (parentOrderItemId.equals(orderItemId)) {
                        return offerCounter;
                    }
                }
            }
        }
        return offerCounter;
    }


    /**
     * ServiceNumber from Item, with OrderItemId = insuarnce/warranty item.ParentOrderItemId
     *
     * @param orderdataitems
     * @param itemdata
     * @param sField         - lauks, kuram j?mekl? v?rt?ba no pField
     * @param pField         - eso?? itema lauks, p?c kura mekl? sField lauku
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
                                            GetJsonAtrrObjectStringValue(itemattrdata.getJSONObject("attributeRunTimeInfo"), "value", false);
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

    private boolean isItemWithProductTypeX(String prdTypeValue) {
        int itemc = orderdataitems.length();
        JSONObject d = null;
        String prdType = "";
        if (isOrderItems) {
            try {
                for (int i = 0; i < itemc; i++) {
                    d = orderdataitems.getJSONObject(i);
                    prdType = GetJsonAtrrObjectStringValue(d, "ProductType", false);
                    if (prdTypeValue.equalsIgnoreCase(prdType)) {
                        return true;
                    }
                }
            } catch (Exception e) {
                return false;
            }
        }
        return false;
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
                    finalRes = GetJsonAtrrObjectStringValue(itemdata, itemField, false);
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
    /*
    private String GetVLOrderInstallmentMonthPaymValue() throws Exception {
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
     * Order delivery charge - summa no visiem pieg?des produktu cenam
     * OrderItems.VLOneTimeCharge, where ProductType = Shipping
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

    private String GetJsonObjectValue(JSONObject data, String jsonfieldName, String xmlfieldname, boolean mandatory) throws Exception {
        String valToXml = "";
        try {
            valToXml = GetJsonObjectStringValue(data.get(jsonfieldName));
        } catch (Exception e) {
            // ja oblig?tais un nav atrasts, tad error
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
                case '<':
                    sb.append("&lt;");
                    break;
                case '>':
                    sb.append("&gt;");
                    break;
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

            //ctx = new InitialContext();
            //ds = (DataSource) ctx.lookup("jdbc/AKADMIN"); //eis/DB/AKADMIN
            //conn = ds.getConnection();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@10.2.88.41:1534:CRASO", "AK_OWNER", "akwow45");

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

    private String GetJsonObjectItemAttrValue(String fieldName) {
        try {
            return itemattrdata.getString(fieldName);
        } catch (Exception e) {
            return "";
        }
    }

    private boolean isNull(Object obj) {
        if (null == obj) {
            return true;
        }

        return false;
    }

}
