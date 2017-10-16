package com.renrenlab.cms.communication.dao;

import java.util.List;

import com.renrenlab.cms.communication.model.OrderCoupon;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderCouponDao {
    int deleteByPrimaryKey(Long id);

    int insert(OrderCoupon record);

    int insertSelective(OrderCoupon record);

    OrderCoupon selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderCoupon record);

    int updateByPrimaryKey(OrderCoupon record);

	OrderCoupon selectByCoId(Long coId);

	List<OrderCoupon> selectAllByCoIds(List<Long> couponIds);

	void updateByCoId(OrderCoupon coupon);
}