package com.renrenlab.cms.communication.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.communication.dao.OrderCouponDao;
import com.renrenlab.cms.communication.model.OrderCoupon;
import com.renrenlab.cms.communication.service.IOrderCouponService;

/**
 * 优惠券
 *
 * Created by lihongxun on 2017/5/16.
 */
@Service
public class OrderCouponServiceImpl implements IOrderCouponService {
	
	@Autowired
	private OrderCouponDao couponDao;
	/**
	 * 查询所有的大学生活动创新券
	 */
	@Override
	public List<OrderCoupon> selectAllByCoIds(List<Long> couponIds) {
		return couponDao.selectAllByCoIds(couponIds);
	}
}
