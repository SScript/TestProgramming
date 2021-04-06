package com;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class JsonFieldNameToUpper {

    protected static JSONObject obj;
    protected static JSONObject orderdata;
    protected static JSONArray orderdataarray;

    public static void main(String[] args) throws Exception {

        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/jsonreach.txt");
        String longJsonString = IOUtils.toString(fis, "UTF-8");

        obj = new JSONObject(longJsonString);
        orderdataarray = obj.getJSONArray("Order");
        orderdata = orderdataarray.getJSONObject(0);

        Object a = getIgnoreCase(orderdata, "VLOrderNumbeR");
        System.out.println(((String)a));
    }
    
    private static Object getIgnoreCase(JSONObject jobj, String key) {

    Iterator<String> iter = jobj.keySet().iterator();
    while (iter.hasNext()) {
        String key1 = iter.next();
        if (key1.equalsIgnoreCase(key)) {
            return jobj.get(key1);
        }
    }

    return null;

}
}
