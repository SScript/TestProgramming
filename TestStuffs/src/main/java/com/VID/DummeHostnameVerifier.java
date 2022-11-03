package com.VID;

import javax.net.ssl.*;

public class DummeHostnameVerifier implements HostnameVerifier {
    public DummeHostnameVerifier() {

    }

    @Override
    public boolean verify(String paramString, SSLSession paramSSLSession) {
        return true;
    }

}
