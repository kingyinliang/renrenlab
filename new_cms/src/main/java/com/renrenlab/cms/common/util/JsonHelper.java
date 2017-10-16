package com.renrenlab.cms.common.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
/**
 * 
 * @author fuyujie
 * Date 2017.04.27
 *
 */
public class JsonHelper {
private JsonHelper(){
}

public static String object2Str(Object obj){
	String str = "";
	ObjectMapper mapper = new ObjectMapper();
	try {
		str = mapper.writeValueAsString(obj);
	} catch (JsonProcessingException e) {
		e.printStackTrace();
	}
	return str;
}

public static Object str2Object(String str,Class<?> cls){
	Object retObj = null;
	ObjectMapper mapper = new ObjectMapper();
	try {
		retObj = mapper.readValue(str,cls);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return retObj;
}
}
