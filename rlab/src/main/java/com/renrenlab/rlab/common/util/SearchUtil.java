package com.renrenlab.rlab.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.model.InsDetailInfo;
import com.renrenlab.rlab.model.Price;
import com.renrenlab.rlab.model.TitleContent;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * 仪器相关处理工具类
 */
public class SearchUtil {

    private static final Logger logger = LoggerFactory.getLogger(SearchUtil.class);

    public static String PROVINCE_BY_IP = "provinceByIp", CITY_BY_IP = "cityByIp";

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
                if (picUrl != null && !picUrl.startsWith("http") && !picUrl.contains(Constant.XOSS)) {
                    jsonArray.set(i, Constant.UPLOADIMG + picUrl + Constant.XOSS);
                } else if (picUrl != null && picUrl.startsWith("http://congye-spider") && !picUrl.contains(Constant.XOSSCONG)) {
                    jsonArray.set(i, picUrl + Constant.XOSSCONG);
                } else if (picUrl != null && picUrl.startsWith("http://renrenlab") && !picUrl.contains(Constant.XOSS)) {
                    jsonArray.set(i, picUrl + Constant.XOSS);
                }
            }
        }
        return jsonArray;
    }

    /**
     * 更新图片时 剔除后缀
     *
     * @param pics
     * @return
     */
    public static JSONArray delXOSS(String pics) {
        JSONArray jsonArray = JSON.parseObject(pics, JSONArray.class);
        for (int i = 0; i < jsonArray.size(); i++) {
            String originPicUrl = jsonArray.getString(i);
            int endIndex = originPicUrl.indexOf(Constant.PRIFIXOSS);
            if (endIndex >= 0) {
                originPicUrl = originPicUrl.substring(0, endIndex);
            }
            jsonArray.set(i, originPicUrl);
        }
        return jsonArray;
    }

    /**
     * 处理仪器详情字段中的 （未知，不祥，暂无）
     *
     * @param detailInfo
     * @return
     */
    public static InsDetailInfo handleInsDetail(InsDetailInfo detailInfo) {
        if (detailInfo == null) {
            return null;
        }
        detailInfo.setInsBrand(detailInfo.getInsBrand() == null ? "" : notDetail(detailInfo.getInsBrand()));
        detailInfo.setInsOrigin(detailInfo.getInsOrigin() == null ? "" : notDetail(detailInfo.getInsOrigin()));
        detailInfo.setInsMode(detailInfo.getInsMode() == null ? "" : notDetail(detailInfo.getInsMode()));
        return detailInfo;
    }

    public static String handlePicToStr(String info) {
        return handlePicToStr(info, null);
    }

    public static String handlePicToStr(String info, String url) {
        String picUrl = "";
        if (info != null) {
            picUrl = info;
            if (picUrl != null && !picUrl.startsWith("http") && !picUrl.contains(Constant.XOSS)) {
                if (url != null) {
                    picUrl = Constant.ORGIMG + picUrl + Constant.XOSS;
                } else {
                    picUrl = Constant.UPLOADIMG + picUrl + Constant.XOSS;
                }
            } else if (picUrl != null && picUrl.startsWith("http://congye-spider") && !picUrl.contains(Constant.XOSSCONG)) {
                picUrl = picUrl + Constant.XOSSCONG;
            } else if (picUrl != null && picUrl.startsWith("http://renrenlab") && !picUrl.contains(Constant.XOSS)) {
                picUrl = picUrl + Constant.XOSS;
            }
        }
        if (url != null) {

        }
        return picUrl;
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
            price.setAccPrice(PriceUtil.handleListPrice(price.getAccPrice()));
        }
        if (price != null && price.getFlag() == 2) {
            //价格范围
            price.setScopeLowPrice(PriceUtil.handleListPrice(price.getScopeLowPrice()));
            price.setScopeHighPrice(PriceUtil.handleListPrice(price.getScopeHighPrice()));
        }
        return price;
    }

    /**
     * 处理价格
     *
     * @param priceStr
     * @return
     */
    public static Price handlePriceWithoutWan(String priceStr) {
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
                value = notDetail(value);
                description1.setContent(value);
                coreParamList.add(description1);
            }
        } catch (Exception e) {
            logger.error("处理核心参数出现异常", e);
        }
        return coreParamList;
    }

    public static String notDetail(String value) {
        switch (value) {
            case "暂无":
            case "不详":
            case "未知":
                value = "数据更新中";
        }
        return value;
    }

    /**
     * 处理仪器描述信息
     *
     * @param des
     * @return
     */
    public static List<TitleContent> handleDes(String des) {
        String content;
        List<String> conList;
        List<TitleContent> descriptionList = null;
        try {
            descriptionList = JSONObject.parseArray(des, TitleContent.class);
            for (TitleContent titleContent : descriptionList) {
                content = titleContent.content.toString();
                content = notDetail(content);
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
        String remainTime = (date.getTime() - System.currentTimeMillis()) / (24 * 60 * 60 * 1000) + 1 + "";
        return remainTime;
    }

    /**
     * 处理关键词
     *
     * @param keyword
     * @return
     */
    public static String doHandleKeyword(String keyword) {
        if (StringUtils.isEmpty(keyword)) {
            return null;
        }
        keyword = keyword.trim();
        //处理竖杠
        keyword = keyword.replaceAll("\\|", "");
        keyword = keyword.replaceAll("'", "");
        //处理html标签
        keyword = keyword.replaceAll("<", "");
        keyword = keyword.replaceAll(">", "");
        keyword = keyword.replaceAll("\\(", "");
        keyword = keyword.replaceAll("\\)", "");
        keyword = keyword.replaceAll("\\\\", "");
        //处理特殊字符  select/*!*/`version`
        keyword = keyword.replaceAll("`", "");
        keyword = keyword.replaceAll("/", "");
        keyword = keyword.replaceAll("\\*", "");
        keyword = keyword.replaceAll("!", "");
        keyword = keyword.replaceAll(":", "");
        //处理空格
        keyword = keyword.replaceAll("\\s+", "&");
        return keyword;
    }

    /**
     * session中填入经纬度
     *
     * @param session
     */
    public static Map<String, String> handleLocation(HttpSession session) {
        //获取客户端地理位置
        Map<String, String> map = null;
        String provinceByIp = null, cityByIp = null, result = null;
        if (session == null
                || session.getAttribute(Constant.Service.LATITUDE) == null
                || session.getAttribute(Constant.Service.LONGITUDE) == null) {
            return null;
        }

        String ip = (String) session.getAttribute("ip");
        //内网ip直接过滤
        if ("0:0:0:0:0:0:0:1".equals(ip) || "127.0.0.1".equals(ip) || ip.contains("192.168.")) {
            //本地调试使用北京经纬度
            session.setAttribute(Constant.Service.LONGITUDE, "39.91488908");
            session.setAttribute(Constant.Service.LATITUDE, "116.40387397");
            result = "{\n" +
                    "\"address\": \"CN|北京|北京|None|UNICOM|0|0\",\n" +
                    "\"content\": {\n" +
                    "\"address\": \"北京市\",\n" +
                    "\"address_detail\": {\n" +
                    "\"city\": \"北京市\",\n" +
                    "\"city_code\": 131,\n" +
                    "\"district\": \"\",\n" +
                    "\"province\": \"北京市\",\n" +
                    "\"street\": \"\",\n" +
                    "\"street_number\": \"\"\n" +
                    "},\n" +
                    "\"point\": {\n" +
                    "\"x\": \"116.40387397\",\n" +
                    "\"y\": \"39.91488908\"\n" +
                    "}\n" +
                    "},\n" +
                    "\"status\": 0\n" +
                    "}";
        } else {
            result = HttpClientUtils.getSend(Constant.BAIDU_IP + ip);
        }
        net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(result);
        Integer status = (Integer) jsonObject.get("status");
        if (status != null && status == 0) {
            net.sf.json.JSONObject adderssDetail = net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(jsonObject.get("content"))).get("address_detail"));
            //解析result 得到经纬度
            net.sf.json.JSONObject latlng = net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(jsonObject.get("content"))).get("point"));
            session.setAttribute(Constant.Service.LONGITUDE, latlng.get("x"));
            session.setAttribute(Constant.Service.LATITUDE, latlng.get("y"));
            //解析result 根据ip得到所在省份
            provinceByIp = (String) adderssDetail.get("province");
            cityByIp = (String) adderssDetail.get("city");
            map = new HashMap<>();
            map.put(PROVINCE_BY_IP, provinceByIp);
            map.put(CITY_BY_IP, cityByIp);
        }
        return map;
    }
}
