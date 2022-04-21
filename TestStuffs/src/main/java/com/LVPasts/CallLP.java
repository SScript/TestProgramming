package com.LVPasts;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStreamReader;
import java.io.DataOutputStream;

import java.io.FileOutputStream;
import java.io.InputStream;

import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;

import java.nio.charset.StandardCharsets;

import java.security.SecureRandom;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.util.Base64;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;

import org.json.JSONArray;
import org.json.JSONObject;

public class CallLP {

    // for https://express.pasts.lv/postOfficeApi
    public String callLPServicePostOffice(String ep, int connTimeout, int readTimeout) throws Exception {
        Resp result = new Resp();
        String newurl = ep.replaceAll(" ", "%20");
        //try {
        result = ProcessLPRest_1(newurl, connTimeout, readTimeout, "");
        //} catch (Exception e) {
        //    result.respCode = "SOA_203[001]";
        //    result.respMsg = e.getMessage();
        //}

        return result.ResponseStr;
    }

    // for parcelsDocumentsApi/stickers
    public Resp callLPServiceSticker(String ep, String secret, String lpdata, int connTimeout, int readTimeout) throws Exception {
        Resp result = new Resp();
        String newurl = ep.replaceAll(" ", "%20");
        try {
            result = ProcessLPRest_1(newurl, connTimeout, readTimeout, FormatLPRestStr_stickers(secret, lpdata));
            result.respCode = "1";
            result.respMsg = "OK";
            //result.respPdf = new String(Base64.getEncoder().encode(result.ResponseStr.getBytes()));

        } catch (Exception e) {
            result.respCode = "SOA_203[001]";
            result.respMsg = e.getMessage();
        }

        return result;
    }

    public Resp callLPService(String ep, String epo, JSONObject lpdata, int connTimeout, int readTimeout) throws Exception {

        Resp result = new Resp();

        String newurl = ep.replaceAll(" ", "%20");
        try {
            String formatedJSONData = "";
            if (ep.contains("parcelsApi/create")) {
                String pasta_offices = "";
                JSONObject data = lpdata.getJSONObject("LPData");
                // vajag datus par pasta nodaļām
                String dat = GetJsonAtrrObjectStringValue(data, "deliveryMode");
                if ("LVPasts Pickup Point".equalsIgnoreCase(dat)) {
                    pasta_offices = callLPServicePostOffice(epo, connTimeout, readTimeout);
                }
                formatedJSONData = FormatLPRestStr(lpdata, pasta_offices);
            } else if (ep.contains("courierApplicationsApi/create")) {
                formatedJSONData = FormatLPRestStr_courier_create(lpdata);
            }

            result = ProcessLPRest_1(newurl, connTimeout, readTimeout, formatedJSONData);
            if (!result.ResponseStr.contains("error")) {
                if (ep.contains("parcelsApi/create")) {

                    // ResponseStr: [{"country_id":"Valsts nav pareizi nor\u0101d\u012bta (j\u0101nor\u0101da Latvija)"}] -> not ok
                    // ResponseStr: {"Internal-ID-1":{"station_id":"Nor\u0101d\u012btais pakom\u0101ta indekss netika atrasts"}} -> not ok
                    //  ResponseStr: ["CE723011323LV"] - ok
                    if (!result.ResponseStr.startsWith("[\"CE")) {

                        // {"Internal-ID-1":"CE723100981LV"}
                        if (result.ResponseStr.contains("Internal-ID-1")) {
                            if (result.ResponseStr.startsWith("[")) {
                                JSONArray obja = new JSONArray(result.ResponseStr);
                                JSONObject ob = null;
                                int ii = obja.length();
                                String ss = "";
                                for (int j = 0; j < ii; j++) {
                                    ob = (JSONObject)obja.get(j);
                                    String[] fieldnames = JSONObject.getNames((JSONObject)ob);
                                    for (int i = 0; i < ((JSONObject)ob).length(); i++) {
                                        ss = ss + fieldnames[i] + ": " + GetJsonAtrrObjectStringValue(((JSONObject)ob), fieldnames[i]) + "; ";
                                    }
                                }
                            } else {
                                JSONObject obj = new JSONObject(result.ResponseStr);
                                result.respMsg = obj.getString("Internal-ID-1");
                                result.ResponseStr = "[" + obj.getString("Internal-ID-1") + "]";
                                result.respCode = "1";
                            }
                        } else {
                            if (result.ResponseStr.startsWith("[")) {
                                JSONArray obja = new JSONArray(result.ResponseStr);
                                JSONObject ob = null;
                                int ii = obja.length();
                                String ss = "";
                                for (int j = 0; j < ii; j++) {
                                    ob = (JSONObject)obja.get(j);
                                    String[] fieldnames = JSONObject.getNames((JSONObject)ob);
                                    for (int i = 0; i < ((JSONObject)ob).length(); i++) {
                                        ss = ss + fieldnames[i] + ": " + GetJsonAtrrObjectStringValue(((JSONObject)ob), fieldnames[i]) + "; ";
                                    }
                                }
                                result.respMsg = ss;
                            }
                        }
                    } else {
                        result.respCode = "1";
                        result.respMsg = "OK";
                        JSONArray o = new JSONArray(result.ResponseStr);
                        result.ParcelId = (String)o.get(0);

                    }
                } else {
                    // courierApplicationsApi/create
                    JSONObject obj = new JSONObject(result.ResponseStr);
                    JSONObject o1 = obj.getJSONObject("result");
                    Object o = o1.get("My-ID-3954653");

                    if (o instanceof Boolean) {
                        if (((Boolean)o) == true) {
                            result.respCode = "1";
                            result.respMsg = "OK";
                        }
                    } else {
                        String ss = "";
                        result.respCode = "SOA_142[015]";
                        String[] fieldnames = JSONObject.getNames((JSONObject)o);
                        for (int i = 0; i < ((JSONObject)o).length(); i++) {
                            ss = ss + fieldnames[i] + ": " + GetJsonAtrrObjectStringValue(((JSONObject)o), fieldnames[i]) + "; ";
                        }
                        result.respMsg = ss;
                    }
                }
            } else {
                result.respCode = "SOA_142[015]";
                result.respMsg = "Kļūda no Latvijas Pasts: " + result.ResponseStr;
            }//{"error":"Invalid ip address: 195.13.183.184"}
        } catch (Exception e) {
            result.respCode = "SOA_203[001]";
            result.respMsg = e.getMessage();
        }
        return result;
    }

    private Resp ProcessLPRest_1(String urlstr, int connTimeout, int readTimeout, String data) throws Exception {

        HttpURLConnection httpCon = null;
        HttpsURLConnection httpsCon = null;
        BufferedReader in = null;
        DataOutputStream wr = null;
        Resp result = new Resp();

        SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
        sslContext.init(null, null,  new SecureRandom());

        String newurl = urlstr.replaceAll(" ", "%20");
        URL url = new URL(newurl);

        //Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("vproxy3", 8080));
        //byte[] postDataBytes = data.getBytes("UTF-8");

        //httpsCon = (HttpsURLConnection) url.openConnection(proxy);
        httpsCon = (HttpsURLConnection) url.openConnection();
        httpsCon.setSSLSocketFactory(sslContext.getSocketFactory());

        httpsCon.setRequestMethod("POST");

        //httpsCon.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
        //httpsCon.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        byte[] postDataBytes = null;
        if (!isEmptyOrNull(data)) {
            httpsCon.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
            postDataBytes = data.getBytes("UTF-8");
            httpsCon.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        } else {
            httpsCon.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        }

        httpsCon.setConnectTimeout(connTimeout);
        httpsCon.setReadTimeout(readTimeout);

        //httpsCon.setRequestProperty("Charset", "UTF-8");
        //httpsCon.setRequestProperty("Accept-Charset", "UTF-8");
        httpsCon.setDoOutput(true);

        // -- lai neskatās ssl, kad lokāli testē
        httpsCon.setHostnameVerifier(new HostnameVerifier() {
            @Override
            public boolean verify(String hostname, SSLSession sslSession) {
                return true;
            }
        });

        if (!isEmptyOrNull(data)) {
            httpsCon.setRequestProperty("Accept", "application/pdf");
            httpsCon.getOutputStream().write(postDataBytes);
        }


        StringBuffer response = new StringBuffer();
        String inputLine = "";
        result.respCodeO = String.valueOf(httpsCon.getResponseCode());
        result.SenJsonStr = data;

        if (httpsCon.getResponseCode() != 200) {

            in = new BufferedReader(new InputStreamReader(httpsCon.getErrorStream()));
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            result.respCode = "UNICORN SOA_203[001] " + String.valueOf(httpsCon.getResponseCode());
            result.respMsg = response.toString();
            try {
                JSONObject o1 = new JSONObject(response.toString());
                //JSONObject o1 = (JSONObject) obj.get(0);
                String r2 = GetJsonAtrrObjectStringValue(o1, "responseCode");
                String r3 = GetJsonAtrrObjectStringValue(o1, "responseMsg");
                result.ResponseStr = response.toString();
                result.respCode = "SOA_203[001]";
                result.respMsg = r3 + " : " + r2;
            } catch (Exception e) {
                result.respMsg = "Global Error: " + e.getMessage() + " : " + response.toString();
            }
        } else {
            if (urlstr.contains("stickers")) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                InputStream is = null;
                is = httpsCon.getInputStream();
                byte[] byteChunk = new byte[4096]; // Or whatever size you want to read in at a time.
                int n;
                while ((n = is.read(byteChunk)) > 0) {
                    baos.write(byteChunk, 0, n);
                }
                //baos.writeTo(new FileOutputStream("yes1.pdf"));  // šeit ieglabāju pa tiešo failā - pdf atveras
                byte[] ss = baos.toByteArray();
                baos.close();
                result.ResponseStr = ss.toString();
                result.respPdf = new String(Base64.getEncoder().encode(ss));
                //byte[] ss = response.toString().getBytes(StandardCharsets.UTF_8);
            } else {
                in = new BufferedReader(new InputStreamReader(httpsCon.getInputStream(), "UTF-8"));
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                result.ResponseStr = response.toString();
            }
            try {
                if (result.ResponseStr.contains("error")) {
                    JSONObject res = new JSONObject(response.toString());
                    // ResponseStr: {"error":"Unknown user"}
                    result.respCode = "SOA_142[015]";
                    result.respMsg = "Kļūda no Latvijas Pasts: " + res.getString("error");
                }
            } catch (Exception e1) {
                result.respCode = "SOA_142[015]";
                result.respMsg = "Can not read return message 1";
            }

        }
        return result;
    }

    private String FormatLPRestStr1(JSONObject lpindata, String pasta_offices) throws Exception {
        JSONObject data = lpindata.getJSONObject("LPData");
        JSONObject obj = new JSONObject();
        String dat = "";
        /* {
  "secret": "SECRET-KEY",
  "parcels": {
    {
    "type": "Ie",
    "package_weight":"3",
    "name_surname": "Rūdis Ābele",
    "phone": "22222222",
    "email": "abc@pasts.lv",
    "country_id": 7,
    "station_id": 99,
    "sms_invite":1
    }
  }
}*/
        String phone = GetJsonAtrrObjectStringValue(data, "phone");
        if (!isEmptyOrNull(phone) && (phone.length()!=8)) {
            phone = phone.substring(phone.length()-8, phone.length());
        }

        JSONObject parcels = new JSONObject();
        JSONObject d = new JSONObject();

        d.put("type", GetJsonAtrrObjectStringValue(data, "type"));
        dat = GetJsonAtrrObjectStringValue(data, "customerName");
        if (!isEmptyOrNull(dat)) {d.put("company_name", dat);}
        dat = GetJsonAtrrObjectStringValue(data, "contact_person");
        if (!isEmptyOrNull(dat)) {d.put("name_surname", dat);}
        d.put("phone", phone);
        dat = GetJsonAtrrObjectStringValue(data, "email");
        if (!isEmptyOrNull(dat)) {d.put("email", dat);}
        d.put("country_id", 7);
        dat = GetJsonAtrrObjectStringValue(data, "pickUpId");
        if (!isEmptyOrNull(dat)) {d.put("station_id", dat);}
        d.put("sms_invite", 1);

        parcels.put("Internal-ID-1", d);

        obj.put("secret", GetJsonAtrrObjectStringValue(data, "secret_cfg"));
        obj.put("parcels", parcels);

        return jsonToURLEncoding(obj);
    }

    private String FormatLPRestStr2(JSONObject lpindata, String pasta_offices) throws Exception {
        JSONObject obj = new JSONObject();
        JSONArray parcels = new JSONArray();
        JSONObject dati = null;
        String dat = "";
        String dat1 = "";

        JSONObject data = lpindata.getJSONObject("LPData");

        String InternalWarehouseId = GetJsonAtrrObjectStringValue(data, "internalWarehouseId");
        String deliveryMode = GetJsonAtrrObjectStringValue(data, "deliveryMode");

        JSONArray pasta_nod = null;
        JSONObject pasta_nodala = null;
        if ("LVPasts Pickup Point".equalsIgnoreCase(deliveryMode)) {
            // no lv pasta nodaļām
            pasta_nod = new JSONArray(pasta_offices);
            String zip = GetJsonAtrrObjectStringValue(data, "pickUpId");
            pasta_nodala = getPastssOfficeData(pasta_nod, zip);
            // ja neatrod pasta nodalju
            if (null == pasta_nodala) {throw new Exception("Nav atrasta pasta nodaļa");}
        }
        if (!isEmptyOrNull(InternalWarehouseId)) {
            obj.put("secret", GetJsonAtrrObjectStringValue(data, "secret_cfg1"));
        } else {
            obj.put("secret", GetJsonAtrrObjectStringValue(data, "secret_cfg"));
        }
        int i = 1;
        dat = GetJsonAtrrObjectStringValue(data, "numOfParcel");
        if (!isEmptyOrNull(dat)) {
            i = Integer.parseInt(dat);
        }

        for (int j = 0; j<i; j++) {
            dati = new JSONObject();
            dat = GetJsonAtrrObjectStringValue(data, "type");
            if (!isEmptyOrNull(dat)) {dati.put("type", dat);}

            dat = GetJsonAtrrObjectStringValue(data, "numOfParcel");
            if (!isEmptyOrNull(dat)) {
                i = Integer.parseInt(dat);
            }

            if (i > 1) {
                dati.put("multiparcel", 1);
                dat = GetJsonAtrrObjectStringValue(data, "order_number");
                if (!isEmptyOrNull(dat)) {dati.put("group_uid", dat);}
            }

            dat = GetJsonAtrrObjectStringValue(data, "weight");
            if (!isEmptyOrNull(dat)) {dati.put("package_weight", dat);}

            if (isEmptyOrNull(InternalWarehouseId)) {
                dat = GetJsonAtrrObjectStringValue(data, "accountName");
                if (!isEmptyOrNull(dat)) {dati.put("name_surname", dat);}
            } else {
                dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "contact_person");
                if (!isEmptyOrNull(dat)) {dati.put("name_surname", dat);}
            }

            if (isEmptyOrNull(InternalWarehouseId)) {
                dat = GetJsonAtrrObjectStringValue(data, "customerName");
                if (!isEmptyOrNull(dat)) {dati.put("company_name", dat);}
            }

            //dat = GetJsonAtrrObjectStringValue(data, "country_id");
            //dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "country_id");
            //if (!isEmptyOrNull(dat)) {dati.put("country_id", dat);}
            dati.put("country_id", 7);

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "city");
            if (!isEmptyOrNull(dat)) {dati.put("city", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "area");
            if (!isEmptyOrNull(dat)) {dati.put("area", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "district");
            if (!isEmptyOrNull(dat)) {dati.put("district", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "village");
            if (!isEmptyOrNull(dat)) {dati.put("village", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "district");
            if (!isEmptyOrNull(dat)) {dati.put("district", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "street");
            if (!isEmptyOrNull(dat)) {dati.put("street", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "house");
            if (!isEmptyOrNull(dat)) {dati.put("house", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "apartment_nr");
            if (!isEmptyOrNull(dat)) {dati.put("apartment_nr", dat);}

            dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "zipcode");
            if (!isEmptyOrNull(dat)) {dati.put("zipcode", dat);}

            if (!isEmptyOrNull(InternalWarehouseId)) {
                dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "contact_phone");
            } else {
                dat = GetJsonAtrrObjectStringValue(data, "phone");
            }
            if (!isEmptyOrNull(dat) && (dat.length()!=8)) {
                dat = dat.substring(dat.length()-8, dat.length());
            }
            if (!isEmptyOrNull(dat)) {dati.put("phone", dat);}

            if (!isEmptyOrNull(InternalWarehouseId)) {
                dat = getAddressFieldValue(InternalWarehouseId, deliveryMode, pasta_nodala, data, "contact_email");
            } else {
                dat = GetJsonAtrrObjectStringValue(data, "email");
            }
            if (!isEmptyOrNull(dat)) {dati.put("email", dat);}

            dat = GetJsonAtrrObjectStringValue(data, "comments");
            String floor = "";
            floor = GetJsonAtrrObjectStringValue(data, "floor");
            if (!isEmptyOrNull(dat)) {
                if (!isEmptyOrNull(floor)) {
                    dati.put("comments", dat + " " + "Stāvs: " + floor);
                    //res=res+"&parcels[" + j + "][comments]=" + dat + " " + "Stāvs: " + floor;
                } else {
                    dati.put("comments", dat);
                    //res=res+"&parcels[" + j + "][comments]=" + dat;
                }
            } else {
                if (!isEmptyOrNull(floor)) {
                    dati.put("comments", "Stāvs: " + floor);
                    //res=res+"&parcels[" + j + "][comments]=" + "Stāvs: " + floor;
                }
            }

            dat = GetJsonAtrrObjectStringValue(data, "deliveryType");
            if ("Courier".equalsIgnoreCase(dat)) {
                dati.put("delivery_priority", "X1");

                dat1 = GetJsonAtrrObjectStringValue(data, "doorDelivery");
                if ("true".equalsIgnoreCase(dat1)) {
                    dati.put("carry_assist", "1");
                } else {
                    dati.put("carry_assist", "0");
                }
            }

            dat = GetJsonAtrrObjectStringValue(data, "deliveryMode");
            if ("LVPasts Parcel machines".equalsIgnoreCase(dat)) {
                dat1 = GetJsonAtrrObjectStringValue(data, "pickUpId");
                dati.put("station_id", dat1);
            }

            if ("LVPasts Pickup Point".equalsIgnoreCase(dat)) {
                dati.put("pickup", 1);
                dat1 = GetJsonAtrrObjectStringValue(data, "pickUpId");
                dati.put("pickup_zipcode", dat1);
            }

            dati.put("sms_invite", 1);

            parcels.put(dati);
        }
        obj.put("parcels", parcels);
        System.out.println(obj.toString());
        return jsonToURLEncoding(obj);
    }

    private String getAddressFieldValue(String InternalWarehouseId, String deliveryMode, JSONObject pasta_nodala, JSONObject data, String field) {
        String dat = "";
        if (!isEmptyOrNull(InternalWarehouseId)) {
            // no cfg tabulas
            dat = GetJsonAtrrObjectStringValue(data, field + "_cfg");
        } else {
            if ("LVPasts Pickup Point".equalsIgnoreCase(deliveryMode)) {
                // no lv pasta nodaļām
                dat = GetJsonAtrrObjectStringValue(pasta_nodala, field);
            } else {
                if ("LVPasts Courier".equalsIgnoreCase(deliveryMode)) {
                    // pēc AddressKey
                    dat = GetJsonAtrrObjectStringValue(data, field + "_adr");
                }
            }
        }

        return dat;
    }

    private String getPastssOfficeData(JSONObject data, String field) {
        return GetJsonAtrrObjectStringValue(data, field);
    }

    private JSONObject getPastssOfficeData(JSONArray data, String zipid) {
        JSONObject res = null;
        if (!isEmptyOrNull(zipid) && !(zipid.length() == 4)) {
            zipid = zipid.substring(zipid.length()-4, zipid.length());
        }
        int i = data.length();
        JSONObject d = null;
        String dat = "";
        for (int j = 0; j<i; j++) {
            d = (JSONObject)data.get(j);
            dat = d.getString("zipcode");
            if (dat.equals(zipid)) {return d;}
        }
        return res;
    }

    private String FormatLPRestStr(JSONObject lpindata, String pasta_offices) throws Exception {
        JSONObject data = lpindata.getJSONObject("LPData");

        String dat = "";
        String dat1 = "";
        String InternalWarehouseId = GetJsonAtrrObjectStringValue(data, "internalWarehouseId");
        String deliveryMode = GetJsonAtrrObjectStringValue(data, "deliveryMode");

        JSONObject obj = new JSONObject();
        JSONArray parcels = new JSONArray();
        JSONObject dati = null;

        /*
         * ja aizpildīts parametrs <InternalWarehouseId>, tad no konfiguracijas tabulas (noliktavas dati)
                ja DeliveryMode = 'LVPasts Pickup Point', tad <city> no postOfficeApi
                ja DeliveryMode = 'LVPasts Courier', tad  no AK_ADMIN (pēc AddressKey)
                parējos gadījumos nav jāpadod
         *
         * */
        if (!isEmptyOrNull(InternalWarehouseId)) {
            return FormatLPRestStr2(lpindata, pasta_offices);
        } else {
            if ("LVPasts Parcel Machine".equalsIgnoreCase(deliveryMode)) {
                // pakomātam
                return FormatLPRestStr1(lpindata, pasta_offices);
            } else {
                return FormatLPRestStr2(lpindata, pasta_offices);
            }
        }

    }

    private String FormatPhoneNumber(String nr) {
        if (nr.contains("+")) {
            return nr.substring(4).trim();
        }
        return nr;
    }

    // "courierApplicationsApi/create"
    private String FormatLPRestStr_courier_create(JSONObject lpindata) throws Exception {
        JSONObject data = lpindata.getJSONObject("CourierData");

        JSONObject obj = new JSONObject();
        JSONObject dati = new JSONObject();
        obj.put("secret", GetJsonAtrrObjectStringValue(data, "secret"));
        JSONObject parcels = new JSONObject();

        //parcels.put("Internal-ID-1",

        String result = "secret=" + GetJsonAtrrObjectStringValue(data, "secret");
        //obj.put("secret", GetJsonAtrrObjectStringValue(data, "secret"));

        String dat = "";
        // [required]
        dat = GetJsonAtrrObjectStringValue(data, "when");
        result = result + "&applications[My-ID-3954653][when]=" + dat;



        // [required]
        dat = GetJsonAtrrObjectStringValue(data, "time_from");
        result = result + "&applications[My-ID-3954653][time_from]=" + dat;
        // [required]
        dat = GetJsonAtrrObjectStringValue(data, "time_to");
        result = result + "&applications[My-ID-3954653][time_to]=" + dat;
        // [required]
        dat = GetJsonAtrrObjectStringValue(data, "transport_type");
        result = result + "&applications[My-ID-3954653][transport_type]=" + dat;
        // [optional]
        dat = GetJsonAtrrObjectStringValue(data, "manifest");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][manifest]=" + dat;
        }
        // [optional]
        dat = GetJsonAtrrObjectStringValue(data, "cbm");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][cbm]=" + dat;
        }
        // [optional]
        dat = GetJsonAtrrObjectStringValue(data, "ldm");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][ldm]=" + dat;
        }
        // [optional]
        dat = GetJsonAtrrObjectStringValue(data, "weight");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][weight]=" + dat;
        }
        // [required] company name or name and surname
        dat = GetJsonAtrrObjectStringValue(data, "company_name");
        result = result + "&applications[My-ID-3954653][company_name]=" + dat;
        // [required] phone no.
        dat = GetJsonAtrrObjectStringValue(data, "phone");
        result = result + "&applications[My-ID-3954653][phone]=" + dat;
        // [optional] e-mail
        dat = GetJsonAtrrObjectStringValue(data, "email");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][email]=" + dat;
        }
        // [optional] comments
        dat = GetJsonAtrrObjectStringValue(data, "contact_person") + " " + GetJsonAtrrObjectStringValue(data, "add_address");
        result = result + "&applications[My-ID-3954653][comments]=" + dat;
        // [required] city.
        dat = GetJsonAtrrObjectStringValue(data, "city");
        result = result + "&applications[My-ID-3954653][city]=" + dat;
        // [required] area.
        dat = GetJsonAtrrObjectStringValue(data, "area");
        result = result + "&applications[My-ID-3954653][area]=" + dat;
        // [optional] district
        dat = GetJsonAtrrObjectStringValue(data, "district");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][district]=" + dat;
        }
        // [optional] village
        dat = GetJsonAtrrObjectStringValue(data, "village");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][village]=" + dat;
        }
        // [optional] street
        dat = GetJsonAtrrObjectStringValue(data, "street");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][street]=" + dat;
        }
        // [optional] house
        dat = GetJsonAtrrObjectStringValue(data, "house");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][house]=" + dat;
        }
        // [optional] apartment_nr
        dat = GetJsonAtrrObjectStringValue(data, "apartment_nr");
        if (!isEmptyOrNull(dat)) {
            result = result + "&applications[My-ID-3954653][apartment_nr]=" + dat;
        }
        // [required] zipcode.
        dat = GetJsonAtrrObjectStringValue(data, "zipcode");
        result = result + "&applications[My-ID-3954653][zipcode]=" + dat;

        /*
        JSONObject obj = new JSONObject();
        JSONObject applications = new JSONObject();

        applications.put("My-ID-792376",
                    new JSONObject().put("when", GetJsonAtrrObjectStringValue(data.get("when")))
                                    .put("time_from", GetJsonAtrrObjectStringValue(data.get("time_from")))
                                    .put("time_to", GetJsonAtrrObjectStringValue(data.get("time_to")))
                                    .put("phone", GetJsonAtrrObjectStringValue(data.get("phone")))
                                    .put("email", GetJsonAtrrObjectStringValue(data.get("email")))
                                    .put("address", GetJsonAtrrObjectStringValue(data.get("country_id")))
                                    .put("pallet_count", GetJsonAtrrObjectStringValue(data.get("country_id")))
                                    .put("parcel_count", GetJsonAtrrObjectStringValue(data.get("country_id")))
                                    .put("transport", GetJsonAtrrObjectStringValue(data.get("country_id")))
                                    .put("comments", GetJsonAtrrObjectStringValue(data.get("station_id"))))
            ;

        obj.put("secret", GetJsonAtrrObjectStringValue(data.get("secret")));
        obj.put("applications", applications);

        return obj.toString();
        */
        return result;
    }

    /**
     *{
     "secret": "SECRET-KEY",
     "size": "150x100",
     "parcels":
     [
     "CE100005322LV",
     "CE100005323LV",
     "CE100005324LV"
     ]
     }
     * @param lpindata
     * @return
     * @throws Exception
     */
    private String FormatLPRestStr_stickers(String secret, String data) throws Exception {
        JSONObject d = new JSONObject();
        JSONArray o = new JSONArray(data);
        d.put("secret", secret).put("size", "150x100").put("parcels", o);

        return jsonToURLEncoding(d);
    }

    public String jsonToURLEncoding(JSONObject json) {
        String output = "";
        String[] keys = JSONObject.getNames(json);
        for (String currKey : keys)
            output += jsonToURLEncodingAux(json.get(currKey), currKey);

        return output.substring(0, output.length()-1);
    }

    private String jsonToURLEncodingAux(Object json, String prefix) {
        String output = "";
        if (json instanceof JSONObject) {
            JSONObject obj = (JSONObject)json;
            String[] keys = JSONObject.getNames(obj);
            for (String currKey : keys) {
                String subPrefix = prefix + "[" + currKey + "]";
                output += jsonToURLEncodingAux(obj.get(currKey), subPrefix);
            }
        } else if (json instanceof JSONArray) {
            JSONArray jsonArr = (JSONArray) json;
            int arrLen = jsonArr.length();

            for (int i = 0; i < arrLen; i++) {
                String subPrefix = prefix + "[" + i + "]";
                Object child = jsonArr.get(i);
                output += jsonToURLEncodingAux(child, subPrefix);
            }
        } else {
            output = prefix + "=" + json.toString() + "&";
        }

        return output;
    }

    public String formatDate(String dateVal) throws Exception {
        if (!isEmptyOrNull(dateVal)) {
            try {
                String dd11 = dateVal.substring(8, 10);
                String mm11 = dateVal.substring(5, 7);
                String yy11 = dateVal.substring(0, 4);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                LocalDate dateTime = LocalDate.parse(dd11 + "/" + mm11 + "/" + yy11, formatter);
                return yy11 + "-" + mm11 + "-" + dd11;
            } catch (Exception e) {
                throw new Exception("Incorect date format");
            }
        } else {
            return "";
        }
    }

    private String GetJsonAtrrObjectStringValue(JSONObject obj, String objName) {
        String valToXml = "";
        Object objvalue = null;
        try {
            objvalue = obj.get(objName);
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
        } catch (Exception e) {valToXml = "";}

        return valToXml;
    }

    private boolean isEmptyOrNull(String str) {
        if (null == str || (null != str && str.trim().equals(""))) {
            return true;
        }
        return false;
    }

}