package com.renrenlab.cms.communication.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.communication.model.OrderBaseInfo;
import com.renrenlab.cms.communication.service.IOrderBaseInfoService;
import com.renrenlab.cms.communication.vo.OrderInfo;

/**
 * 订单管理
 *
 * Created by lihongxun on 2017/5/16.
 */
@Controller
@RequestMapping("/bg/api/order")
public class OrderController {

    static final Logger _LOG = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private IOrderBaseInfoService orderBaseInfoService;

    /**
     * 根据ID更新订单信息
     *
     * @param order
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> update(@RequestBody OrderBaseInfo order) {
        _LOG.info("invoke----------/order/update");
        try {
            orderBaseInfoService.updateByOIdSelective(order);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 根据ID查询订单详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> query(@RequestParam long id) {
        OrderInfo orderInfo = null;
        try {
            _LOG.info("invoke----------/order/query");
            OrderBaseInfo orderBaseInfo = orderBaseInfoService.selectByOId(id);
            orderInfo = orderBaseInfoService.mergeOrderAndScheme(orderBaseInfo);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse(orderInfo);
    }

    /**
     * 根据用户id 查询订单列表
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/queryorderlist", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> queryOrderList(@RequestParam long id) {
        List<OrderInfo> orderInfos = new ArrayList<>();
        try {
            _LOG.info("invoke----------/order/queryorderlist");
            orderInfos.addAll(orderBaseInfoService.getOrderList(id));
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse(orderInfos);
    }
}
