package com.renrenlab.rlab.common.util;

import java.io.IOException;
import java.io.StringWriter;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

public class JsonMapper {
	
	private volatile static ObjectMapper singleMapper;
	
	private JsonMapper(){}
	
	public static ObjectMapper getInstance(){
		if(singleMapper == null){
			synchronized(JsonMapper.class){
				singleMapper =  new ObjectMapper();
				singleMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
				singleMapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			}
		}
		return singleMapper;
	}
	
	public static String getJsonString(Object obj) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		JsonGenerator gen = new JsonFactory().createJsonGenerator(writer);
		mapper.writeValue(gen, obj);
		gen.close();
		String json = writer.toString();
		writer.close();
		return json;
	}
	
	/**
	 * json转成对象
	 * @param json
	 * @param clz
	 * @return
	 */
	public static Object json2obj(String json,Class<?> clz) {
		try {
			singleMapper = getInstance();
			return singleMapper.readValue(json,clz);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
