package com.renrenlab.cms.communication.service;

import java.util.List;

import com.renrenlab.cms.communication.model.OrderCoupon;

/**
 * 优惠券
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface IOrderCouponService {

	List<OrderCoupon> selectAllByCoIds(List<Long> couponIds);
	
}
