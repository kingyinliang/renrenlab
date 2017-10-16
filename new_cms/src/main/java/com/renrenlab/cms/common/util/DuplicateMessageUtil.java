package com.renrenlab.cms.common.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.renrenlab.cms.wechat.dto.DuplicateMessageDto;

/**
 * 消息排重
 * @author Renrenlab
 *
 */
public class DuplicateMessageUtil {
	public static final List<DuplicateMessageDto> MSGS = new ArrayList<DuplicateMessageDto>();
	
	public static boolean checkDuplicate(Map<String,String> msgMap) {
		DuplicateMessageDto dm = initDuplicateMessageDto(msgMap);
		if(MSGS.contains(dm)) {
			return true; 
		} else {
			MSGS.add(dm);
			return false;
		}
	}
	
	public static String getRel(Map<String,String> msgMap) {
		DuplicateMessageDto dm = initDuplicateMessageDto(msgMap);
		DuplicateMessageDto tdm = MSGS.get(MSGS.indexOf(dm));
		return tdm.getRel();
	}
	
	private static DuplicateMessageDto initDuplicateMessageDto(
			Map<String, String> msgMap) {

		String fromUserName = msgMap.get("FromUserName");
		String createTime = msgMap.get("CreateTime");
		String msgId = msgMap.get("MsgId");
		DuplicateMessageDto dm = new DuplicateMessageDto(fromUserName, createTime,msgId);
		return dm;
	}

	public static void setRel(Map<String,String> msgMap,String rel) {
		DuplicateMessageDto dm = initDuplicateMessageDto(msgMap);
		DuplicateMessageDto tdm = MSGS.get(MSGS.indexOf(dm));
		tdm.setRel(rel);
	}
	
	public static void clear() {
		DuplicateMessageDto dm = null;
		for(int i=0;i<MSGS.size();i++) {
			dm = MSGS.get(i);
			if(((System.currentTimeMillis()-dm.getCurTime())/1000)>30) {
				MSGS.remove(dm);
			}
		}
	}
}
