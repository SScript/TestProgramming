package com.teststuffs.teststuffs.teststrings;

import java.util.Arrays;
import java.util.List;

public class TestStringTolistandContain {

    public static void main(String[] args) throws Exception {
        String s = "T1,T2,R1";
        List<String> ignoredtatuses = Arrays.asList(s.split(",", -1));
        System.out.println(!ignoredtatuses.contains("T1"));
        System.out.println(!ignoredtatuses.contains("A1"));

    }
}
