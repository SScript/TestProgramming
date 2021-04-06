package com.teststuffs.teststuffs.teststrings;

import org.json.JSONObject;

public class testpaternerror {

    public static void main(String[] args) {
        String strrr = "{\"Result\":\"aa\",\"Resultcode\":1}\"";
        String res = "";

        JSONObject resobj = new JSONObject(strrr);
        try {
            String r = resobj.getString("Result");
            if ("Success".equals(r)) {res = "OK";}
            else {
                try {
                Integer e = resobj.getInt("Resultcode");
                res = String.valueOf(e);
                } catch (Exception e) { res = strrr; }
            }
        } catch (Exception e) {
            res = strrr;
        }

        System.out.println("res = " + res);
    }

    public static String valueOf(Object obj) {
        return (obj == null) ? "null" : obj.toString();
    }
}
