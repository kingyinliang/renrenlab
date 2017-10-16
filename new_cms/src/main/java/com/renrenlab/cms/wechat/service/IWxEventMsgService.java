package com.renrenlab.cms.wechat.service;

import java.util.Map;

public interface IWxEventMsgService {

	String handlerEventMsg(Map<String, String> msgMap);

}
