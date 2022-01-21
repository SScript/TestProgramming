package com.teststuffs.teststuffs.teststrings;

public class testSB {

    public static void main(String[] args) {
        StringBuffer response = new StringBuffer();
        
        response.append("aa");
        response.append("aa");
        
        System.out.println(response.toString());
        System.out.println(response.toString());

    }

    public static String valueOf(Object obj) {
        return (obj == null) ? "null" : obj.toString();
    }
}
