package com.BillingTrigger.BillTrigTests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.BillingTrigger.BillingTrigger5;
import com.BillingTrigger.Resp;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.junit.jupiter.api.*;

import java.io.FileInputStream;

public class TestBillTrigTELCO01 {

    public static Resp r = new Resp();
    public static JSONObject o;
    public static int testNumber = 0;

    @BeforeAll
    static void CreateTestClass() throws Exception {
        String filename = "BillTriggerInput_N6.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");
        BillingTrigger5 test = new BillingTrigger5();
        r = test.ProcessJsonData(longJsonString);
        o = new JSONObject(r.SendJsonStr);
    }

    @BeforeEach
    void LoadTestData() {
        testNumber++;
        System.out.println("---> " + testNumber);
    }

    @Test
    @DisplayName("Check if is test data loaded")
    void checkOrderIdValue() {
        System.out.println(testNumber);
        assertEquals("80168000001VzprAAC", o.getString("orderid"));
    }

    @Nested
    @DisplayName("TriggerBilling Telco test 1")
    class TestTriggerBilTelco1 {

        @BeforeEach
        void LoadTestDataTelco1() {
            //testNumber++;
            System.out.println("LoadTestDataTelco1");
            System.out.println(testNumber);
        }

        @Test
        @DisplayName("Check field \"orderid\"")
        void checkOrderIdValue() {
            System.out.println(testNumber);
            assertEquals("80168000001VzprAAC", o.getString("orderid"));
        }

        @Test
        @DisplayName("Check field \"orderno\"")
        void checkOrderNumberValue() {
            System.out.println(testNumber);
            assertEquals("00614245", o.getString("orderno"));
        }

    }

}
