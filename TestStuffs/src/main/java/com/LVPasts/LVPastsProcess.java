package com.LVPasts;

import com.BillingTrigger.BillingTrigger2;
import com.BillingTrigger.Resp;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;

public class LVPastsProcess {

    public static void main(String[] args) throws Exception {

        String filename = "LVPasts_Test_01.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/" + filename);

        String longJsonString = IOUtils.toString(fis, "UTF-8");
        BillingTrigger2 b2 = new BillingTrigger2();
        Resp res2 = b2.ProcessJsonData(longJsonString);
        System.out.println(res2.SendJsonStr);

        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/Res_" + filename),
                res2.SendJsonStr, Charset.forName("UTF-8"));

    }

}
