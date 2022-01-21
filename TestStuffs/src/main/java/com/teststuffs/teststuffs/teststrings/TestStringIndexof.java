package com.teststuffs.teststuffs.teststrings;

public class TestStringIndexof {

    public static void main(String[] args) throws Exception {
        String parcelIdval = "asdf,gsd,gsg1";
        parcelIdval = parcelIdval.contains(",") ? parcelIdval.substring(0, parcelIdval.indexOf(',')) : parcelIdval;

        System.out.println(parcelIdval);
    }



}
