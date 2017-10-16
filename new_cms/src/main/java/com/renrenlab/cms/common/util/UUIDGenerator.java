package com.renrenlab.cms.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UUIDGenerator {

	public static String getUUID() {    
        UUID uuid = UUID.randomUUID();    
        String str = uuid.toString();    
        // 去掉"-"符号    
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);    
        return temp;    
    }    
     
    public static String getWordName()   
    {  
        int num = (int) Math.round(Math.random()*90000+1);  
        return String.valueOf(num);    
    }  
    public static  String getOrderNo(){    
    	String orderNo = "" ;      
    	String trandNo = String.valueOf((Math.random() *9 + 1) * 1000000);   
    	String sdf = new SimpleDateFormat("yyyyMMddHHMMSS").format(new Date());     
    	orderNo = trandNo.toString().substring(0, 3);   
    	orderNo = orderNo + sdf ;    
    	return orderNo ;   
    	}

    public static void main(String[] args) {  
        getUUID();  
        getWordName();  
    }  

}
