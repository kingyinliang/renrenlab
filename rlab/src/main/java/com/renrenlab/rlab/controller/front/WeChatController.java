package com.renrenlab.rlab.controller.front;

import com.renrenlab.rlab.common.util.JsonMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by renrenlab on 18/2/6.
 */
@Controller
@RequestMapping("front")
public class WeChatController {

    @Autowired
    private JedisPool jedisPool;

    private Logger log = LoggerFactory.getLogger(this.getClass());
    //人人实验公众号参数（注意勿泄露）
    @Value("wx43f0e0d0b8d626a6")
    private String appId;
    @Value("fda6f77b1709985ceddf845ea4a6f2be")
    private String appSecret;

    //获取微信参数
    @RequestMapping("/wechatParam")
    @ResponseBody
    public Map<String, String> getWechatParam(String url) throws Exception {
        //当前时间
        long now = System.currentTimeMillis();
        String ticket ="";
                Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            String jsapiticket = jedis.get("wechat:rlab_jsapi_ticket");
            Map<String,Object> map = (Map) JsonMapper.json2obj(jsapiticket,HashMap.class);
            ticket = (String) map.get("ticket");
        } catch (JedisConnectionException e) {
            log.error("redis连接异常", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        //生成微信权限验证的参数
        Map<String, String> wechatParam= makeWXTicket(ticket,url);
        return wechatParam;
    }



    //生成微信权限验证的参数
    public Map<String, String> makeWXTicket(String jsApiTicket, String url) {
        Map<String, String> ret = new HashMap<String, String>();
        String nonceStr = createNonceStr();
        String timestamp = createTimestamp();
        String string1;
        String signature = "";

        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsApiTicket +
                "&noncestr=" + nonceStr +
                "&timestamp=" + timestamp +
                "&url=" + url;
//        log.info("String1=====>"+string1);
        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
//            log.info("signature=====>"+signature);
        }
        catch (NoSuchAlgorithmException e)
        {
//            log.error("WeChatController.makeWXTicket=====Start");
//            log.error(e.getMessage(),e);
//            log.error("WeChatController.makeWXTicket=====End");
        }
        catch (UnsupportedEncodingException e)
        {
//            log.error("WeChatController.makeWXTicket=====Start");
//            log.error(e.getMessage(),e);
//            log.error("WeChatController.makeWXTicket=====End");
        }

        ret.put("url", url);
        ret.put("jsapi_ticket", jsApiTicket);
        ret.put("nonceStr", nonceStr);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);
        ret.put("appid", appId);

        return ret;
    }
    //字节数组转换为十六进制字符串
    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }
    //生成随机字符串
    private static String createNonceStr() {
        return UUID.randomUUID().toString();
    }
    //生成时间戳
    private static String createTimestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }
}
