package com.BillingTrigger;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;

public class BillingTriggerRunner {
    public static void main(String[] args) throws Exception {

        String filename = "TestAddress.json"; //"BillingTriggerOCPPLancode_Telco.json";
        //String filename = "BillingTriggerInput_N9_Telco.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/samples/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");

        ProcessBillingTrigger b2 = new ProcessBillingTrigger();
        Resp res2 = b2.ProcessJsonData(longJsonString, "Additional insurance, warranty, Split Payment", "1", "caller");

        //BillingTrigger4 b4 = new BillingTrigger4();
        //Resp res2 = b4.ProcessJsonData(longJsonString);

        System.out.println(res2.RetCode);
        System.out.println(res2.RetMsg);
        //System.out.println("Pa vecam: " + res2.SendJsonStr);

        //System.out.println("TELCO1");
        //System.out.println("TELCO1: " + res2.SendJsonStr1);
        //System.out.println("TELCO2: " + res2.SendJsonStr2);
        //System.out.println("TELCO3: " + res2.SendJsonStr3);
        //System.out.println("TELCO4: " + res2.SendJsonStr4);

        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/samples/res/Res_" + filename),
                res2.SendJsonStr0, Charset.forName("UTF-8"));

    }
}
