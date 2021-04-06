package com.iCross;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class ReadInstalliCross {

    protected static JSONObject obj;

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/iCross/InstalliCrossResponse.json");
        String jsonData = IOUtils.toString(fis, "UTF-8");
        obj = new JSONObject(jsonData);
        
        System.out.println(obj.getString("projectCrossId"));
        System.out.println(obj.getString("projectName"));
        System.out.println(obj.getString("result"));
        System.out.println(String.valueOf(obj.getBoolean("complete")));

    }        

    
    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
