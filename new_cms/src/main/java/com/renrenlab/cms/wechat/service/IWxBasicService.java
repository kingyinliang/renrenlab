package com.renrenlab.cms.wechat.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

public interface IWxBasicService {

	String basicService(HttpServletRequest request) throws IOException;

	int sendMsgToAll();

}
