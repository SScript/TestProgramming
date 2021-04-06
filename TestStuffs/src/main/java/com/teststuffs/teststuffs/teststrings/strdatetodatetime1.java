package com.teststuffs.teststuffs.teststrings;

import java.time.*;
import java.time.format.*;


public class strdatetodatetime1 {

    public static void main(String[] args) throws Exception {
        
        String aa1 = "15.15.2020";
        String dd11 = aa1.substring(8,10);
        String mm11 = aa1.substring(5,7);
        String yy11 = aa1.substring(0,4);
        System.out.println(dd11 + "/" + mm11 + "/" + yy11);
        
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate dateTime = LocalDate.parse(aa1, formatter);
        } catch (Exception e) {
            throw new Exception("Incorect date format");
        }
    }

    public static String valueOf(Object obj) {
        return (obj == null) ? "null" : obj.toString();
    }
}
