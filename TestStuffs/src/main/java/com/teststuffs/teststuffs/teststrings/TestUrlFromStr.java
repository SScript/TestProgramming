package com.teststuffs.teststuffs.teststrings;

import java.net.*;

public class TestUrlFromStr {
    public static void main(String[] args) throws Exception {
    
        String ep = "https://devsprint20--tetst.my.salesforce.com/services/apexrest/vlocity_cmt/v1/integrationprocedure/teT_CeaseRequest";
        String newurl = ep.replaceAll(" ", "%20");
        URL url = new URL(newurl);
                
        System.out.println("OK");
        
    }
}
