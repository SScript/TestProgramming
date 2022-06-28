package com.teststuffs.teststuffs.teststrings;

public class TestStringQuates {

    public static void main(String[] args) throws Exception {
        String s = "Dell Vostro 14 3400 14'' Black N6006VN3400EMEA01_2201H";

        s = s.replace("''", "\''''");

        System.out.println(s);
    }

}
