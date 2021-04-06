package com.iCross;

import java.io.*;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class ReadCancelliCross {

    protected static JSONObject obj;

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/iCross/CancelliCrossResponse1.json");
        String jsonData = IOUtils.toString(fis, "UTF-8");
        obj = new JSONObject(jsonData);
        
        JSONArray ar = obj.getJSONArray("serviceNumbers");
        List<String> numbers = new ArrayList<String>();
        
        if (!ar.isEmpty()) {
            for (int i=0; i < ar.length(); i++) {
                numbers.add(ar.getString(i));
            }
            System.out.println(String.join(",", numbers));
        }
        
        //System.out.println(obj.getString("projectCrossId"));
        //System.out.println(obj.getString("projectName"));
        System.out.println(obj.getString("result"));
        System.out.println(String.valueOf(obj.getBoolean("complete")));


        JSONObject obj1 = new JSONObject();
        obj1.put("projectName", "aaaa");
        
        System.out.println(obj1.toString());

    }        

    
    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
