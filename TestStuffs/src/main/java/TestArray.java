import org.json.JSONArray;
import org.json.JSONObject;

public class TestArray {
    public static void main(String[] args) throws Exception {
        String d = "[{\n" +
                "\"event\": \"TN001\",\n" +
                "\"date\": \"2013-05-07 07:45:05\"\n" +
                "}]";
        Object o =  new JSONArray(d);

        if (o instanceof JSONArray) {
            System.out.println(o.toString());
        }
        if (o instanceof JSONObject) {
            System.out.println(o.toString());
        }


    }






}
