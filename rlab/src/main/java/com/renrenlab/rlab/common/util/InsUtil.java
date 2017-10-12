package com.renrenlab.rlab.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.model.Price;
import com.renrenlab.rlab.model.TitleContent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 仪器相关处理工具类
 */
public class InsUtil {

    private static final Logger logger = LoggerFactory.getLogger(InsUtil.class);

    /**
     * 图片处理 工具方法
     *
     * @param info
     * @return
     */
    public static JSONArray handlePic(String info) {
        JSONArray jsonArray = null;
        try {
            jsonArray = JSON.parseObject(info, JSONArray.class);
        } catch (Exception e) {
            logger.error("图片处理出现异常", e);
        }
        String picUrl;
        for (int i = 0; i < jsonArray.size(); i++) {
            if (jsonArray.get(i) != null) {
                picUrl = jsonArray.get(i).toString();
                if (picUrl != null && !picUrl.startsWith("http")) {
                    jsonArray.set(i, Constant.UPLOADIMG + picUrl + Constant.XOSS);
                } else if (picUrl != null && picUrl.startsWith("http://congye-spider")) {
                    jsonArray.set(i, picUrl + Constant.XOSSCONG);
                } else if (picUrl != null && picUrl.startsWith("http://renrenlab")) {
                    jsonArray.set(i, picUrl + Constant.XOSS);
                }
            }
        }
        return jsonArray;
    }

    /**
     * 处理价格
     *
     * @param priceStr
     * @return
     */
    public static Price handlePrice(String priceStr) {
        Price price = null;
        try {
            price = JSON.parseObject(priceStr, Price.class);
        } catch (Exception e) {
            logger.error("处理价格出现异常", e);
        }
        if (price != null && price.getFlag() == 1) {
            //精准价格
            price.setAccPrice(PriceUtil.handlePrice(price.getAccPrice()));
        }
        if (price != null && price.getFlag() == 2) {
            //价格范围
            price.setScopeLowPrice(PriceUtil.handlePrice(price.getScopeLowPrice()));
            price.setScopeHighPrice(PriceUtil.handlePrice(price.getScopeHighPrice()));
        }
        return price;
    }

    /**
     * 处理核心参数
     *
     * @param coreParamStr
     * @return
     */
    public static List<TitleContent> handelCoreParam(String coreParamStr) {
        net.sf.json.JSONObject jsonObject = null;
        List<TitleContent> coreParamList = null;
        try {
            jsonObject = net.sf.json.JSONObject.fromObject(coreParamStr);
            Iterator iterator = jsonObject.keys();
            coreParamList = new ArrayList<>();
            while (iterator.hasNext()) {
                String key = String.valueOf(iterator.next());
                String value = (String) jsonObject.get(key);
                TitleContent description1 = new TitleContent();
                description1.setTitle(key);
                description1.setContent(value);
                coreParamList.add(description1);
            }
        } catch (Exception e) {
            logger.error("处理核心参数出现异常", e);
        }
        return coreParamList;
    }

    /**
     * 处理仪器描述信息
     *
     * @param des
     * @return
     */
    public static List<TitleContent> handleDes(String des) {
        String content = "";
        List<String> conList = null;
        List<TitleContent> descriptionList = null;
        try {
            descriptionList = JSONObject.parseArray(des, TitleContent.class);
            for (TitleContent titleContent : descriptionList) {
                content = titleContent.content.toString();
                if (content.startsWith("[\"") && content.endsWith("\"]")) {
                    conList = JSONObject.parseArray(content, String.class);
                    content = "";
                    for (String con : conList) {
                        content = content + con + "<br>";
                    }
                    titleContent.setContent(content);
                }
            }
        } catch (Exception e) {
            logger.error("处理仪器描述信息出现异常", e);
        }
        return descriptionList;
    }

    /**
     * 计算需求过期时间
     *
     * @param date
     * @return
     */
    public static String getRemainTime(Date date) {
        String remainTime = (date.getTime() - new Date().getTime()) / (24 * 60 * 60 * 1000) + 1 + "";
        return remainTime;
    }
}
