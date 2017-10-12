package com.renrenlab.rlab.common.util;

import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;

/**
 * Created by Administrator on 2017/7/31.
 */
public class UserUtil {

    public static String cutUserNickName(String nickName){
        String simple = nickName;
        if(!StringUtils.isBlank(nickName)){
            int count = 0;
            int i = 0;
            if(!"".equals(nickName)){
                while(count < 12 && i < nickName.length()){
                    char word = nickName.charAt(i);
                    if(word < 255){
                        count++;
                    }else{
                        count+=2;
                    }
                    i++;
                }
            }
            if(count == 13){
                i--;
            }
            simple = nickName.substring(0, i);
            if(i < nickName.length()){
                simple = simple + "...";
            }
        }
        return simple;
    }

    public static String toConvertShareIndex(Float shareIndex){
        if(shareIndex == null)return null;
        String str = shareIndex.toString();
        String prefix = str.substring(0, str.indexOf('.'));
        String suffix = str.substring(str.indexOf('.')+1);
        if(prefix.length() >= 4 || (suffix.length() == 1 && "0".equals(suffix)))return prefix;
        char[] c = new char[5];
        Arrays.fill(c, '0');
        int i = 0;
        while(i < prefix.length()){
            c[i] = prefix.charAt(i);
            i++;
        }
        c[i++] = '.';
        int j = 0;
        while(i < c.length && j < suffix.length()){
            c[i++] = suffix.charAt(j++);
        }
        return String.valueOf(c);
    }

}
