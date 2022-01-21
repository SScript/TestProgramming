package com.teststuffs.teststuffs;

public class UrlDecode {

    public static void main(String[] args) throws Exception {
        String url = "%7B%0A%20%22secret%22%3A%22SECRET-KEY%22%2C%0A%20%22applications%22%3A%7B%0A%20%20%20%20%22My-ID-792376%22%3A%7B%0A%20%20%20%20%20%20%20%20%22when%22%3A%20%222019-11-29%22%2C%0A%20%20%20%20%20%20%20%20%22time_from%22%3A%20%2213%3A08%22%2C%0A%20%20%20%20%20%20%20%20%22time_to%22%3A%20%2218%3A00%22%2C%0A%20%20%20%20%20%20%20%20%22phone%22%3A%20%2222222222%22%2C%0A%20%20%20%20%20%20%20%20%22email%22%3A%20%22abc%40pasts.lv%22%2C%0A%20%20%20%20%20%20%20%20%22address%22%3A%20%22Zieme%C4%BCu%20iela%2010%2C%20Lidosta%22%2C%0A%20%20%20%20%20%20%20%20%22pallet_count%22%3A%20%220%22%2C%0A%20%20%20%20%20%20%20%20%22parcel_count%22%3A%20%220%22%2C%0A%20%20%20%20%20%20%20%20%22transport%22%3A%20%22Vieglais%20kravas%20buss%22%2C%0A%20%20%20%20%20%20%20%20%22comments%22%3A%20%22Koment%C4%81ri%22%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%7D%0A%7D";

        try {
            String result = java.net.URLDecoder.decode(url, "UTF-8");
            System.out.println(result);
        } catch (Exception e) {
            // not going to happen - value came from JDK's own StandardCharsets
        }

    }
}
