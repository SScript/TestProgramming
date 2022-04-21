package com.BillingTrigger.BillTrigTests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.BillingTrigger.BillingTriggerProcess;
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
        String filename = "BillTriggerInput_N6.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");
        BillingTriggerProcess test = new BillingTriggerProcess();
        r = test.ProcessJsonData(longJsonString);
        obj = new JSONObject(r.SendJsonStr);
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
        assertEquals("80168000001VzprAAC", obj.getString("orderid"));
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
            assertEquals("80168000001VzprAAC", obj.getString("orderid"));
        }

        @Test
        @DisplayName("Check field \"orderno\"")
        void checkOrderNumberValue() {
            System.out.println(testNumber);
            assertEquals("00614245", obj.getString("orderno"));
        }

    }

}
