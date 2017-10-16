package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.OrderBaseInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderBaseInfoDao {

    /**
     * 根据订单ID更新订单状态和修该订单价格
     *
     * @param order
     * @return
     */
    int updateByOIdSelective(OrderBaseInfo order);

    /**
     * 通过订单ID查询订单详情
     *
     * @param id
     * @return
     */
    OrderBaseInfo selectByOId(Long id);

    /**
     * 通过用户ID和方案id查询订单详情
     *
     * @param uId
     * @param schId
     * @return
     */
    OrderBaseInfo selectByUIdAndSchId(@Param("uId") Long uId, @Param("schId")Long schId);

    /**
     * 插入
     *
     * @param order
     * @return
     */
    int insertSelective(OrderBaseInfo order);

    /**
     * 根据UId查询
     *
     * @param uId
     * @return
     */
    List<OrderBaseInfo> selectByUId(Long uId);
}