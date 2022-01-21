package com.teststuffs.teststuffs.testpdf;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import org.json.*;

public class pdftobase64 {
    public static void main(String[] args) throws Exception {

        //String filePath = "C:\\TestProgramming\\TestProgramming\\TestStuffs\\src\\main\\java\\com\\teststuffs\\teststuffs\\testpdf\\";
        String filePath = "C:\\Tmp\\";
        String originalFileName = "test.pdf";
        String newFileName = "test1.pdf";

        byte[] input_file = Files.readAllBytes(Paths.get(filePath + originalFileName));

        //byte[] encodedBytes = Base64.getEncoder().encode(input_file);

        String encodedString = new String(input_file);
        byte[] decodedBytes = Base64.getDecoder().decode(input_file);

        FileOutputStream fos = new FileOutputStream(filePath + newFileName);
        fos.write(decodedBytes);
        fos.flush();
        fos.close();

    }
}
