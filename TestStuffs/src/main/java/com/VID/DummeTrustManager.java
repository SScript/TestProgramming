package com.VID;

import java.security.*;
import java.security.cert.X509Certificate;

import javax.net.ssl.*;

public class DummeTrustManager implements X509TrustManager {
    public DummeTrustManager() {

    }

    @Override
    public void checkClientTrusted(X509Certificate[] chain, String authType) {}

    @Override
    public void checkServerTrusted(X509Certificate[] chain, String authType) {}

    @Override
    public X509Certificate[] getAcceptedIssuers() {
        return new X509Certificate[0];
    }

    public static SSLSocketFactory getSSLSocketFactory() throws KeyManagementException, NoSuchAlgorithmException {
        SSLContext sslContext = SSLContext.getInstance("SSL");
        sslContext.init(new KeyManager[0], new TrustManager[] { new DummeTrustManager() }, new SecureRandom());
        SSLSocketFactory ssf = sslContext.getSocketFactory();
        return ssf;
    }
}
