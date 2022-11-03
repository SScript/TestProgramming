package com.VID;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Tools {
    public static String getCreatedTime(final Date pStsDate) {
        Calendar calendarNow = Calendar.getInstance();
        if (pStsDate != null) {
            calendarNow.setTime(pStsDate);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'");
        String day = sdf.format(calendarNow.getTime());
        calendarNow.set(0, 0, 0);
        SimpleDateFormat zulu = new SimpleDateFormat("HH:mm:ss.SSS'Z'");
        return day + zulu.format(calendarNow.getTime());
    }

    public static String getExpiresTime(final Date pStsDate) {
        Calendar calendarNow = Calendar.getInstance();
        if (pStsDate != null) {
            calendarNow.setTime(pStsDate);
        }

        calendarNow.add(Calendar.MINUTE, 5);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'");
        String day = sdf.format(calendarNow.getTime());
        calendarNow.set(0, 0, 0);
        SimpleDateFormat zulu = new SimpleDateFormat("HH:mm:ss.SSS'Z'");
        return day + zulu.format(calendarNow.getTime());
    }
}
