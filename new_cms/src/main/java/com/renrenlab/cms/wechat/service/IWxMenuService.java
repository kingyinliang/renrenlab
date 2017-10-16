package com.renrenlab.cms.wechat.service;

import java.util.List;

import com.renrenlab.cms.communication.model.WxMenu;
import com.renrenlab.cms.wechat.dto.WeixinMenuDto;


public interface IWxMenuService {

	void publishMenu();
	
	String queryMenu();
	
	int insert(WxMenu WxMenu);
	
	int insertSelective(WxMenu WxMenu);
	
	int deleteByPrimaryKey(Long id);
	
	int updateByPrimaryKeySelective(WxMenu WxMenu);
	
	int updateByPrimaryKey(WxMenu WxMenu);
	
	WxMenu selectByWmMenuKey(String wmMenuKey);
	
	WxMenu selectByPrimaryKey(Long id);

	List<WxMenu> listAll();

	List<WeixinMenuDto> generateWeixinMenuDto();
	

}
