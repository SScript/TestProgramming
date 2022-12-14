package com.BillingTrigger.BillTrigTests;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import com.BillingTrigger.ProcessBillingTrigger;
import com.BillingTrigger.Resp;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.junit.jupiter.api.*;

import java.io.FileInputStream;

public class TestBillTrigTELCO01 {

    public static Resp r = new Resp();
    public static JSONObject obj;
    public static int testNumber = 0;

    @BeforeAll
    static void CreateTestClass() throws Exception {
        String filename = "BillingTriggerInput_N7_Telco.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");
        ProcessBillingTrigger test = new ProcessBillingTrigger();
        r = test.ProcessJsonData(longJsonString, "", "");
        try {
            obj = new JSONObject(r.SendJsonStr);
        } catch (Exception e) {obj = null;}
    }
/*
    @BeforeEach
    void LoadTestData() {
        testNumber++;
        System.out.println("---> " + testNumber);
    }
*/
    @Test
    @DisplayName("Check if is test data loaded")
    void checkOrderIdValue() {
        //System.out.println(testNumber);
        assertNotEquals(null, obj);
    }

    @Nested
    @DisplayName("TriggerBilling Telco test 1")
    class TestTriggerBilTelco1 {
/*
        @BeforeEach
        void LoadTestDataTelco1() {
            //testNumber++;
            System.out.println("LoadTestDataTelco1");
            System.out.println(testNumber);
        }
*/
        @Test
        @DisplayName("Check field \"orderid\"")
        void checkOrderIdValue() {
           // System.out.println(testNumber);
            assertEquals("8013N000003rtmOQAQ", obj.getString("orderid"));
        }

        @Test
        @DisplayName("Check field \"orderno\"")
        void checkOrderNumberValue() {
            //System.out.println(testNumber);
            assertEquals("00022582", obj.getString("orderno"));
        }

        @Test
        @DisplayName("Check field \"serviceno\"")
        void checkServiceNoValue() {
            //System.out.println(testNumber);
            assertEquals("DSLS3000152", obj.getString("serviceno"));
        }


    }

}
