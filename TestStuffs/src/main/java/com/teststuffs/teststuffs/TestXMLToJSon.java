package com.teststuffs.teststuffs;

import org.json.JSONObject;
import org.json.XML;

public class TestXMLToJSon {
	
	public static void main(String[] args) {
		String xmlDataStr = 
			"<ban:bankStatement>\n" +
"            <ban:Header>\n" +
"               <ban:HEADERID>1000445557</ban:HEADERID>\n" +
"               <ban:BANKCODE>UNLA</ban:BANKCODE>\n" +
"               <ban:STARTDATE>2019-11-11</ban:STARTDATE>\n" +
"               <ban:ENDDATE>2019-11-11</ban:ENDDATE>\n" +
"               <ban:PREPDATE>2019-11-12</ban:PREPDATE>\n" +
"               <ban:TIMEOFCREATION>2019-11-12T07:25:50</ban:TIMEOFCREATION>\n" +
"               <ban:BANKACCNO>LV71UNLA0050023315366</ban:BANKACCNO>\n" +
"               <ban:CURRENCY>EUR</ban:CURRENCY>\n" +
"               <ban:OPENBAL>0.00</ban:OPENBAL>\n" +
"               <ban:CLOSEBAL>0.00</ban:CLOSEBAL>\n" +
"               <ban:TURNOVERPLUS>1213.76</ban:TURNOVERPLUS>\n" +
"               <ban:TURNOVERMINUS>-1213.76</ban:TURNOVERMINUS>\n" +
"               <ban:PROCESS_FLAG>0</ban:PROCESS_FLAG>\n" +
"               <ban:GROUPID_REQUIRED>0</ban:GROUPID_REQUIRED>\n" +
"               <ban:APPROVED>1</ban:APPROVED>\n" +
"            </ban:Header>\n" +
"            <ban:Statement target_system=\"UNICORN\">\n" +
"               <ban:Transaction>\n" +
"                  <ban:MANDT>?</ban:MANDT>\n" +
"                  <ban:PAYMENTID>0269091238</ban:PAYMENTID>\n" +
"                  <ban:TRANSACTIONTYPE>POI</ban:TRANSACTIONTYPE>\n" +
"                  <ban:BOOKDATE>2019-11-11</ban:BOOKDATE>\n" +
"                  <ban:REGDATE>2019-11-11</ban:REGDATE>\n" +
"                  <ban:BANKREF>RO588387391L02</ban:BANKREF>\n" +
"                  <ban:REFNUMBER/>\n" +
"                  <ban:CORD>C</ban:CORD>\n" +
"                  <ban:AMOUNT>1072.27</ban:AMOUNT>\n" +
"                  <ban:DETAILS>Karšu darījumi</ban:DETAILS>\n" +
"                  <ban:PAYERACC>LV45UNLA0050024720685</ban:PAYERACC>\n" +
"                  <ban:PAYERNAME>SIA TET</ban:PAYERNAME>\n" +
"                  <ban:PAYERLEGALID>40003052786</ban:PAYERLEGALID>\n" +
"                  <ban:PAYERBANKCODE>UNLALV2X</ban:PAYERBANKCODE>\n" +
"                  <ban:CURRENCY>EUR</ban:CURRENCY>\n" +
"                  <ban:DOCNO>RO588387391L02</ban:DOCNO>\n" +
"                  <ban:CANCEL_FLAG>0</ban:CANCEL_FLAG>\n" +
"                  <ban:MODBY>SAPPI_AGENT</ban:MODBY>\n" +
"                  <ban:GROUPIDNAME>?</ban:GROUPIDNAME>\n" +
"                  <ban:MD5_DIGEST>?</ban:MD5_DIGEST>\n" +
"               </ban:Transaction>\n" +
"            </ban:Statement>\n" +
"         </ban:bankStatement>";
		
	JSONObject jsonData = XML.toJSONObject(xmlDataStr);
            String rootElement = "ban:bankStatement";
            String msg = "";
            
            if (jsonData.optJSONArray(rootElement)!=null) {
                msg = jsonData.optJSONArray(rootElement).toString();
            }
            else if (jsonData.optJSONObject(rootElement)!=null) {
                msg = jsonData.optJSONObject(rootElement).toString();
            }
			msg=msg.replaceAll("ban:Transaction\"\\:(\\{.*?\\})","ban:Transaction\"\\:\\[$1\\]");
			
		System.out.println(msg);
		
		
	}
}
