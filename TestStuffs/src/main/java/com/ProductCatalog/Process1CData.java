package com.ProductCatalog;

import org.apache.commons.io.IOUtils;

import java.io.FileInputStream;

public class Process1CData {

    public static void main(String[] args) throws Exception {
        FileInputStream fis = new FileInputStream("C:/TestProgramming/TestProgramming/TestStuffs/src/main/java/com/ProductCatalog/indata.json");
        String jsonDataStr = IOUtils.toString(fis, "UTF-8");


        call1C.saveToDB(jsonDataStr);



    }
}
