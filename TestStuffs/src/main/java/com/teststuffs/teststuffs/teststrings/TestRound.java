package com.teststuffs.teststuffs.teststrings;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class TestRound {
    public static void main(String[] args) throws Exception {

        BigDecimal b = new BigDecimal(10);
        System.out.println(b);
        BigDecimal v = new BigDecimal(21);
        System.out.println(v);
        String s = "1." + v;
        //v = v.add(new BigDecimal(v);
        System.out.println(s);
        v = new BigDecimal(s);
        System.out.println(v);


        b = b.divide(v, 2, RoundingMode.HALF_UP);
        System.out.println(b.toString());
        System.out.println(String.format("%.2f", b)); // float dod ar komatu
    }


}
