/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.teststuffs.teststuffs.testdates;

/**
 *
 * @author gatis.braucs
 */
public class TestDates_2 {
    public static void main(String[] args) {
        String val1 =  "2020-07-15 10:00:00";
        String val2 =  "15/07/2020 10:00:00";
        String val3 =  "2022-07-28";
        String val4 =  "15/07/2020";

        System.out.println(FormatDate(val1));
        System.out.println(FormatDate(val2));
        System.out.println(FormatDate(val3));
        System.out.println(FormatDate(val4));

    }

    public static String FormatDate(String d) {
        // var ienākt:
        // ir   -> 2020-07-15 10:00:00
        // vai -> 15/07/2020 10:00:00
        // vai -> 2022-07-28
        // vai -> 15/07/2020
        String[] splitted;
        String[] splitted2;
        String val = "";
        if (!isEmptyOrNull(d)) {
            if (d.contains("-")) {
                splitted = d.split("-");
                if (splitted[2].length() == 1) {
                    val = "0" + splitted[2];
                } else {
                    splitted2 = splitted[2].split(" ");
                    val = splitted2[0];
                }
                return ((val.length() == 1 ? "0" + val : val) +
                        "." + (splitted[1].length() == 1 ? "0" + splitted[1] : splitted[1]) +
                        "." + splitted[0]);
            } else {
                if (d.contains("/")) {
                    splitted = d.split("/");
                    if (splitted[2].length() == 4) {
                        val = splitted[2];
                    } else {
                        splitted2 = splitted[2].split(" ");
                        val = splitted2[0].length() == 2 ?  "20" + splitted2[0] : splitted2[0];
                    }
                    return (splitted[0].length() == 1 ? "0" + splitted[0] : splitted[0]) +
                            "." + (splitted[1].length() == 1 ?  "0" + splitted[1] : splitted[1]) +
                            "." + val;
                } else {
                    return "";
                }
            }
        } else {
            return "";
        }
    }

    public static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }

        return false;
    }
}
