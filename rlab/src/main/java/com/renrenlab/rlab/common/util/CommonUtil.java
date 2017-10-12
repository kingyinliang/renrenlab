package com.renrenlab.rlab.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by guanjipeng on 2017/7/20.
 */
public class CommonUtil {
    /**
     * 判断字符串是否为纯数字
     *
     * @param string
     * @return
     */
    public static boolean isNum(String string) {
        if (null == string || string.equals(""))
            return false;
        for (int i = 0; i < string.length(); i++) {
            if (!Character.isDigit(string.charAt(i)))
                return false;
        }
        return true;
    }

    /**
     * 格式化时间
     *
     * @param date
     * @return
     */
    public static String formatTime(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(date);
    }
}
