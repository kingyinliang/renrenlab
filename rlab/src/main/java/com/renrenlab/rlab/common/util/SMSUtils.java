package com.renrenlab.rlab.common.util;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.renrenlab.rlab.common.constant.SmsConstant;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.dao.MessageInfoDao;
import com.renrenlab.rlab.model.MessageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Jason on 27-7-18.
 */
@Component
public class SMSUtils {

    private static SMSUtils smsUtils;
    private static Pattern p = Pattern.compile("^(13|15|18|14|17|19)\\d{9}$");
    private static String HUAXING = "华兴软通", ALIYUN = "阿里云";


    private static final Logger logger = LoggerFactory.getLogger(SMSUtils.class);
    @Autowired
    MessageInfoDao messageInfoDao;
    private static Map<String, String> map = new HashMap<>();

    // 华兴软通
    private static boolean sendByHuaxing(String phone, String message) {
        try {
            logger.debug("sending sms to {} ===>>>>>>", phone);
            // 以下为所需的参数,中文请先转为16进制再发送
            String strReg = "101100-WEB-HUAX-315123"; // 注册号（由华兴软通提供）
            String strPwd = "XSXAKVVP"; // 密码（由华兴软通提供）
            String strSourceAdd = ""; // 子通道号，可为空（预留参数一般为空）
            String strPhone = phone; // 手机号码，多个手机号用半角逗号分开，最多1000个
            String strContent = HttpSend.paraTo16(message); // 短信内容
            // 以下参数为服务器URL,以及发到服务器的参数
            String strSmsUrl = "http://www.stongnet.com/sdkhttp/sendsms.aspx";
            String strSmsParam = "reg=" + strReg + "&pwd=" + strPwd
                    + "&sourceadd=" + strSourceAdd + "&phone=" + strPhone
                    + "&content=" + strContent;
            ;
            // 发送短信
            String strRes = HttpSend.postSend(strSmsUrl, strSmsParam);
            saveResult(phone, message, strRes, HUAXING);
            logger.debug("sending sms to {} response : {}", phone, strRes);
            // 检查结果
            if (!strRes.startsWith("result=0")) {
                return false;
            }
        } catch (Exception e) {
            logger.error("failed sending sms to {}.", phone, e);
            saveResult(phone, message, e.toString(), HUAXING);
            return false;
        }
        return true;
    }

    static {
        map.put(SmsConstant.REQ_STATE_MODIFY, SmsConstant.SMS_115930224);
        map.put(SmsConstant.WILLBE_OUT_DATE, SmsConstant.SMS_117517666);
        map.put(SmsConstant.WILLBE_OUT_DATE2, SmsConstant.SMS_115920203);

        map.put(SmsConstant.COUPON_PASS, SmsConstant.SMS_116565209);
        map.put(SmsConstant.COUPON_NOT_PASS, SmsConstant.SMS_116580229);
        map.put(SmsConstant.PROJECT_PASS, SmsConstant.SMS_116561644);
        map.put(SmsConstant.PROJECT_NOT_PASS, SmsConstant.SMS_116581639);


    }

    public static boolean sendByAli(String phone, String template, String code) {
        //设置超时时间-可自行调整
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        //初始化ascClient需要的几个参数
        // 短信API产品名称（短信产品名固定，无需修改）
        final String product = "Dysmsapi";
        //短信API产品域名（接口地址固定，无需修改）
        final String domain = "dysmsapi.aliyuncs.com";
        //替换成你的AK
        // 你的accessKeyId,参考本文档步骤2
        final String accessKeyId = "LTAIrxmI3QEf9MCP";
        //你的accessKeySecret，参考本文档步骤2
        final String accessKeySecret = "iwubK1BjPrhKRyXApfZThMvYSImzOc";
        //初始化ascClient,暂时不支持多region（请勿修改）
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,
                accessKeySecret);
        try {
            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
            IAcsClient acsClient = new DefaultAcsClient(profile);
            //组装请求对象
            SendSmsRequest request = new SendSmsRequest();
            //使用post提交
            request.setMethod(MethodType.POST);
            //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
            request.setPhoneNumbers(phone);
            //必填:短信签名-可在短信控制台中找到
            request.setSignName("人人实验");
            //必填:短信模板-可在短信控制台中找到
            request.setTemplateCode(template);
            //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
            //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
            if (code != null) {
//              request.setTemplateParam("{\"code\":" + code + "}");
                Map<String, Object> map = new HashMap<>();
                map.put("code", code);
                request.setTemplateParam(JSONObject.toJSONString(map));

            }
            //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
            //request.setSmsUpExtendCode("90997");
            //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
            //request.setOutId("yourOutId");
            //请求失败这里会抛ClientException异常
            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
            saveResult(phone, code + template + map.get(template), JSONObject.toJSON(sendSmsResponse).toString(), ALIYUN);
            if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
                //请求成功
                logger.debug(sendSmsResponse.toString());
                return true;
            }
        } catch (ClientException e) {
            logger.error(e.getMessage());
            saveResult(phone, code + template + map.get(template), e.toString(), ALIYUN);
            return false;
        }
        return false;
    }

    /**
     * @param mobile
     * @param template 短信消息
     * @param code     短信中的可变量
     * @return
     */
    public static boolean sendMessage(String mobile, String template, String code) {
        Matcher m = p.matcher(mobile);
        if (!m.matches()) {
            throw new BusinessException(ResponseEntity.USER_PHONE_ILLEGAL);
        }
        //如果是开发或者测试环境 （非正式环境）
        switch (ConfigUtil.getProperty("env")) {
            //开发环境
            case "1":
                mobile = "18618152314";
                System.out.println("=============================================开发环境不真发短信啦");
                return true;
//                break;
            //测试环境
            case "2":
                mobile = "18618152314";
                break;
            //正式环境
            case "3":
                break;
            default:
                break;
        }
        int randInt = new Random().nextInt(2);
        int retry = 0;
        boolean isSucess = false;
        do {
            if (randInt % 2 == 1) {
                isSucess = sendByAli(mobile, map.get(template), code);
            } else {
                isSucess = sendByHuaxing(mobile, template);
            }
            randInt++;
            retry++;
        } while (retry < 3 && !isSucess);
        return isSucess;
    }

    public static boolean sendMessage(String mobile, String template) {
        return sendMessage(mobile, template, null);
    }

    /**
     * @param phone
     * @param message
     * @param result
     * @param flag    阿里云,华兴软通
     */
    private static void saveResult(String phone, String message, String result, String flag) {
        MessageInfo messageInfo = new MessageInfo();
        messageInfo.setmPhone(phone);
        messageInfo.setmMessage(message);
        messageInfo.setmCallback(result);
        messageInfo.setmSendBy(flag);
        //获得本机外网ip
        messageInfo.setmIp(CustomSystemUtil.OUTERNET_IP);
        smsUtils.messageInfoDao.insertSelective(messageInfo);
    }

    @PostConstruct
    public void init() {
        smsUtils = this;
        smsUtils.messageInfoDao = this.messageInfoDao;
    }
}
