package com.renrenlab.cms.wechat.service.impl;

import java.text.SimpleDateFormat;
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
import com.renrenlab.cms.common.util.UUIDGenerator;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dao.OrderBaseInfoDao;
import com.renrenlab.cms.communication.dao.OrderProjectDao;
import com.renrenlab.cms.communication.dao.OrderSchemeDao;
import com.renrenlab.cms.communication.dao.TmpAddrInfoDao;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserWxDao;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.communication.model.OrderBaseInfo;
import com.renrenlab.cms.communication.model.OrderProject;
import com.renrenlab.cms.communication.model.OrderScheme;
import com.renrenlab.cms.communication.model.TmpAddrInfo;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.service.IOrderBaseInfoService;
import com.renrenlab.cms.communication.vo.OrderInfo;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;
import com.renrenlab.cms.wechat.service.IWxOrderService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 微信订单service
 */
@Service("wxOrderService")
@Transactional
public class WxOrderServiceImpl implements IWxOrderService {
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private OrderSchemeDao orderSchemeDao;

	@Autowired
	private UserWxDao userWxDao;

	@Autowired
	private OrderProjectDao orderProjectDao;
	
	@Autowired
	private UserBaseInfoDao userBaseInfoDao;

	@Autowired
	private OrderBaseInfoDao orderBaseInfoDao;

	@Autowired
	private IOrderBaseInfoService orderBaseInfoService;
	@Autowired
	private TmpAddrInfoDao tmpAddrInfoDao;
	@Autowired
	private RefreshAccessTokenTask refreshAccessTokenTask;
	
	/**
	 * 微信下单 1.查询方案 2.查询项目信息 3.查询用户信息 4.插入订单
	 */
	@Override
	public Map<String, Object> wxCreateOrder(Long schId, String wxOpenId) {
		Map<String, Object> map = new HashMap<>();
		OrderBaseInfo order = null;
		// 查询方案信息
		log.debug("query scheme info");
		OrderScheme scheme = orderSchemeDao.selectBySchId(schId);
		log.debug(scheme.toString());
		map.put("scheme", scheme);
		// 查询项目信息
		OrderProject project = orderProjectDao.selectByPjId(scheme.getPjId());

		// 获取用户表信息
		Long uId = project.getuUid();
		UserBaseInfo user = userBaseInfoDao.selectByUId(uId);
		map.put("user", user);
		log.debug(user.toString());
		// 初始化订单
		order = intOrder(user, schId);
		order.setoOriginPrice(scheme.getSchPrice());
		order.setoPrice(scheme.getSchPrice());
		// 插入订单
		int result = orderBaseInfoDao.insertSelective(order);
		if (result <= 0) {
			log.debug("插入失败");
		}
		order = orderBaseInfoDao.selectByOId(order.getoId());

		map.put("order", order);
		// 发送模板消息
		postOrderToWechat(wxOpenId, order,scheme.getSchProject());
		// 返回数据
		return map;
	}

	/**
	 * 把用户信息.订单ID以及方案ID放入订单里
	 * 
	 * @param user
	 * @param schId
	 * @return
	 */
	private OrderBaseInfo intOrder(UserBaseInfo user, Long schId) {
		OrderBaseInfo order = new OrderBaseInfo();
		order.setSchId(schId);
		order.setuUid(user.getuUid());
		//TODO 用户临时地址
		TmpAddrInfo addr = tmpAddrInfoDao.selectByUserId(user.getuUid());
		if(addr != null)
			order.setoShippingAddress(addr.getuAddress());
		if(user.getuName() != null)
		    order.setoShippingName(user.getuName());
		order.setoShippingPhone(user.getuMobile());
		order.setoNo(Long.parseLong(UUIDGenerator.getOrderNo()));
		return order;
	}


	/**
	 * 发送订单消息给微信
	 * @param wxOpenId
	 * @param order
	 * @param proName
	 * @return
	 */
	public String postOrderToWechat(String wxOpenId,OrderBaseInfo order,String proName) {

		log.debug("invoke postOrderToWechat-----wxOpenId:"+wxOpenId+"order:"+order+"proName"+proName);
		String weChatUrl = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.SEND_TEMPLATE_MSG);

		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		Map<String, Object> map3 = new HashMap<>();
		Map<String, Object> map4 = new HashMap<>();
		Map<String, Object> map5 = new HashMap<>();
		Map<String, Object> map6 = new HashMap<>();
		Map<String, Object> map7 = new HashMap<>();

		String url = WeixinContext.getInstance().getBaseUrl() + "/wx/order/queryOrder.do?oId="+order.getoId();
		map.put("touser", wxOpenId);
		map.put("template_id", WeixinFinalValue.ORDERTEMPLATEID);
		map.put("url", url);
		
		map3.put("value", "恭喜您下单成功\n");
		map2.put("first", map3);
		
		map4.put("value", proName);
		map4.put("color", "#173177");
		map2.put("keyword1", map4);
		
		map5.put("value", order.getoNo());
		map5.put("color", "#173177");
		map2.put("keyword2", map5);
		
		map6.put("value", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getCreateTime()));
		map6.put("color", "#173177");
		map2.put("keyword3", map6);
		
		map7.put("value","如有问题，请联系人工客服！");
		map7.put("color", "#173177");
		map2.put("remark", map7);
		
		
		map.put("data", map2);
		String msgBody = JsonUtil.getInstance().obj2json(map);

		String rel = WeixinBasicUtil.sendJsonPost(weChatUrl, msgBody);

		 if (!WeixinBasicUtil.checkRequestSucc(rel)) {
         	if(WeixinBasicUtil.getRequestCode(rel)==WeixinFinalValue.INVALIDACCESSTOKEN){
     			refreshAccessTokenTask.refreshToken();
     			rel = WeixinBasicUtil.sendJsonPost(weChatUrl, msgBody);
     			if (WeixinBasicUtil.checkRequestSucc(rel)){
     				return "订单发送成功";
     			}
     		}
         	log.error("发布订单完成失败：" + WeixinBasicUtil.getRequestMsg(rel));
             throw new RuntimeException("发布订单完成失败：" + WeixinBasicUtil.getRequestMsg(rel));
         }
		return "订单发送成功";
	}

	/**
	 * 
	 * 查询列表不分页
	 */
	@Override
	public List<OrderInfo> queryOrderList(String wxOpenId) {
		log.debug("查找订单列表");
		List<OrderInfo> list = new ArrayList<OrderInfo>();
		// 获取微信用户信息
		UserWx userWx = userWxDao.selectByOpenId(wxOpenId);
		if (userWx == null) {
			return list;
		}
		list = orderBaseInfoService.getOrderList(userWx.getuUid());
		return list;
	}

	/**
	 * 查询订单详情
	 */
	@Override
	public Map<String, Object> queryOrderDetails(long oId) {
		Map<String, Object> map = new HashMap<>();
		//根据订单id查询订单信息
		OrderBaseInfo order = orderBaseInfoDao.selectByOId(oId);
		log.debug("查询订单详情"+order.toString());
		map.put("order", order);
		//查询方案信息
		OrderScheme scheme = orderSchemeDao.selectBySchId(order.getSchId());
		map.put("scheme", scheme);
		log.debug("方案详情"+scheme.toString());
		//查询用户信息
		UserBaseInfo user = userBaseInfoDao.selectByUId(order.getuUid());
		map.put("user", user);
		log.debug("用户详情"+user.toString());
		// 返回数据
		return map;
	}

	@Override
	public List<OrderScheme> findSchemes(Long[] ids) {
		log.debug("查找方案列表");
		List<OrderScheme> list = new ArrayList<>();
		for (Long sid : ids) {
			OrderScheme scheme = orderSchemeDao.selectBySchId(sid);
			list.add(scheme);
			
		}
		return list;
	}

}
