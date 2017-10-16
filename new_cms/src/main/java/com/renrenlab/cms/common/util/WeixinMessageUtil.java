package com.renrenlab.cms.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class WeixinMessageUtil {
	
	private static final Logger log = LoggerFactory.getLogger(WeixinMessageUtil.class);
	
	/**
	 * 将请求解析成xml形式
	 * @throws IOException 
	 */
	public static String req2xml(HttpServletRequest req){
		BufferedReader br = null;
		InputStreamReader in = null;
		StringBuffer sb = null;
		try {
			in = new InputStreamReader(req.getInputStream());
			br = new BufferedReader(in);
			String str = null;
			sb = new StringBuffer();
			while((str=br.readLine())!=null) {
				sb.append(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(in != null){
				 // 释放资源  
		        try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}  
			}
		}
		return sb.toString();
	}
	/**
	 * 将xml遍历生成map形式
	 * @throws IOException 
	 */
	public static Map<String,String> reqMsg2Map(HttpServletRequest req) {
		String xml = req2xml(req);
		try {
			Map<String,String> maps = new HashMap<String, String>();
			Document document = DocumentHelper.parseText(xml);
			Element root = document.getRootElement();
			@SuppressWarnings("unchecked")
			List<Element> eles = root.elements();
			for(Element e:eles) {
				maps.put(e.getName(), e.getTextTrim());
			}
			return maps;
		} catch (DocumentException e) {
			log.debug("解析xml时出错，异常是："+e);
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 将处理好的消息封装成xml返回给服务号
	 * @param map
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static String map2xmlChild(Map<String,Object> map,Element root)  {
		Set<String> keys = (Set<String>) map.keySet();
		for(String key:keys) {
			log.info("key="+key);
			Object value = map.get(key);
			Element element = root.addElement(key);
			if (value instanceof Map) {
				map2xmlChild((Map<String,Object>) value,element);
			} else {
				String v = (String)value;
				if((v).indexOf("<a")>=0) {
					element.addCDATA(v); 
				} else {
					element.addText(v);
				}
			}
			
		}
		return root.asXML();

	}
	
	/**
	 * 将处理好的消息封装成xml返回给服务号
	 * @param map
	 * @return
	 * @throws IOException
	 */
	public static String map2xml(Map<String,Object> map)  {
		Document d = DocumentHelper.createDocument();
		Element root = d.addElement("xml");
		String str = map2xmlChild(map,root);
		log.info("返回给微信："+str);
		return str;
	}
	
	
	/**
	 * 创建返回的文本消息
	 * @param msgMap
	 * @param content
	 * @return
	 */
	public static Map<String, Object> createTextMsg(Map<String, String> msgMap,
			String content) {
		
		Map<String,Object > tm = new HashMap<String,Object>();
		tm.put("ToUserName", msgMap.get("FromUserName"));
		tm.put("FromUserName", msgMap.get("ToUserName"));
		tm.put("CreateTime", System.currentTimeMillis()+"");
		tm.put("MsgType", "text");
		tm.put("Content", content);
		return tm;
	}
	
	/**
	 * 创建返回的图文消息
	 * 1条
	 * @param msgMap
	 * @param content
	 * @return
	 */
	public static Map<String, Object> createNewsMsg(Map<String, String> msgMap,
			String title,String description,String picUrl,String url) {
		
		Map<String,Object > tm = new HashMap<String,Object>();
		Map<String,Object > tm2 = new HashMap<String,Object>();
		Map<String,Object > tm3 = new HashMap<String,Object>();
		tm.put("ToUserName", msgMap.get("FromUserName"));
		tm.put("FromUserName", msgMap.get("ToUserName"));
		tm.put("CreateTime", System.currentTimeMillis()+"");
		tm.put("MsgType", "news");
		tm.put("ArticleCount", "1");
		tm.put("Articles", tm2);
		tm2.put("item", tm3);
		tm3.put("Title", title);
		tm3.put("Description",description);
		tm3.put("PicUrl", picUrl);
		tm3.put("Url", url);
		return tm;
	}
	/**
	 * 判断回复是否为空
	 * @param obj
	 * @return
	 */
	public static boolean isEmpty(Object obj) {
		if(obj==null) return true;
		if(obj instanceof String) {
			if("".equals(((String)obj).trim())) return true;
		}
		if(obj instanceof Integer) {
			if((Integer)obj==0) return true;
		}
		return false;
	}
	
}
