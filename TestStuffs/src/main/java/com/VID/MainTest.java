package com.VID;

import java.security.*;
import java.util.*;

import javax.xml.ws.*;
import javax.xml.ws.handler.Handler;

public class MainTest {

    private static final String STS_URL = "https://127.0.0.1:5667/adfs/services/trust/13/certificatemixed";
    private static final String DESTINATION_CIBSVC_URL = "https://rixvidissweb1a.internal.corp:6443/CIBWS/GetTaxPayersIncomeSvc";
    //private static final String DESTINATION_CIBSVC_URL = "https://toag.vid.gov.lv/AccReg/1-0/GetAccountBySync ";
    private static final String DESTINATION_ECHO_URL = "";
    //private static  final String PFX_FILE = "C:\\TestProgramming\\TestProgramming\\TestStuffs\\src\\main\\java\\com\\VID\\User_NIS95LicPVNUs1_pk.pfx";
    private static  final String PFX_FILE = "C:\\TestProgramming\\TestProgramming\\TestStuffs\\src\\main\\java\\com\\VID\\cert.pfx";

    public static void main(String[] args) throws Exception {
        try {
            // start format calling
            boolean call_echo = false;
            String url = call_echo ? DESTINATION_ECHO_URL : DESTINATION_CIBSVC_URL;

            LoginRequest lr =
                    new X509LoginRequest(PFX_FILE, "le-user-f949d903-8f09-4c4c-95c9-3456c053506b", "Cert256vvvx".toCharArray(), url, STS_URL);
            SoapConnectionHandler cm = new SoapConnectionHandler(lr);
            System.out.println("Login start");
            cm.login();
            System.out.println("Login done");
            if (cm.isValid()) {
                System.err.println("login sucess");
                if (call_echo) {
                    //callEcho(url, cm);
                } else {
                    //callsvc(url, cm);
                }
            } else {
                System.err.println("error login");
            }


        } catch (Exception e) {
            System.err.println("error calling service:");
            e.printStackTrace();
        }
    }
}
