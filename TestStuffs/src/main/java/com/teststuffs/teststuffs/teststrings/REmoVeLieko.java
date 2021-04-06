
package com.teststuffs.teststuffs.teststrings;

//
public class REmoVeLieko {
    public static void main(String[] args) {
    
    String a = "<ResultCode xmlns=\"http://xmlns.oracle.com/EnterpriseObjects/Industry/Communications/EBO/ListOfOrder/V1\">SOA_154[001]</ResultCode>";
    a = a.substring(a.indexOf(">")+1,a.length());
    a = a.substring(0,a.indexOf("<"));
    System.out.println(a);
    
    }
}
