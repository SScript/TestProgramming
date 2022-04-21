package TestSendNotificationsVLocity;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.io.FileInputStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestSendNotificationsVLocity01 {

    public static int testNumber = 0;

    @BeforeAll
    static void CreateTestClass() throws Exception {
        String filename = "BillTriggerInput_N6.json";
        //FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/" + filename);

       // String longJsonString = IOUtils.toString(fis, "UTF-8");
        //BillingTrigger5 test = new BillingTrigger5();
        //r = test.ProcessJsonData(longJsonString);
        //o = new JSONObject(r.SendJsonStr);
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
        //assertEquals("80168000001VzprAAC", o.getString("orderid"));
    }

}
