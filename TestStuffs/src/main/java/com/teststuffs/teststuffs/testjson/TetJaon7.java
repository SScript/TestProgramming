package com.teststuffs.teststuffs.testjson;

import org.json.CDL;
import org.json.JSONArray;
import org.json.JSONObject;

public class TetJaon7 {

    public static void main(String[] args) {


        String a = "[\"CE723011323LV\"]";
        JSONArray o = new JSONArray(a);
        System.out.println(CDL.rowToString(o));

    }

}
