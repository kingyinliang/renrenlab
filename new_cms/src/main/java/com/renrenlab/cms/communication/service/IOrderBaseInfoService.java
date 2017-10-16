package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.OrderBaseInfo;
import com.renrenlab.cms.communication.vo.OrderInfo;

import java.util.List;

/**
 * 订单基本信息
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface IOrderBaseInfoService {

    /**
     * 更新订单信息
     *
     * @param orderBaseInfo
     * @return
     */
    int updateByOIdSelective(OrderBaseInfo orderBaseInfo);

    /**
     * 根据订单Id查询订单详情
     *
     * @param id
     * @return
     * @throws Exception
     */
    OrderBaseInfo selectByOId(Long id) throws Exception;

    /**
     * 通过用户openId和方案id查询订单详情
     * @param openId
     * @param schId
     * @return
     */
    OrderBaseInfo selectByOpenIdAndSchId(String openId,Long schId);

    /**
     * 根据用户id查询订单列表
     *
     * @return
     */
    List<OrderInfo> getOrderList(Long u_id);

    OrderInfo mergeOrderAndScheme(OrderBaseInfo orderBaseInfo);

}
