package com.BillingTrigger;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;

public class BillingTriggerRunner {
    public static void main(String[] args) throws Exception {

        String filename = "BillingTriggerInput_N7_Telco.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");
        ProcessBillingTrigger b2 = new ProcessBillingTrigger();
        Resp res2 = b2.ProcessJsonData(longJsonString, "Additional insurance, warranty, Split Payment", "1");
        System.out.println(res2.RetCode);
        System.out.println(res2.RetMsg);
        System.out.println(res2.SendJsonStr);

        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/Res_" + filename),
                res2.SendJsonStr, Charset.forName("UTF-8"));

    }
}
