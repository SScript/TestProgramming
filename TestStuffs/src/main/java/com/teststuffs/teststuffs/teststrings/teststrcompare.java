package com.teststuffs.teststuffs.teststrings;

public class teststrcompare {

    public static void main(String[] args) {
        String Method = "All";
        //if ("All".compareTo(Method) == 0) {
//        if ("All".equals(Method)) {
//            System.out.println("All");
//        } else {
//            System.out.println("Price");
//        }

        System.out.println(String.valueOf((Object) null));
        System.out.println(String.valueOf((Object) "aa"));
        System.out.println(String.valueOf((Object) 111));
    }

    public static String valueOf(Object obj) {
        return (obj == null) ? "null" : obj.toString();
    }
}
