package com.renrenlab.cms.wechat.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dao.WxMenuDao;
import com.renrenlab.cms.communication.model.WxMenu;
import com.renrenlab.cms.wechat.dto.WeixinMenuDto;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;
import com.renrenlab.cms.wechat.service.IWxMenuService;


/**
 *微信用户service
 */
@Service("wxMenuService")
public class WxMenuServiceImpl implements IWxMenuService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private WxMenuDao wxMenuDao;
	
	@Autowired
	private RefreshAccessTokenTask refreshAccessTokenTask;
	
	/**
	 * 调用微信接口创建服务号菜单
	 */
	@Override
	public void publishMenu() {
		String url = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.MENU_ADD);
		List<WeixinMenuDto> wmds = generateWeixinMenuDto();
		Map<String,List<WeixinMenuDto>> maps = new HashMap<String,List<WeixinMenuDto>>();
		maps.put("button", wmds);
		String json =  JsonUtil.getInstance().obj2json(maps);
		String rel = WeixinBasicUtil.sendJsonPost(url,json);
		if(!WeixinBasicUtil.checkRequestSucc(rel)) {
			if(WeixinBasicUtil.getRequestCode(rel)==WeixinFinalValue.INVALIDACCESSTOKEN){
				log.debug("accesstoken失效，重新刷新");
    			refreshAccessTokenTask.refreshToken();
    			rel=WeixinBasicUtil.sendJsonPost(url,json);
    		}
        	if(!WeixinBasicUtil.checkRequestSucc(rel)){
        		log.error("发布菜单失败："+WeixinBasicUtil.getRequestMsg(rel));
        		throw new RuntimeException("发布菜单失败："+WeixinBasicUtil.getRequestMsg(rel));
        	}
			
		}
	}
	/**
	 * 调用微信接口查询服务号菜单
	 */
	@Override
	public String queryMenu() {
		String url = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.MENU_QUERY);
		return WeixinBasicUtil.sendGet(url);
	}
	
	/**
	 * 生成符合微信格式的dto集合
	 */
	public List<WeixinMenuDto> generateWeixinMenuDto() {
		List<WxMenu> menus = this.listAll();
		List<WeixinMenuDto> menuDtos = new ArrayList<WeixinMenuDto>();
		WeixinMenuDto wmd = null;
		for(WxMenu wm:menus) {
			wmd = new WeixinMenuDto();
			wmd.setKey(wm.getWmMenuKey());
			wmd.setName(wm.getWmName());
			wmd.setType(wm.getWmType());
			wmd.setId(wm.getId());
			wmd.setUrl(wm.getWmUrl());
			if(wm.getWmPid()==null||wm.getWmPid()==0) {
				if(wmd.getSub_button()==null) {
					wmd.setSub_button(new ArrayList<WeixinMenuDto>());
				}
				menuDtos.add(wmd);
			} else {
				WeixinMenuDto twmd =findById(wm.getWmPid(), menuDtos); 
				if(twmd==null) throw new RuntimeException("菜单的父类对象有问题，请检查");
				twmd.getSub_button().add(wmd);
			}
		}
		return menuDtos;
	}
	
	private WeixinMenuDto findById(Long id,List<WeixinMenuDto> wmds) {
		for(WeixinMenuDto wmd:wmds) {
			if(wmd.getId()==id) {
				return wmd;
			}
		}
		return null;
	}
	
	/**
	 * 插入全部属性到微信菜单表
	 */
	@Override
	public int insert(WxMenu wxMenu) {
		if(wxMenu.getWmType().equals("click"))
			wxMenu.setWmMenuKey("KEY_"+System.currentTimeMillis());
		return wxMenuDao.insert(wxMenu);
	}
	/**
	 * 有选择插入微信菜单表
	 */
	@Override
	public int insertSelective(WxMenu wxMenu) {
		if(wxMenu.getWmType().equals("click"))
			wxMenu.setWmMenuKey("KEY_"+System.currentTimeMillis());
		return wxMenuDao.insertSelective(wxMenu);
	}
	/**
	 * 根据主键删除微信菜单表
	 */
	@Override
	public int deleteByPrimaryKey(Long id) {
		return wxMenuDao.deleteByPrimaryKey(id);
	}
	/**
	 * 根据主键更新微信菜单表有选择条件
	 */
	@Override
	public int updateByPrimaryKeySelective(WxMenu wxMenu) {
		return wxMenuDao.updateByPrimaryKeySelective(wxMenu);
	}
	/**
	 * 根据主键更新微信菜单表
	 */
	@Override
	public int updateByPrimaryKey(WxMenu wxMenu) {
		return wxMenuDao.updateByPrimaryKey(wxMenu);
	}
	/**
	 * 根据menuKey查询菜单
	 */
	@Override
	public WxMenu selectByWmMenuKey(String wmMenuKey) {
		return wxMenuDao.selectByWmMenuKey(wmMenuKey);
	}
	/**
	 * 根据主键查询表菜单
	 */
	@Override
	public WxMenu selectByPrimaryKey(Long id) {
		return wxMenuDao.selectByPrimaryKey(id);
	}
	/**
	 * 显示微信菜单数据库列表
	 */
	@Override
	public List<WxMenu> listAll() {
		return wxMenuDao.listAll();
	}
	

}
