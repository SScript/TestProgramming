import org.json.*;
import org.json.XML;

public class TestFormatReachData1 {
    public static void main(String[] args) {
        String jsonDataStr = "{\n" +
                "    \"SendAttachmentsToReachRequest\": {\n" +
                "        \"xmlns:wsdl\": \"http://schemas.xmlsoap.org/wsdl/\",\n" +
                "        \"xmlns:ns1\": \"urn:oasis:names:tc:xacml:2.0:context:schema:cd:04\",\n" +
                "        \"xmlns:ns2\": \"http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2\",\n" +
                "        \"xmlns:client\": \"http://xmlns.oracle.com/DigitalTransformation/SendAttachmentsToReachProvABCSImpl/SendAttachmentsToReachProvABCSImpl\",\n" +
                "        \"xmlns:plnk\": \"http://docs.oasis-open.org/wsbpel/2.0/plnktype\",\n" +
                "        \"xmlns:ns5\": \"http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2\",\n" +
                "        \"xmlns:ns3\": \"http://schemas.xmlsoap.org/ws/2003/03/addressing\",\n" +
                "        \"BillingAccountNumber\": \"AAAA11110000\",\n" +
                "        \"xmlns:ns4\": \"urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04\",\n" +
                "        \"Files\": {\n" +
                "            \"File\": [{\n" +
                "                    \"FileContent\": \"dfhsr6jr6jdrt67jkdt7k\",\n" +
                "                    \"FileName\": \"a.pdf\"\n" +
                "                }, {\n" +
                "                    \"FileContent\": \"sgjhdfgjjh54656fjfgj65j67\",\n" +
                "                    \"FileName\": \"b.pdf\"\n" +
                "                }\n" +
                "            ]\n" +
                "        },\n" +
                "        \"CustomerNo\": 1111111,\n" +
                "        \"EmailAddress\": \"a@a.lv\"\n" +
                "    }\n" +
                "}\n";


        JSONObject jsonData = new JSONObject(jsonDataStr);
        JSONObject obj = jsonData.getJSONObject("SendAttachmentsToReachRequest");
        JSONObject objfiles = jsonData.getJSONObject("SendAttachmentsToReachRequest").getJSONObject("Files");
        Object orderdataitems_o;
        JSONArray datatems = null;
        try {
            orderdataitems_o = objfiles.get("File");
            if (orderdataitems_o instanceof JSONArray) {
                datatems = (JSONArray) orderdataitems_o;
            }
            if (orderdataitems_o instanceof JSONObject) {
                datatems = new JSONArray();
                datatems.put(orderdataitems_o);
            }
        } catch (Exception e) {
        }
        int itemc = datatems.length();
        System.out.println(itemc);
        JSONObject d = null;
        JSONArray resjsonobj = new JSONArray();
        for (int i = 0; i < itemc; i++) {
            d = datatems.getJSONObject(i);
            resjsonobj.put(
               new JSONObject()
                       .put("custno", GetJsonObjectStringValue(obj.get("CustomerNo")))
                       .put("billingaccountno", obj.getString("BillingAccountNumber"))
                       .put("documentname", d.getString("FileName"))
                       .put("additionaldoc", d.getString("FileContent"))
                       .put("caller", "Siebel")
            );
        }
        System.out.println(resjsonobj.toString());

    }

    private static String GetJsonObjectStringValue(Object objvalue) {
        String valToXml = "";
        try {
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
        } catch (Exception e) {
            valToXml = "";
        }

        return valToXml;
    }
}
