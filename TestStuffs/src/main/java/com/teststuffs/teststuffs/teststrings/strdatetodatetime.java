package com.teststuffs.teststuffs.teststrings;


public class strdatetodatetime {

    public static void main(String[] args) {
        
        //2020-07-15 10:00:00   "13/11/2020"
        
        String aa = "2020-08-05T14:00:39.000Z";
        System.out.println(aa.charAt(4));
        String s = String.valueOf(aa.charAt(4));
        if ("-".equals(s)) {
            String dd1 = aa.substring(8,10);
            String mm1 = aa.substring(5,7);
            String yy1 = aa.substring(0,4);
            System.out.println(dd1 + "." + mm1 + "." + yy1);
        } 
        //else {
            String aa1 = "13/11/2020";
            s = String.valueOf(aa1.charAt(2));
            System.out.println(s);
            if ("/".equals(s)) {
                String dd11 = aa1.substring(0,2);
                String mm11 = aa1.substring(3,5);
                String yy11 = aa1.substring(6,10);
                System.out.println(dd11 + "." + mm11 + "." + yy11);
            }
        //}
    }

    public static String valueOf(Object obj) {
        return (obj == null) ? "null" : obj.toString();
    }
}
