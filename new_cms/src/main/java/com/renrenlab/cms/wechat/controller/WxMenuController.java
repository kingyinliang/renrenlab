package com.renrenlab.cms.wechat.controller;

import com.renrenlab.cms.communication.model.WxMenu;
import com.renrenlab.cms.wechat.service.IWxMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/wx/weixinMenu")
@Controller
public class WxMenuController {
	
	@Autowired
	private IWxMenuService wxmenuService;
	
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest req, HttpServletResponse resp) {
		model.addAttribute("menus", wxmenuService.listAll());
		model.addAttribute("wmds", wxmenuService.generateWeixinMenuDto());
		return "/wechat/jsp/weixinMenu/list";
	}
	
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("menu", new WxMenu());
		return "/wechat/jsp/weixinMenu/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(WxMenu menu) {
		wxmenuService.insertSelective(menu);
		return "redirect:/wx/weixinMenu/list.do";
	}

	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(@PathVariable Long id,Model model) {
		model.addAttribute("menu", wxmenuService.selectByPrimaryKey(id));
		return "/wechat/jsp/weixinMenu/add";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String update(@PathVariable Long id,WxMenu menu) {
		WxMenu twm = wxmenuService.selectByPrimaryKey(id);
		twm.setWmSeq(menu.getWmSeq());
		twm.setWmContent(menu.getWmContent());
		twm.setWmMenuKey(menu.getWmMenuKey());
		twm.setWmName(menu.getWmName());
		twm.setWmRespType(menu.getWmRespType());
		twm.setWmRespType(menu.getWmRespType());
		twm.setWmUrl(menu.getWmUrl());
		twm.setWmRespType(menu.getWmRespType());
		wxmenuService.updateByPrimaryKeySelective(twm);
		return "redirect:/wx/weixinMenu/list.do";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String delete(@PathVariable Long id,Model model) {
		wxmenuService.deleteByPrimaryKey(id);
		return "redirect:/wx/weixinMenu/list.do";
	}

	@RequestMapping("/queryPublishMenu")
	public String queryPublish(Model model) {
		model.addAttribute("ms", wxmenuService.queryMenu());
		return "/wechat/jsp/weixinMenu/publish";
	}
	
	@RequestMapping("/publishMenu")
	public String publishMenu() {
		wxmenuService.publishMenu();
		return "redirect:/wx/weixinMenu/queryPublishMenu.do";
	}
	
}
