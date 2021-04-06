package com.teststuffs.teststuffs.testdates;


public class strdatetodate_1 {

    public static void main(String[] args) {
        
        String aa = "2020-08-05T14:00:39";
        String dd1 = aa.substring(8,10);
        String mm1 = aa.substring(5,7);
        String yy1 = aa.substring(0,4);
        String time = aa.substring(11,19);
        System.out.println(dd1 + "/" + mm1 + "/" + yy1 + " " + time);
        
        String aa1 = "2020-07-15";
        String dd11 = aa1.substring(8,10);
        String mm11 = aa1.substring(5,7);
        String yy11 = aa1.substring(0,4);
        System.out.println(dd11 + "/" + mm11 + "/" + yy11);
        
        
        
        String aaa = "2020-08-05T14:00:39";
        String yy12 = aaa.substring(0,10);
        String time12 = aaa.substring(11,19);
        System.out.println(yy12);
        System.out.println(time12);


        
    }

    public static String valueOf(Object obj) {
        return (obj == null) ? "null" : obj.toString();
    }
}
