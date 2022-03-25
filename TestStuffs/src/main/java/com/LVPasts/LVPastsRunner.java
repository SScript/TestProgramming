package com.LVPasts;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;

public class LVPastsRunner {

    public static void main(String[] args) throws Exception {

        String filename = "LVPasts_Test_02.json";
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/LVPasts/" + filename);
        String jsonData = IOUtils.toString(fis, "UTF-8");
        String lpep =  "https://127.0.0.1:4433/parcelsApi/create";
        String lpepo = "https://127.0.0.1:4433/postOfficeApi";


        CallLP cLP = new CallLP();
        Resp res = cLP.callLPService(lpep, lpepo, new JSONObject(jsonData), 30000, 30000);


        System.out.println(res.ResponseStr);

        //FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/BillingTrigger/Res_" + filename),
        //        res2.SendJsonStr, Charset.forName("UTF-8"));
    }
}
