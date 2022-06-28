package com.BillingTrigger;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class TestSortItems {

    public static void main(String[] args) throws Exception {
        String filename = "BillingTriggerInput_N7_Telco.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");


    }

}
