package TestBillTrigger;

import com.BillingTrigger.ProcessBillingTrigger;
import com.BillingTrigger.Resp;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.junit.jupiter.api.*;

import java.io.FileInputStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestBillTrigSplitPaymentO01 {

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
        obj = new JSONObject(r.SendJsonStr);
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
        assertEquals("80168000001VzprAAC", obj.getString("orderid"));
    }

    @Nested
    @DisplayName("TriggerBilling Telco test 1")
    class TestTriggerBilSplitPayment001 {
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
            //System.out.println(testNumber);
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
