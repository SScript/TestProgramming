package com.BillingTrigger;

import org.json.JSONArray;
import org.json.JSONObject;

public class JSonDataFunctions extends JSonDataFunctionsBase {

    public String GetDefaultValue(Object data, String fieldName, boolean mandatory) throws Exception {
        String result = "";
        //ņem lauku uzreiz no objekta
        if (data instanceof JSONObject) {
            return GetJsonObjectStringValue((JSONObject)data, fieldName, mandatory);
        }

        // jāskatās iekš orderitemiem
        if (data instanceof JSONArray) {

        }
        return result;
    }

}
