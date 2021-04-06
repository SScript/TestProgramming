package com.reach;

import java.io.*;
import java.nio.charset.Charset;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class ProcessJsonDataReachRun {

    

    public static void main(String[] args) throws Exception {

        //FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonreach3CASE.json"); // Case
        //FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonReachOnlyOrder.json"); // order
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonreachELE.json"); // order
        
        String longJsonString = IOUtils.toString(fis, "UTF-8");
        
        ProcessJsonDataReach p = new ProcessJsonDataReach();
        Resp res;
        
        res = p.ProcessJsonData(longJsonString);
        
        System.out.println(res.RetXmlStr);
        System.out.println(res.RetError);
        
        //FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonreach3CASERes.xml"), res.RetXmlStr, Charset.forName("UTF-8"));
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonreachELERes.xml"), res.RetXmlStr, Charset.forName("UTF-8"));
        
    }
}
