package com.reach;

import java.io.*;
import java.nio.charset.Charset;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class ProcessJsonDataReachRun {

    

    public static void main(String[] args) throws Exception {

        //FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonreach3CASE.json"); // Case
        //FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonReachOnlyOrder.json"); // order
        String filename = "TestFilterVisitNeed.json";
        //FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/" + filename); // order
        FileInputStream fis =
                new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonsamples/" + filename); // order
        
        String longJsonString = IOUtils.toString(fis, "UTF-8");
        
        //ProcessJsonDataReach_2 p1 = new ProcessJsonDataReach_2();
        ProcessJsonDataReach p2 = new ProcessJsonDataReach();
        //Resp res1;
        Resp res2;
        //res1 = p1.ProcessJsonData(longJsonString);
        res2 = p2.ProcessJsonData(longJsonString);
        
        //System.out.println(res1.RetXmlStr);
        System.out.println(res2.RetXmlStr);
        System.out.println("");
        System.out.println(res2.RetXmlStr2th);
        //System.out.println(res1.RetError);
        System.out.println(res2.RetError);
        
        //FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonreach3CASERes.xml"), res.RetXmlStr, Charset.forName("UTF-8"));
        //FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/" + filename + "Res2.xml"),
        //        res1.RetXmlStr, Charset.forName("UTF-8"));
        FileUtils.writeStringToFile(new File("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/reach/jsonsamples/" + filename + ".xml"),
                res2.RetXmlStr, Charset.forName("UTF-8"));
        
    }
}
