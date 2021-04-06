package com.teststuffs.teststuffs;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class TestIsFlag {
    public static void main(String[] args) throws Exception {
        String STATUS = "EKS";
        String STOPDATE = "01.02.2020 01:01";
        
        String isFlagActive = "";
        
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String formattedString = localDate.format(formatter);
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");

        Boolean dcompare = false;
        if (!isEmptyOrNull(STOPDATE)) {
            STOPDATE = STOPDATE.substring(0, 10);
            System.out.println(STOPDATE);
            Date date1 = format.parse(STOPDATE);
            Date date2 = format.parse(formattedString);
            dcompare = date1.compareTo(date2) > 0;
        }

        if ( 
                (
                    STATUS.equals("EKS") || STATUS.equals("LTE") 
                ) 
                
                && ( (isEmptyOrNull(STOPDATE)) || (dcompare) ) 
           ) {
            isFlagActive = "Y";
        } else {
            isFlagActive = "N";
        }
        
        System.out.println(isFlagActive);
    }
    
    public static boolean isEmptyOrNull(String str) {
      if (null == str || (null != str && str.trim().equals(""))) {
        return true;
      }
      
      return false;
    }    
}
