package com.renrenlab.rlab.common.util;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

public class CustomSystemUtil {
    public static String INTERNET_IP = getInternetIp(); // 内网IP
    public static String OUTERNET_IP = getOuternetIp(); // 外网IP

    private CustomSystemUtil() {
    }

    /**
     * 获得内网IP
     *
     * @return 内网IP
     */
    private static String getInternetIp() {
        try {
            return InetAddress.getLocalHost().getHostAddress();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获得外网IP
     *
     * @return 外网IP
     */
    private static String getOuternetIp() {
        try {
            Enumeration<NetworkInterface> networks = NetworkInterface.getNetworkInterfaces();
            InetAddress ip = null;
            Enumeration<InetAddress> addrs;
            while (networks.hasMoreElements()) {
                addrs = networks.nextElement().getInetAddresses();
                while (addrs.hasMoreElements()) {
                    ip = addrs.nextElement();
                    if (ip != null
                            && ip instanceof Inet4Address
                            && ip.isSiteLocalAddress()
                            && !ip.getHostAddress().equals(INTERNET_IP)) {
                        return ip.getHostAddress();
                    }
                }
            }
            // 如果没有外网IP，就返回内网IP
            return INTERNET_IP;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}