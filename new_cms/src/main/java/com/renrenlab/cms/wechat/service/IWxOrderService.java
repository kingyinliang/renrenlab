package com.renrenlab.cms.wechat.service;

import java.util.List;
import java.util.Map;

import com.renrenlab.cms.communication.model.OrderScheme;
import com.renrenlab.cms.communication.vo.OrderInfo;

public interface IWxOrderService {
	/**
	 * 微信下单
	 * 
	 * @param schId
	 *            方案id
	 * @param wxOpenId
	 *            用户wxOpenId
	 * @return
	 */
	Map<String, Object> wxCreateOrder(Long schId, String wxOpenId);

	/**
	 * 查询列表不分页
	 * 
	 * @param wxOpenId
	 * @return
	 */
	List<OrderInfo> queryOrderList(String wxOpenId);

	/**
	 * 查看订单详情
	 * @param oId
	 * @return
	 */
	Map<String, Object> queryOrderDetails(long oId);

	List<OrderScheme> findSchemes(Long[] ids);
	
	


}
