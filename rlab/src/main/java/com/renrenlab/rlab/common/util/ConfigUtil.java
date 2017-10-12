package com.renrenlab.rlab.common.util;

import org.apache.commons.lang3.StringUtils;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Properties;

/**
 * Created by Administrator on 2017/6/29.
 */
public class ConfigUtil {

    private Properties props = new Properties();

    private static final ConfigUtil instance = new ConfigUtil();

    private static final HashMap<String, String> map = new HashMap<String, String>();

    private ConfigUtil() {
        InputStream in = null;
        try {
            in = Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties");
            props.load(in);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    public static String getProperty(String key) {
        //先从本地读取
        if(map.containsKey(key)){
            return map.get(key);
        }else {
            String value = instance.props.getProperty(key);
            if(!StringUtils.isBlank(value)){
                map.put(key, value);
            }
            return value;
        }
    }

}
