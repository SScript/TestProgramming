package com.LVPasts;

import org.json.*;

public class TestParcelCreateResponse {
    // ["CE731851404LV"]

    public static void main(String[] args) {
        Resp result = new Resp();
        result.ResponseStr = "[\"CE731851404LV\"]";
        String ep = "https://127.0.0.1:4433/parcelsApi/create";
        try {
            if (!result.ResponseStr.contains("error")) {
                if (ep.contains("parcelsApi/create")) {

                    // ResponseStr: [{"country_id":"Valsts nav pareizi nor\u0101d\u012bta (j\u0101nor\u0101da Latvija)"}] -> not ok
                    // ResponseStr: {"Internal-ID-1":{"station_id":"Nor\u0101d\u012btais pakom\u0101ta indekss netika atrasts"}} -> not ok
                    // ResponseStr: ["CE723011323LV"] - ok
                    // ResponseStr: {"Internal-ID-1":"CE723100981LV"} ok
                    if (!result.ResponseStr.startsWith("[\"CE")) {

                        // {"Internal-ID-1":"CE723100981LV"} ok
                        if (result.ResponseStr.contains("Internal-ID-1")) {
                            if (result.ResponseStr.startsWith("[")) {
                                JSONArray obja = new JSONArray(result.ResponseStr);
                                JSONObject ob = null;
                                int ii = obja.length();
                                String ss = "";
                                for (int j = 0; j < ii; j++) {
                                    ob = (JSONObject)obja.get(j);
                                    String[] fieldnames = JSONObject.getNames((JSONObject)ob);
                                    for (int i = 0; i < ((JSONObject)ob).length(); i++) {
                                        ss = ss + fieldnames[i] + ": " + GetJsonAtrrObjectStringValue(((JSONObject)ob), fieldnames[i]) + "; ";
                                    }
                                }
                                result.respCode = "SOA_142[015]";
                            } else {
                                JSONObject obj = new JSONObject(result.ResponseStr);
                                result.respMsg = obj.getString("Internal-ID-1");
                                result.ResponseStr = "[\"" + obj.getString("Internal-ID-1") + "\"]";
                                result.respCode = "1";
                            }
                        } else {
                            if (result.ResponseStr.startsWith("[")) {
                                JSONArray obja = new JSONArray(result.ResponseStr);
                                JSONObject ob = null;
                                int ii = obja.length();
                                String ss = "";
                                for (int j = 0; j < ii; j++) {
                                    ob = (JSONObject)obja.get(j);
                                    String[] fieldnames = JSONObject.getNames((JSONObject)ob);
                                    for (int i = 0; i < ((JSONObject)ob).length(); i++) {
                                        ss = ss + fieldnames[i] + ": " + GetJsonAtrrObjectStringValue(((JSONObject)ob), fieldnames[i]) + "; ";
                                    }
                                }
                                result.respMsg = ss;
                            }
                        }
                    } else {
                        result.respCode = "1";
                        result.respMsg = "OK";
                        JSONArray o = new JSONArray(result.ResponseStr);
                        result.ParcelId = CDL.rowToString(o);

                    }
                } else {
                    // courierApplicationsApi/create
                    JSONObject obj = new JSONObject(result.ResponseStr);
                    JSONObject o1 = obj.getJSONObject("result");
                    Object o = o1.get("My-ID-3954653");

                    if (o instanceof Boolean) {
                        if (((Boolean)o) == true) {
                            result.respCode = "1";
                            result.respMsg = "OK";
                        }
                    } else {
                        String ss = "";
                        result.respCode = "SOA_142[015]";
                        String[] fieldnames = JSONObject.getNames((JSONObject)o);
                        for (int i = 0; i < ((JSONObject)o).length(); i++) {
                            ss = ss + fieldnames[i] + ": " + GetJsonAtrrObjectStringValue(((JSONObject)o), fieldnames[i]) + "; ";
                        }
                        result.respMsg = ss;
                    }
                }
            } else {
                result.respCode = "SOA_142[015]";
                result.respMsg = "Kļūda no Latvijas Pasts: " + result.ResponseStr;
            }

        } catch (Exception e) {

        }

    }

    private static String GetJsonAtrrObjectStringValue(JSONObject obj, String objName) {
        String valToXml = "";
        Object objvalue = null;
        try {
            objvalue = obj.get(objName);
            if (objvalue instanceof Boolean) {
                Boolean boolToUse = ((Boolean) objvalue).booleanValue();
                valToXml = boolToUse.toString();
            } else if (objvalue instanceof Integer || objvalue instanceof Long) {
                long intToUse = ((Number) objvalue).longValue();
                valToXml = String.valueOf(intToUse);
            } else if (objvalue instanceof Float || objvalue instanceof Double) {
                double floatToUse = ((Number) objvalue).doubleValue();
                valToXml = String.valueOf(floatToUse);
            } else if (JSONObject.NULL.equals(objvalue)) {
                valToXml = "";
            } else {
                valToXml = ((String) objvalue).toString();
            }
        } catch (Exception e) {valToXml = "";}

        return valToXml;
    }

}
