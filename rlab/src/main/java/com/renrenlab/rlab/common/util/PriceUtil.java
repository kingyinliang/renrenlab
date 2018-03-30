package com.renrenlab.rlab.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.RoundingMode;
import java.text.DecimalFormat;

/**
 * Created by guanjipeng on 2017/5/25.
 */
public class PriceUtil {
    private static final Logger logger = LoggerFactory.getLogger(PriceUtil.class);

    static String handlePrice(String priceString) {
        if (priceString == null || priceString.length() == 0) return "";
        int endIndex = priceString.indexOf(".");
        if (endIndex > 0)
            priceString = priceString.substring(0, endIndex);
        if (priceString.equals("0")) return priceString;
        double price = 0;
        try {
            price = Double.parseDouble(priceString);
        } catch (NumberFormatException e) {
            logger.error("价格处理异常", e);
        }
        price = price / 100;
        priceString = new DecimalFormat("######0.00").format(price);
        if (priceString.endsWith(".00"))
            priceString = priceString.substring(0, priceString.indexOf("."));
        return priceString;
    }

    static String handleListPrice(String priceString) {
        if (priceString == null || priceString.length() == 0) return "";
        int endIndex = priceString.indexOf(".");
        if (endIndex > 0)
            priceString = priceString.substring(0, endIndex);
        if (priceString.equals("0")) return priceString;
        double price = 0;
        try {
            price = Double.parseDouble(priceString);
        } catch (NumberFormatException e) {
            logger.error("价格处理异常", e);
        }

        price = price / 100;
        if (price < 10000)
            priceString = new DecimalFormat("######0.00").format(price);
        else {
            priceString = price + "";
            endIndex = priceString.indexOf(".");
            if (endIndex > 0)
                priceString = priceString.substring(0, endIndex);
        }
        if (price >= 10000) {
            price = price / 10000;
            DecimalFormat format = new DecimalFormat("######0.00");
            format.setRoundingMode(RoundingMode.FLOOR);
            priceString = format.format(price) + "万";
        }
        if (priceString.endsWith(".00"))
            priceString = priceString.substring(0, priceString.indexOf("."));
        return priceString;
    }

/*    public static void main(String args[]) {
        String pr = 9999900 + "";
        String pri = handleListPrice(pr);
        System.out.println(pri);
    }*/
}
