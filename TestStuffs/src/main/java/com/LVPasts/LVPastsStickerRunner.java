package com.LVPasts;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;

public class LVPastsStickerRunner {

    public static void main(String[] args) throws Exception {

        String filename = "Sticker.pdf";
        String jsonData = "[CE726459929LV]";
        String lpep =  "https://127.0.0.1:4433/parcelsDocumentsApi/stickers";

        CallLP cLP = new CallLP();
        Resp res = cLP.callLPServiceSticker(lpep, "a6463887eDc24Fc0a934b483F14604D4", jsonData, 30000, 30000);


        System.out.println(res.ResponseStr);

        byte[] data = Base64.decodeBase64(res.respPdf);
        try (OutputStream stream = new FileOutputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/LVPasts/Res_" + filename)) {
            stream.write(data);
        }
        //FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/LVPasts/Res_" + filename),
        //        res2.SendJsonStr, Charset.forName("UTF-8"));
    }


}
