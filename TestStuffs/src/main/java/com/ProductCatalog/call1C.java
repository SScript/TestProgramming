package com.ProductCatalog;

import org.apache.poi.hpsf.Decimal;
import org.json.JSONArray;
import org.json.JSONObject;

import java.math.BigDecimal;
import java.sql.*;
import java.text.SimpleDateFormat;

public class call1C {


    public static void saveToDB(String data) throws Exception {
        Connection connection = null;
        PreparedStatement getNewBATCHID = null;
        PreparedStatement insertRecord = null;

        String accCodeList = "";
        String currAccCode = "";

        String insertProductStr = "Insert into SOA_CFG_OWNER.PCAT_PRODUCT " +
                "(ID,BATCH_ID,ACCOUNTING_CODE,NAME_LV,MPN,EAN,CATEGORY_NAME,BRAND_NAME,RESPONSIBLE_PERSON,SERVICE_CENTER," + //10
                "WARRANTY_LEGAL,WARRANTY_PRIVATE,AVAILABLE_ON_DEMAND,EOL,INACTIVE,PRODUCT_TYPE,SERIALIZABLE,CREATED," + // 8
                "NETTO_WEIGHT,BRUTTO_WEIGHT,REVERSE_VAT_APPLICABLE,REVERSE_VAT,DATATYPE,REFERENCE_ID)" + //6 = 24

                "values (PCAT_PRODUCT_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,?,?)";

        String insertPricetStr = "Insert into SOA_CFG_OWNER.PCAT_PRICE " +
                "(ID,BATCH_ID,ACCOUNTING_CODE,PRICE,PRICEBEFOREDISCOUNT," +
                "PROMOTION_DATE_FROM,PROMOTION_DATE_TO,PROMOTION_NAME," +
                "DATATYPE,REFERENCE_ID) " +
                "values (PCAT_PRICE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";

        int counter = 0;

        Long res;
        int aa;
        aa = Integer.valueOf("1");


        try {
            connection = DriverManager.getConnection("jdbc:oracle:thin:@soadbtst.telekom.lv:1521:SOAD", "SOA_CFG_OWNER", "tl$m3g_ra#w9");

            // VELOCITY_PCAT_BATCH_DATA_SEQ
            //getNewBATCHID = connection.prepareStatement("SELECT VELOCITY_PCAT_BATCH_DATA_SEQ.NEXTVAL as newid from dual");
            //ResultSet rs = null;
            //rs = getNewBATCHID.executeQuery();
            //rs.next();
            res = new Long(10727); //rs.getLong("newid");

            System.out.println("new id = " + res);

            JSONObject obj = new JSONObject(data);
            JSONObject itemdata = null;
            JSONArray datar = null;
            String val;

            Object a = obj.get("ProductList");
            if (a instanceof JSONArray) {
                datar = (JSONArray) a;
            }
            if (a instanceof JSONObject) {
                datar = new JSONArray();
                datar.put(a);
            }

            // ejam cauri produktiem
            if (datar != null) {
                int itemcount = datar.length();
                insertRecord = connection.prepareStatement(insertProductStr);
                for (int i = 0; i < itemcount; i++) {
                    itemdata = datar.getJSONObject(i);
                    currAccCode = GetJsonObjectStringValue(itemdata, "ProductID", false);

                    // ja nav jau bijis, tad insertojam
                    if (!accCodeList.contains(currAccCode)) {
                        counter++;
                        accCodeList = accCodeList + "," + currAccCode;

                        insertRecord.setLong(1, res);
                        insertRecord.setString(2, GetJsonObjectStringValue(itemdata, "ProductID", false));
                        insertRecord.setString(3, GetJsonObjectStringValue(itemdata, "ProductName", false));
                        insertRecord.setString(4, GetJsonObjectStringValue(itemdata, "ProductMPN", false));
                        insertRecord.setString(5, GetJsonObjectStringValue(itemdata, "EAN", false));
                        insertRecord.setString(6, GetJsonObjectStringValue(itemdata, "Category", false));
                        insertRecord.setString(7, GetJsonObjectStringValue(itemdata, "BrandName", false));
                        insertRecord.setString(8, GetJsonObjectStringValue(itemdata, "ResponsiblePerson", false));
                        insertRecord.setString(9, GetJsonObjectStringValue(itemdata, "ServiceCentre", false));
                        insertRecord.setString(10, GetJsonObjectStringValue(itemdata, "LegalPersonWarranty", false));
                        insertRecord.setString(11, GetJsonObjectStringValue(itemdata, "PrivatPersonWarranty", false));
                        insertRecord.setString(12, GetJsonObjectStringValue(itemdata, "AvailableOnDemand", false));
                        insertRecord.setString(13, GetJsonObjectStringValue(itemdata, "EOL", false));
                        insertRecord.setString(14, GetJsonObjectStringValue(itemdata, "Inactive", false));
                        insertRecord.setString(15, GetJsonObjectStringValue(itemdata, "ProductType", false));
                        insertRecord.setString(16, GetJsonObjectStringValue(itemdata, "Serializable", false));
                        // netoweight
                        val = GetJsonObjectStringValue(itemdata, "NettoWeight", false);
                        insertRecord.setDouble(17, isEmptyOrNull(val) ? null : new Double(val));
                        // BruttoWeigth
                        val = GetJsonObjectStringValue(itemdata, "BruttoWeigth", false);
                        insertRecord.setDouble(18, isEmptyOrNull(val) ? null : new Double(val));
                        insertRecord.setString(19, GetJsonObjectStringValue(itemdata, "ReverseVATapplicable", false));
                        // VATRate
                        val = GetJsonObjectStringValue(itemdata, "VATRate", false);
                        insertRecord.setDouble(20, isEmptyOrNull(val) ? null : new Double(val));
                        insertRecord.setString(21, GetJsonObjectStringValue(itemdata, "DataType", false));
                        insertRecord.setInt(22, counter);

                        insertRecord.addBatch();
                    }
                }
                // insert bulk
                insertRecord.executeBatch();
                connection.commit();
                System.out.println("done product list");
            }

            // --------------------------
            datar = null;
            a = obj.get("PriceList");
            if (a instanceof JSONArray) {
                datar = (JSONArray) a;
            }
            if (a instanceof JSONObject) {
                datar = new JSONArray();
                datar.put(a);
            }
            accCodeList = "";
            counter = 0;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");

            // ejam cauri cenām
            if (datar != null) {
                int itemcount = datar.length();
                insertRecord = connection.prepareStatement(insertPricetStr);
                for (int i = 0; i < itemcount; i++) {
                    itemdata = datar.getJSONObject(i);

                    currAccCode = GetJsonObjectStringValue(itemdata, "ProductID", false);

                    // ja nav jau bijis, tad insertojam
                    if (!accCodeList.contains(currAccCode)) {
                        counter++;
                        accCodeList = accCodeList + "," + currAccCode;

                        // batchid
                        insertRecord.setLong(1, res);
                        // productid
                        insertRecord.setString(2, GetJsonObjectStringValue(itemdata, "ProductID", false));
                        //price
                        val = GetJsonObjectStringValue(itemdata, "Price", false);
                        insertRecord.setDouble(3, isEmptyOrNull(val) ? null : new Double(val));
                        // pricebeforediscount
                        val = GetJsonObjectStringValue(itemdata, "PriceBeforeDiscount", false);
                        insertRecord.setDouble(4,  isEmptyOrNull(val) ? null : new Double(val));
                        // PromotionDateFrom
                        String aaa = GetJsonObjectStringValue(itemdata, "PromotionDateFrom", false);
                        if (!isEmptyOrNull(aaa)) {aaa =aaa.substring(0,10);}
                        insertRecord.setDate(5, isEmptyOrNull(aaa) ? null : java.sql.Date.valueOf(aaa));
                        // PromotionDateTo
                        aaa = GetJsonObjectStringValue(itemdata, "PromotionDateTo", false);
                        if (!isEmptyOrNull(aaa)) {aaa =aaa.substring(0,10);}
                        insertRecord.setDate(6, isEmptyOrNull(aaa) ? null : java.sql.Date.valueOf(aaa));
                        // PromotionName
                        insertRecord.setString(7,GetJsonObjectStringValue(itemdata, "PromotionName", false));
                        // DataType
                        insertRecord.setString(8, GetJsonObjectStringValue(itemdata, "DataType", false));
                        // referenceid
                        insertRecord.setInt(9, counter);

                        insertRecord.addBatch();
                    }
                }
                // insert bulk
                insertRecord.executeBatch();
                connection.commit();
                System.out.println("done price list");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (null != connection) { connection.close(); }

        }

    }
    private static String GetJsonObjectStringValue(JSONObject data, String jsonfieldName, boolean mandatory) throws Exception {
        String result = "";
        try {
            result = GetJsonObjectStringValue(data.get(jsonfieldName));
        } catch (Exception e) {
            if (mandatory) {
                throw new Exception("Field: " + jsonfieldName + " is mandatory");
            } else {
                result = "";
            }
        }
        return result;
    }

    private static String GetJsonObjectStringValue(Object objvalue) {
        String valToXml = "";
        try {
            if (objvalue instanceof Boolean) {
                Boolean boolToUse = ((Boolean) objvalue).booleanValue();
                valToXml = boolToUse.toString();
            } else if (objvalue instanceof Integer || objvalue instanceof Long) {
                long intToUse = ((Number) objvalue).longValue();
                valToXml = String.valueOf(intToUse);
            } else if (objvalue instanceof Float || objvalue instanceof Double) {
                double floatToUse = ((Number) objvalue).doubleValue();
                valToXml = String.valueOf(floatToUse);
            } else if (JSONObject.NULL.equals(objvalue)) {
                valToXml = "";
            } else {
                valToXml = ((String) objvalue).toString();
            }
        } catch (Exception e) {
            valToXml = "";
        }

        return valToXml;
    }

    private static boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }

}
