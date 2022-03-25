package com.LVPasts;

import org.json.*;

public class TestPakomatsresponse {


    //
    public static void main(String[] args) throws Exception {
        String d = "{\"Internal-ID-1\":\"CE723100981LV\"}";
        // "{"Internal-ID-1":"CE726447903LV"}"
        JSONObject obj = new JSONObject(d);
        System.out.println(obj.getString("Internal-ID-1"));

        //JSONArray o = new JSONArray("[" + obj.getString("Internal-ID-1") + "]");
        //System.out.println(o.toString());
    }
}
