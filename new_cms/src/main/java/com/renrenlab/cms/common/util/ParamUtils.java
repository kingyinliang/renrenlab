package com.renrenlab.cms.common.util;

import java.net.URLDecoder;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.util.TextUtils;

import com.renrenlab.cms.communication.exception.ParameterException;
import com.renrenlab.cms.communication.model.VerifyCode;



public class ParamUtils {

	//和客户端保持一致
	//public static final String MOBILE_NUMBER_MATCH = "^((13[0-9])|(15[^4\\D])|(18[0-9]))\\d{8}$";
	public static final String MOBILE_NUMBER_MATCH = "^(13|15|18|14|17)\\d{9}$";
	
	private static final String MOBILENUMBER_MISS = "请输入手机号";
	private static final String MOBILENUMBER_INVALID = "请输入真实的手机号";
	//private static final String VERICODE_FREQUENCY = "获取验证码太频繁，请稍后重试";
	private static final String VERICODE_INVALID = "验证码错误，请重新输入";
	private static final String VERICODE_EXPIRED = "验证码已过期，请重新获取";
	
	public static final Long VERICODE_TIME = 600L; // 验证码有效时间
	
	public static String makeFilterStr(String filter){
		return "%" + decodeUrlParam(filter) + "%";
	}
	
	public static String decodeUrlParam(String param){
		String decoded = param;
		try{
			if(param == null || param.equals("")){
				decoded = "";
			}else{
				decoded = URLDecoder.decode(param, "utf-8");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return decoded;
	}

	public static void validateMobileNumber(String number) throws ParameterException {
		if(number == null){
			throw new ParameterException(MOBILENUMBER_MISS); 
		}
		if(!isMobileNumber(number)){
			throw new ParameterException(MOBILENUMBER_INVALID); 
		}
		return;
	}
	
	public static Boolean validateIMGVerifyCode(VerifyCode vc,String validateCode) throws ParameterException {
		//用户获取手机验证码的间隔应当大于1分钟
		Boolean retB = false;
		long vcTime = vc.getvDeadline();
		long sysTiem = System.currentTimeMillis() + (VERICODE_TIME - 60) * 1000;
		if(vc != null && vcTime > sysTiem && !vc.getvGraphcode().equals(validateCode)){
			return retB = true; //大于1分钟返回true
		}
		return retB;
	}
	
	public static void validateVerifyCode(VerifyCode vc, String vericode) throws ParameterException {
		if(vc != null){
			if(!vc.getvSmscode().equalsIgnoreCase(vericode)){
				throw new ParameterException(VERICODE_INVALID); 
			}else if(vc.getvDeadline() < System.currentTimeMillis()){
				throw new ParameterException(VERICODE_EXPIRED); 
			}
		}else{
			throw new ParameterException(VERICODE_INVALID); 
		}
		return;
	}
	
	//veripic is generated and saved in session, vericode is input by user
	public static void validateVerifyCode(String veripic, String vericode) throws ParameterException {
		if(veripic == null || vericode == null || !veripic.equalsIgnoreCase(vericode)){
			throw new ParameterException(VERICODE_INVALID); 
		}
		return;
	}
	
	/**
	 * 以13、18开头的11位数字
	 * 以15开头的后边不是4，并且是数字的11位数字
	 */
	//简化为13|15|18|14|17开头的11位数字
	private static boolean isMobileNumber(String mobiles) {
		Pattern p = Pattern.compile(MOBILE_NUMBER_MATCH);
		Matcher m = p.matcher(mobiles);
		return m.matches();
	}
	
	
	public static String getMobileLast4(String mobile) {
		if (!TextUtils.isEmpty(mobile) && mobile.length() > 4) {
			return mobile.substring(mobile.length()-4);
		}
		return mobile;
	}
	
	public static String HideStr(String param) {
		String s = "";
		if (param.length() > 1) {
			s = param.substring(0,1) + "***";
		}else {
			s = "***";
		}
		return s;
	}
	
	public static String getRandom(){
		char[] chars = new char[62];
        char fword = 'A';
        char mword = 'a';
        char bword = '0';
        for (int i = 0; i < 62; i++) {
            if (i < 26) {
            	chars[i] = fword;
                fword++;
            }else if(i<52){
            	chars[i] = mword;
                mword++;
            }else{
            	chars[i] = bword;
                bword++;
            }
        }
        StringBuffer s = new StringBuffer();
        Random r = new Random();
        char[] myChars= new char[8];
        for(int i=0;i<myChars.length;i++){
            int num = r.nextInt(62);
            s.append(chars[num]);
        }
        return s.toString();
        
    }
     
}
