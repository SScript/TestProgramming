package com.BillingTrigger;;

import java.util.ArrayList;
import java.util.List;


public class Resp {
    public String RetCode = "";
    public String RetCodeOrigin = "";
    public String SendJsonStr = "";
    public String RetStr = "";
    public String RetMsg = "";
    public String OrderId = "";
    public String OrderNumber = "";
    public String addressinfo = "";
    
    public String AccessToken = "";
    public String uEp = "";
    public String ResponseJson = "";
    
    public String responseVlocJson = "";
       
    List<String> messages = new ArrayList<>();
    
    // wave 3
    public String OrderedServiceOrigin = "";
    public String OrderedService = "";

    public int callCount = 0;
    public String SendJsonStr0 = "";
    public String SendJsonStr1 = "";
    public String SendJsonStr2 = "";
    public String SendJsonStr3 = "";
    public String SendJsonStr4 = "";

    public boolean isOrderLEvelError = false;
    public boolean isItemLEvelError = false;
   
}
