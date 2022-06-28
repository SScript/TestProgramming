package com.BillingTrigger;

public class RequestBaseData {
    private String guid  = "";
    private String caller = "";

    private String OrderedService = "";
    private String OrderDate = "";
    private String BillAccountNumber = "";
    private String PaymentMode = "";
    private String OrderNumber = "";
    private String OrderId = "";
    private String AddressKey = "";
    private String AccountNo = "";
    private String Notes = "";
    private String DownPaymentBillNo = "";
    private String MonthDelay = "";
    private String BillActivationDate = "";
    private String OrderedServiceType = "";
    private String RemovalReason = "";
    private String OrderReason = "";

    //-----------------
    private String serviceno = "";

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getCaller() {
        return this.caller;
    }

    public void setCaller(String caller) {
        this.caller = caller;
    }

    public String getOrderedService() {
        return this.OrderedService;
    }

    public void setOrderedService(String orderedService) {
        this.OrderedService = orderedService;
    }

    public String getOrderDate() {
        return this.OrderDate;
    }

    public void setOrderDate(String orderDate) {
        this.OrderDate = orderDate;
    }

    public String getBillAccountNumber() {
        return BillAccountNumber;
    }

    public void setBillAccountNumber(String billAccountNumber) {
        BillAccountNumber = billAccountNumber;
    }

    public String getPaymentMode() {
        return PaymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        PaymentMode = paymentMode;
    }

    public String getOrderNumber() {
        return OrderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        OrderNumber = orderNumber;
    }

    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String orderId) {
        OrderId = orderId;
    }

    public String getAddressKey() {
        return AddressKey;
    }

    public void setAddressKey(String addressKey) {
        AddressKey = addressKey;
    }

    public String getDownPaymentBillNo() {
        return DownPaymentBillNo;
    }

    public void setDownPaymentBillNo(String downPaymentBillNo) {
        DownPaymentBillNo = downPaymentBillNo;
    }

    public String getMonthDelay() {
        return MonthDelay;
    }

    public void setMonthDelay(String monthDelay) {
        MonthDelay = monthDelay;
    }

    public String getBillActivationDate() {
        return BillActivationDate;
    }

    public void setBillActivationDate(String billActivationDate) {
        BillActivationDate = billActivationDate;
    }

    public String getOrderedServiceType() {
        return OrderedServiceType;
    }

    public void setOrderedServiceType(String orderedServiceType) {
        OrderedServiceType = orderedServiceType;
    }

    public String getRemovalReason() {
        return RemovalReason;
    }

    public void setRemovalReason(String removalReason) {
        RemovalReason = removalReason;
    }

    public String getOrderReason() {
        return OrderReason;
    }

    public void setOrderReason(String orderReason) {
        OrderReason = orderReason;
    }

    public String getAccountNo() {
        return AccountNo;
    }

    public void setAccountNo(String accountNo) {
        AccountNo = accountNo;
    }

    public String getNotes() {
        return Notes;
    }

    public void setNotes(String notes) {
        Notes = notes;
    }

    public String getServiceno() {
        return serviceno;
    }

    public void setServiceno(String serviceno) {
        this.serviceno = serviceno;
    }
}
