package com.BillingTrigger;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;

public class BillingTriggerRunnerOld {
    public static void main(String[] args) throws Exception {
        String filename = "BillingTriggerInput_N9_Telco.json";
        //String filename = "BillTriggerInput_N6.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/samples/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");


        ProcessJson b4 = new ProcessJson();
        Resp res2 = b4.doTransform(longJsonString, "", "", "");

        System.out.println(res2.RetCode);
        System.out.println(res2.RetMsg);
        System.out.println("Pa vecam: " + res2.SendJsonStr);

        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/samples/res/Res_" + filename),
                res2.SendJsonStr0, Charset.forName("UTF-8"));
    }

}
