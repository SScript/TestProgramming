package com.testjson;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.json.XMLParserConfiguration;

public class TestXMLToJSon_1 {
	
    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/testjson/TEstXMLToJSON_2.xml");
        String xmlDataStr = IOUtils.toString(fis, "UTF-8");
        xmlDataStr = xmlDataStr.replaceAll("tns:", "");

        JSONObject jsonData = XML.toJSONObject(xmlDataStr);
        JSONObject newJsonData = new JSONObject();

        JSONObject dat = jsonData.getJSONObject("updateServiceAttributesCrossRequestEBM")
                .getJSONObject("DataArea")
                .getJSONObject("updateServiceAttributesCrossRequest");

        newJsonData.put("Requester", dat.getString("Requester"));
        newJsonData.put("serviceNumber", dat.getString("serviceNumber"));
        newJsonData.put("projectName", dat.getString("projectName"));

        Object o = null;
        JSONArray ar = null;
        try {
            o = dat.get("parameters");
            if (o instanceof JSONArray) {
                ar = (JSONArray) o;
            }
            if (o instanceof JSONObject) {
                ar = new JSONArray();
                ar.put(o);
            }
            newJsonData.put("parameters", ar);
        } catch (Exception e) {

        }


        System.out.println(jsonData.toString());
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/testjson/TEstXMLToJSON_2.json"),
                newJsonData.toString(), Charset.forName("UTF-8"));

    }
}
