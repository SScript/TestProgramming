package com.reach;

import org.json.JSONArray;
import org.json.JSONObject;

public class BaseFunctions {

    public String AddXMLField(String xmlfieldname, String valToXml) {
        if (!isEmptyOrNull(valToXml)) {
            return "<" + xmlfieldname + ">" + valToXml + "</" + xmlfieldname + ">";
        } else {
            return "<" + xmlfieldname + "/>";
        }
    }

    public JSONArray GetJSONArrObj(JSONObject data, String arrName) {
        JSONArray result = new JSONArray();
        try {
            Object orderdataitems_o = data.get(arrName);
            if (orderdataitems_o instanceof JSONArray) {
                result = (JSONArray) orderdataitems_o;
            }
            if (orderdataitems_o instanceof JSONObject) {
                result.put(orderdataitems_o);
            }
        } catch (Exception e) {}

        return result;
    }

    public String GetJsonAtrrObjectStringValue(JSONObject data, String jsonfieldName, boolean mandatory) throws Exception {
        String result = "";
        try {
            result = GetJsonObjectStringValue(data.get(jsonfieldName));
        } catch (Exception e) {
            if (mandatory) {
                throw new Exception("Field: " + jsonfieldName + " is mandatory");
            } else {
                result = "";
            }
        }
        return result;
    }

    public String GetJsonObjectStringValue(Object objvalue) {
        String valToXml = "";
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
            if (valToXml.contains("\"")) {
                valToXml = valToXml.replace("\"", "\\\"");
            }
        }

    return valToXml;
}

    public boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }

    public String xmlEscapeText(String t) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < t.length(); i++) {
            char c = t.charAt(i);
            switch (c) {
                //case '<':
                //    sb.append("&lt;");
                //    break;
                //case '>':
                //    sb.append("&gt;");
                //    break;
                case '\"':
                    sb.append("&quot;");
                    break;
                case '&':
                    sb.append("&amp;");
                    break;
                case '\'':
                    sb.append("&apos;");
                    break;
                default:
                    //if (c > 0x7e) {
                    //    sb.append("&#" + ((int) c) + ";");
                    //} else
                    sb.append(c);
            }
        }
        return sb.toString();
    }

}
