package com.teststuffs.teststuffs.teststrings;

public class TestTrim {
    public static void main(String[] args) throws Exception {
    
        //System.out.println(" AAA BBB CCC ".replaceAll("\\s",""));
        String s = "111111-1";
        System.out.println(s.substring(0, s.indexOf("-")));
        
    }
}
