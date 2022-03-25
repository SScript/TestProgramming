package com.LVPasts;

import org.json.*;

public class TestLVPASTSParcelsTrackJSON {
    public static void main(String[] args) throws Exception {
        String j = "{\n" +
                "    \"LPData\": {\n" +
                "        \"contact_email1\": \"\",\n" +
                "        \"contact_phone\": 26027914,\n" +
                "        \"city\": {\n" +
                "            \"xsi:nil\": true,\n" +
                "            \"xmlns:xsi\": \"http://www.w3.org/2001/XMLSchema-instance\"\n" +
                "        },\n" +
                "        \"sms_invite\": 1,\n" +
                "        \"order_number\": \"\",\n" +
                "        \"OrderNumber\": 123456789,\n" +
                "        \"secret\": \"a6463887eDc24Fc0a934b483F14604D4\",\n" +
                "        \"type\": \"Ie\",\n" +
                "        \"house\": \"7A\",\n" +
                "        \"add_address1\": \"\",\n" +
                "        \"contact_email\": \"roberts.granits@t2t.lv\",\n" +
                "        \"call_courier\": 1,\n" +
                "        \"pickup_zipcode\": \"\",\n" +
                "        \"street\": \"BRĀĻU KAUDZĪŠU IELA\",\n" +
                "        \"contact_phone1\": \"\",\n" +
                "        \"CustomerName\": \"\",\n" +
                "        \"WAREHOUSE_NAME\": \"\",\n" +
                "        \"village\": \"JAUNPIEBALGA\",\n" +
                "        \"floor\": \"\",\n" +
                "        \"contact_person1\": \"\",\n" +
                "        \"email\": \"mail@mail.lv\",\n" +
                "        \"DeliveryType\": \"Courier\",\n" +
                "        \"area\": \"JAUNPIEBALGAS NOV.\",\n" +
                "        \"fulladdress\": \"Jaunmoku iela 13\",\n" +
                "        \"comments\": \"\",\n" +
                "        \"last_pickup_time\": \"17:00\",\n" +
                "        \"contact_person\": \"Jānis Kalniņš\",\n" +
                "        \"station_id\": \"\",\n" +
                "        \"apartment_nr\": 11,\n" +
                "        \"delivery_priority\": \"\",\n" +
                "        \"pickup\": \"\",\n" +
                "        \"add_address\": \"T/C Spice Home\",\n" +
                "        \"group_uid\": \"\",\n" +
                "        \"zipcode\": \"LV-4125\",\n" +
                "        \"multiparcel\": 1,\n" +
                "        \"phone\": \"+37112345678\",\n" +
                "        \"company_name\": \"\",\n" +
                "        \"district\": \"JAUNPIEBALGAS PAG.\",\n" +
                "        \"DoorDelivery\": \"\",\n" +
                "        \"name_surname\": \"VĀRDS UZVĀRDS\",\n" +
                "        \"DeliveryMode\": \"LV Pasts Courier delivery\",\n" +
                "        \"package_weight\": 1.23,\n" +
                "        \"carry_assist\": \"\",\n" +
                "        \"country_id\": 7,\n" +
                "        \"PickUpId\": \"\"\n" +
                "    }\n" +
                "}";
        JSONObject obj = new JSONObject(j);
        String res = FormatLPRestStr(obj);

        //JSONObject obj = new JSONObject();
        //JSONArray data = new JSONArray();
        //data.put("event").put("date").put("location").put("next_office");
        //obj.put("secret", "secretkey").put("id", "").put("fields", data);

        System.out.println(obj.toString());
        System.out.println(res);
    }


    private static String FormatLPRestStr(JSONObject lpindata) throws Exception {
        JSONObject data = lpindata.getJSONObject("LPData");

        String dat = "";
        String dat1 = "";
        String res = "secret=" + GetJsonAtrrObjectStringValue(data.get("secret"));

        dat = GetJsonAtrrObjectStringValue(data.get("multiparcel"));
        int i = 1;
        if (!isEmptyOrNull(dat)) {
            i = Integer.parseInt(dat);
        }
        for (int j = 0; j<i; j++) {
            dat = GetJsonAtrrObjectStringValue(data.get("type"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][type]=" + dat;}

            if (i > 1) {
                res=res+"&parcels[" + j + "][multiparcel]=1";
                dat = GetJsonAtrrObjectStringValue(data.get("OrderNumber"));
                if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][group_uid]=" + dat;}
            }

            dat = GetJsonAtrrObjectStringValue(data.get("package_weight"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][package_weight]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("name_surname"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][name_surname]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("company_name"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][company_name]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("country_id"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][country_id]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("city"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][city]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("area"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][area]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("district"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][district]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("village"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][village]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("street"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][street]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("house"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][house]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("apartment_nr"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][apartment_nr]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("zipcode"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][zipcode]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("phone"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][phone]=" + FormatPhoneNumber(dat);}

            dat = GetJsonAtrrObjectStringValue(data.get("email"));
            if (!isEmptyOrNull(dat)) {res=res+"&parcels[" + j + "][email]=" + dat;}

            dat = GetJsonAtrrObjectStringValue(data.get("CustomerName"));
            String floor = "";
            floor = GetJsonAtrrObjectStringValue(data.get("floor"));
            if (!isEmptyOrNull(dat)) {
                dat1 = GetJsonAtrrObjectStringValue(data.get("name_surname"));
                if (!isEmptyOrNull(floor)) {
                    res=res+"&parcels[" + j + "][comments]=" + dat1 + " " + "Stāvs:  + floor";
                } else {
                    res=res+"&parcels[" + j + "][comments]=" + dat1;
                }
            } else {
                dat1 = GetJsonAtrrObjectStringValue(data.get("name_surname"));
                if (!isEmptyOrNull(floor)) {
                    res=res+"&parcels[" + j + "][comments]=" + dat1 + " " + "Stāvs:  + floor";
                } else {
                    res=res+"&parcels[" + j + "][comments]=" + dat1;
                }
            }
            dat = GetJsonAtrrObjectStringValue(data.get("DeliveryType"));
            if ("Courier".equalsIgnoreCase(dat)) {
                res=res+"&parcels[" + j + "][delivery_priority]=X1";

                dat1 = GetJsonAtrrObjectStringValue(data.get("DoorDelivery"));
                if ("true".equalsIgnoreCase(dat1)) {
                    res=res+"&parcels[" + j + "][carry_assist]=1";
                } else {
                    res=res+"&parcels[" + j + "][carry_assist]=0";
                }
            }
            dat = GetJsonAtrrObjectStringValue(data.get("DeliveryMode"));
            if ("LV Pasts Parcel machines".equalsIgnoreCase(dat)) {
                dat1 = GetJsonAtrrObjectStringValue(data.get("PickUpId"));
                res=res+"&parcels[" + j + "][station_id]=" + dat1;
            }

            if ("PickUp points \"Latvijas pasts\" branche".equalsIgnoreCase(dat)) {
                res=res+"&parcels[" + j + "][pickup]=1";

                dat1 = GetJsonAtrrObjectStringValue(data.get("PickUpId"));
                res=res+"&parcels[" + j + "][pickup_zipcode]=" + dat1;
            }

            res=res+"&parcels[" + j + "][sms_invite]=1";

        }

        return res;
    }

    private static String FormatPhoneNumber(String nr) {
        if (nr.contains("+")) {
            return nr.substring(4).trim();
        }
        return nr;
    }

    private static String GetJsonAtrrObjectStringValue(Object objvalue) {
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
        } else if (objvalue instanceof JSONObject) {
            valToXml = "";
        } else {
            valToXml = ((String) objvalue).toString();
        }

        return valToXml;
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }
}
