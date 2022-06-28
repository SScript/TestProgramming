package com.ProductCatalog;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.zip.*;

public class TestReadLogFile {

    public static void main(String[] args) throws Exception {
        String dir = "C:\\TestProgramming\\TestProgramming\\TestStuffs\\src\\main\\java\\com\\ProductCatalog\\";
        String fileName = "2022-05-16_1.log";

        File file = new File(dir + fileName);
        File file1 = new File(dir + "done_" + fileName);

        FileOutputStream fos = new FileOutputStream(dir + fileName);
        ZipOutputStream zipOut = new ZipOutputStream(fos);

        try {
            Scanner scanner = new Scanner(file);

            int lineNum = 0;
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                lineNum++;

                if (!line.contains("INVOKE-200") && line.contains("errorCode")) {
                    System.out.println("ho hum, i found error it on line " + lineNum);

                    File fileToZip = new File(dir + fileName);
                    FileInputStream fis = new FileInputStream(fileToZip);
                    ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
                    zipOut.putNextEntry(zipEntry);
                    byte[] bytes = new byte[1024];
                    int length;
                    while((length = fis.read(bytes)) >= 0) {
                        zipOut.write(bytes, 0, length);
                    }
                    zipOut.close();
                    fis.close();
                    fos.close();

                    // ja atrod, tad nav vajadzības turpināt
                    break;
                }
            }

            // rename file
            scanner.close();
            boolean flag = file.renameTo(file1);
            if (flag == true) {
                System.out.println("File Successfully Rename");
            }
            // if renameTo() return false then else block is
            // executed
            else {
                System.out.println("Operation Failed");
            }

            Path path = Paths.get(dir + "LogFilesWithErrors.zip");
            File file2 = new File(dir + "LogFilesWithErrors.zip");
            //ByteArrayOutputStream b = new ByteArrayOutputStream();

            byte[] fileContent = Files.readAllBytes(path);
            try (FileOutputStream fos1 = new FileOutputStream(dir + "LogFilesWithErrors1.zip")) {
                fos1.write(fileContent);
            }

        } catch(FileNotFoundException e) {
            //handle this
        }


    }

}
