package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrderCoupon;
import org.springframework.stereotype.Repository;

/**
 * 大学生创新券信息dao
 */
@Repository
public interface OrderCouponDao {
    int deleteByPrimaryKey(Long id);

    int insert(OrderCoupon record);

    int insertSelective(OrderCoupon record);

    OrderCoupon selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderCoupon record);

    int updateByPrimaryKey(OrderCoupon record);

    /**
     * 根据大学生创新券id获取创新券
     * @param cid
     * @return
     */
    OrderCoupon selectByCId(Long cid);
}