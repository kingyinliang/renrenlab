package com.renrenlab.cms.communication.service;

import java.util.List;
import java.util.Map;

import com.renrenlab.cms.communication.model.UserCouponMap;
import com.renrenlab.cms.communication.vo.CouponInfo;

public interface IUserCouponService {

	/**
	 * 处理用户与优惠券，标签的关联关系
	 * 
	 * @param wxOpenId
	 * @param uid
	 * @return
	 */
	int handlerRelation(String wxOpenId, Long uid);

	/**
	 * 发送优惠券
	 * 
	 * @param uid
	 * @return
	 */
	int SendCoupon(Long uid);

	/**
	 * 查询优惠券列表
	 * 
	 * @param openId
	 * @return
	 */
	List<CouponInfo> selectCouponList(String openId);

	/**
	 * 更新优惠券状态
	 * 
	 * @param userCoupon
	 */
	void updateCouponStatus(UserCouponMap userCoupon);

	/**
	 * 搜索得到用户优惠券
	 */
	Map<String, Object> searchCouponInfo(String searchMsg, Long coId, Integer pageNo, Integer pageSize);

}
