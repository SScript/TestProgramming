import org.json.*;

public class Json2xwwwformurlencoded {
    public static void main(String[] args) throws Exception {
        String jsondata = "{\n" +
                "\"secret\": \"SECRET-KEY\",\n" +
                "\"parcels\": [\n" +
                "{\n" +
                "\"type\": \"Ie\",\n" +
                "\"multiparcel\": 1,\n" +
                "\"group_uid\": \"MY-GROUP-1\",\n" +
                "\"name_surname\": \"Aina Priede\",\n" +
                "\"city\": \"Rīga\",\n" +
                "\"street\": \"Ziemeļu iela\",\n" +
                "\"house\": \"2\",\n" +
                "\"zipcode\": \"LV-1000\",\n" +
                "\"phone\": \"22222222\",\n" +
                "\"country_id\": 7,\n" +
                "\"pickup\": 1,\n" +
                "\"pickup_zipcode\": \"LV-1044\",\n" +
                "\"sms_invite\": 1,\n" +
                "\"insured\": 1,\n" +
                "\"insurance_sum\": 23.89,\n" +
                "\"post_payment\": 1,\n" +
                "\"post_payment_sum\": 23.89,\n" +
                "\"post_payment_aim\": \"Pēcmaksa\",\n" +
                "}, {\n" +
                "\"type\": \"Ie\",\n" +
                "\"multiparcel\": 1,\n" +
                "\"group_uid\": \"MY-GROUP-1\",\n" +
                "\"name_surname\": \"Aina Priede\",\n" +
                "\"city\": \"Rīga\",\n" +
                "\"street\": \"Ziemeļu iela\",\n" +
                "\"house\": \"2\",\n" +
                "\"zipcode\": \"LV-1000\",\n" +
                "\"phone\": \"22222222\",\n" +
                "\"country_id\": 7,\n" +
                "\"pickup\": 1,\n" +
                "\"pickup_zipcode\": \"LV-1044\",\n" +
                "\"sms_invite\": 1\n" +
                "}\n" +
                "]\n" +
                "}";

        String res = jsonToURLEncoding(new JSONObject(jsondata));
        System.out.println(res);

        String ar = "[\n" +
                "\"CE100005322LV\",\n" +
                "\"CE100005324LV\",\n" +
                "\"CE100005326LV\",\n" +
                "\"CE100005328LV\"\n" +
                "]";
        JSONObject d = new JSONObject();
        JSONArray o = new JSONArray(ar);
        d.put("secret", "secret").put("size", "150x100").put("parcels", o);
        System.out.println(d.toString());
        System.out.println(jsonToURLEncoding(d));
    }

    public static String jsonToURLEncoding(JSONObject json) {
        String output = "";
        String[] keys = JSONObject.getNames(json);
        for (String currKey : keys)
            output += jsonToURLEncodingAux(json.get(currKey), currKey);

        return output.substring(0, output.length()-1);
    }

    private static String jsonToURLEncodingAux(Object json, String prefix) {
        String output = "";
        if (json instanceof JSONObject) {
            JSONObject obj = (JSONObject)json;
            String[] keys = JSONObject.getNames(obj);
            for (String currKey : keys) {
                String subPrefix = prefix + "[" + currKey + "]";
                output += jsonToURLEncodingAux(obj.get(currKey), subPrefix);
            }
        } else if (json instanceof JSONArray) {
            JSONArray jsonArr = (JSONArray) json;
            int arrLen = jsonArr.length();

            for (int i = 0; i < arrLen; i++) {
                String subPrefix = prefix + "[" + i + "]";
                Object child = jsonArr.get(i);
                output += jsonToURLEncodingAux(child, subPrefix);
            }
        } else {
            output = prefix + "=" + json.toString() + "&";
        }

        return output;
    }

}
