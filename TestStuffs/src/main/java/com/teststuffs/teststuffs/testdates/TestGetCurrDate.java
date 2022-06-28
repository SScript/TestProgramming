package com.teststuffs.teststuffs.testdates;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestGetCurrDate {

    public static void main(String[] args) {

        Date date = new Date();

        String dateFormatString = "dd.MM.yyyy";
        DateFormat dateFormat = new SimpleDateFormat(dateFormatString);
        String currentDate = dateFormat.format(date);
        System.out.println(currentDate.toString());


    }
}
