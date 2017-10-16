package com.renrenlab.cms.wechat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.renrenlab.cms.communication.model.OrderBaseInfo;
import com.renrenlab.cms.communication.model.OrderComment;
import com.renrenlab.cms.communication.service.IOrderBaseInfoService;
import com.renrenlab.cms.communication.service.IOrderCommentService;
import com.renrenlab.cms.communication.vo.OrderInfo;
import com.renrenlab.cms.wechat.service.IWxOrderService;

/**
 * 微信端订单controller
 */
@Controller
@RequestMapping("/wx/order")
public class WxOrderController{
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IOrderBaseInfoService orderBaseInfoService;
//
	@Autowired
	private IWxOrderService wxOrderService;
//
	@Autowired
	private IOrderCommentService commentService;

	/**
	 * 微信下单
	 *
	 * @param schId
	 * @return
	 */
	@RequestMapping(value = "/wxCreateOrder")
	public String wxCreateOrder(Model model, HttpSession session, RedirectAttributes attr, @RequestParam Long schId) {
		String openId = (String) session.getAttribute("OPENID");
		 //openId = "oFyI_xHRrak-l9ORRN5cRiMYwtuY";
		if (openId == null) {
			model.addAttribute("errorMsg", "请在微信端打开");
			return "/wechat/jsp/error";
		}
		// 如果此方案有订单信息，跳转到方案详情页
		OrderBaseInfo orderBaseInfo = orderBaseInfoService.selectByOpenIdAndSchId(openId, schId);
		log.info("invoke-------create order");
		// log.info(order.toString());
		if (orderBaseInfo == null) {
			model.addAttribute("orderInfo", wxOrderService.wxCreateOrder(schId, openId));
			return "/wechat/jsp/orderSuccess";
		}
		if (orderBaseInfo.getoState() == 2) {
			model.addAttribute("errorMsg", "订单已关闭，请联系客服重新下单");
			return "/wechat/jsp/error";
		}
		attr.addAttribute("oId", orderBaseInfo.getoId());
		return "redirect:/wx/order/queryOrder.do";

	}

	/**
	 * 查询列表不分页
	 * 
	 * @param model
	 * @param session
	 * @return String
	 */
	@RequestMapping("/queryOrderList")
	public String queryOrderList(Model model, HttpSession session) {
		String wxOpenId = (String) session.getAttribute("OPENID");
		log.info("微信openId为" + wxOpenId);
		if (wxOpenId == null) {
			model.addAttribute("errorMsg", "请在微信端打开");
			return "/wechat/jsp/error";
		}
		List<OrderInfo> list = wxOrderService.queryOrderList(wxOpenId);
		if(	list==null || list.isEmpty()){
			model.addAttribute("errorMsg", "暂无订单！请联系客服下单！");
			return "wechat/jsp/error";
		}
		model.addAttribute("orderList", list);
		return "wechat/jsp/orderList";
	}

	/**
	 * 根据订单ID查询订单详情
	 * 
	 * @param oId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/queryOrder", method = RequestMethod.GET)
	public String queryOrder(Model model, HttpSession session, @RequestParam long oId) {
		log.info("invoke-------query order details");
		OrderBaseInfo order=null;
		String openId = (String) session.getAttribute("OPENID");
		 //openId = "oFyI_xHRrak-l9ORRN5cRiMYwtuY";
		if (openId == null) {
			model.addAttribute("errorMsg", "请在微信端打开");
			return "/wechat/jsp/error";
		}
		try {
			order = orderBaseInfoService.selectByOId(oId);
			if (order.getoState() == 2) {
				model.addAttribute("errorMsg", "订单已关闭，请联系客服重新下单");
				return "/wechat/jsp/error";
			}
			model.addAttribute("orderInfo", wxOrderService.queryOrderDetails(oId));
			return "/wechat/jsp/orderDetails";
		} catch (Exception e) {
			log.error("根据订单ID查询订单详情出错，订单id=" + oId);
			throw new RuntimeException(e);
		}
	}

	/**
	 * 取消订单
	 * 
	 * @param oId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cancelOrder", method = RequestMethod.POST)
	@ResponseBody
	public String cancelOrder(Model model, HttpSession session, long oId) {
		log.info("invoke-----------cancel order");
		OrderBaseInfo order = new OrderBaseInfo();
		order.setoState(2);
		order.setoId(oId);
		log.info(order.toString());
		try {
			int flag = orderBaseInfoService.updateByOIdSelective(order);
			log.info("" + flag);
			return String.valueOf(flag);
		} catch (Exception e) {
			log.debug("取消订单时出现异常，订单id=" + oId);
			throw new RuntimeException(e);
		}

	}

	/**
	 * 评价订单
	 * 
	 * @param oId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/commentOrder", method = RequestMethod.GET)
	public String commentOrder(Model model, HttpSession session, @RequestParam long oId) throws Exception {
		log.info("invoke-----------turn to order commment");
		String openId = (String) session.getAttribute("OPENID");
		if (openId == null) {
			model.addAttribute("errorMsg", "请在微信端打开");
			return "/wechat/jsp/error";
		}

		OrderBaseInfo order = orderBaseInfoService.selectByOId(oId);
		if (order.getoState() != 1) {
			model.addAttribute("errorMsg", "只能评价已完成的订单");
			return "/wechat/jsp/error";
		}
		OrderComment comment = commentService.selectByOId(oId);
		if (comment != null) {
			model.addAttribute("errorMsg", "您已经评价过该单");
			return "/wechat/jsp/error";
		}
		model.addAttribute("orderInfo", wxOrderService.queryOrderDetails(oId));
		return "/wechat/jsp/comment";
	}

	/**
	 * 评价订单
	 * 
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/commitComment", method = RequestMethod.POST)
	@ResponseBody
	public String commitComment(@RequestBody OrderComment comment) {
		log.info("invoke-----------commit order commment");
		OrderComment com = commentService.selectByOId(comment.getoId());
		if(com==null){
			int flag = commentService.insertSelective(comment);
			log.info("" + flag);
			return String.valueOf(flag);
		}
		return "您已评价过该单 请勿重复评价";
	}
	
	/**
	 * 查询方案
	 */
	@RequestMapping("/scheme/list")
	public String list(Model model,Long[] ids) {
		log.info("invoke-------query scheme list");
		model.addAttribute("schemes", wxOrderService.findSchemes(ids));
		return "/wechat/jsp/plan";
	}

}
