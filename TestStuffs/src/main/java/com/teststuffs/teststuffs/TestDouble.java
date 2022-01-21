package com.teststuffs.teststuffs;

public class TestDouble {

    public static void main(String[] args) throws Exception {

        Double d1 = new Double("1.5");
        Double d2 = new Double("5");
        Double d3 = new Double("6.5");

        System.out.println(d1.compareTo(Double.valueOf("5")));
        System.out.println(d2.compareTo(Double.valueOf("5")));
        System.out.println(d3.compareTo(Double.valueOf("5")));

        System.out.println(String.valueOf(true));
    }
}
