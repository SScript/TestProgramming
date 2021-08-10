package com.teststuffs.teststuffs;

import java.io.Console;

public class TestRnd {
    public static void main(String[] args) throws Exception {
        int min = 1;
        int max = 9;
        System.out.println(GenNumber(4));
    }

    private static String GenNumber(int numCount) {
        int min = 1;
        int max = 9;
        String res = "";
        for (int i = 0; i < numCount; i++) {
            //res = res + (int)Math.floor(Math.random() * (max - min + 1)) + min;
            res = res + (int)Math.floor(Math.random()*(max-min+1)+min);
            System.out.println(res);
        }
        return res;
    }
}
