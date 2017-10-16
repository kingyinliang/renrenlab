package com.renrenlab.cms.communication.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.renrenlab.cms.communication.vo.SchemeInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dao.OrderBaseInfoDao;
import com.renrenlab.cms.communication.dao.OrderSchemeDao;
import com.renrenlab.cms.communication.dao.UserWxDao;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.communication.exception.ResponseMessage;
import com.renrenlab.cms.communication.exception.order.OrderException;
import com.renrenlab.cms.communication.model.OrderBaseInfo;
import com.renrenlab.cms.communication.model.OrderScheme;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.service.IOrderBaseInfoService;
import com.renrenlab.cms.communication.vo.OrderInfo;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单基本信息
 *
 * Created by lihongxun on 2017/5/16.
 */
@Service
@Transactional
public class OrderBaseInfoServiceImpl implements IOrderBaseInfoService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrderBaseInfoDao orderBaseInfoDao;
    @Autowired
    private UserWxDao userWxDao;
    @Autowired
    private OrderSchemeDao orderSchemeDao;
    @Autowired
	private RefreshAccessTokenTask refreshAccessTokenTask;
    
    @Override
    public int updateByOIdSelective(OrderBaseInfo orderBaseInfo) {
        OrderBaseInfo oldOrder = orderBaseInfoDao.selectByOId(orderBaseInfo.getoId());

        if(oldOrder != null && oldOrder.getoState() == 1 || oldOrder.getoState() == 2){
            throw new OrderException(ResponseMessage.ORDER_ERROR);
        }

        int a = orderBaseInfoDao.updateByOIdSelective(orderBaseInfo);

        OrderBaseInfo newOrder = orderBaseInfoDao.selectByOId(orderBaseInfo.getoId());

        if (orderBaseInfo.getoPrice() != null) {
            UserWx userWx = userWxDao.selectChatUserByUuId(newOrder.getuUid());
            String openId = userWx.getWxOpenId();
            String url = WeixinContext.getInstance().getBaseUrl() + "/wx/order/queryOrder.do?oId=" + newOrder.getoId();
            String weChatUrl = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.ADD_MESSAGE);

            Map<String, Object> map = new HashMap<String, Object>();
            Map<String, Object> map1 = new HashMap<String, Object>();
            map.put("touser", openId);
            map.put("msgtype", "text");
            map1.put("content", "您好，您的订单产生了新动态，请查看\n<a href=\"" + url + "\">点击查看订单</a>");
            map.put("text", map1);

            String rel = WeixinBasicUtil.sendJsonPost(weChatUrl, JsonUtil.getInstance().obj2json(map));
            if (!WeixinBasicUtil.checkRequestSucc(rel)) {
                throw new RuntimeException("改价通知发送失败：" + WeixinBasicUtil.getRequestMsg(rel));
            }
        }
        if (newOrder.getoState() == 1) {
            UserWx userWx = userWxDao.selectChatUserByUuId(newOrder.getuUid());
            String openId = userWx.getWxOpenId();
            String weChatUrl = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.SEND_TEMPLATE_MSG);
            String url = WeixinContext.getInstance().getBaseUrl() + "/wx/order/commentOrder.do?oId=" + orderBaseInfo.getoId();

            Map<String, Object> map = new HashMap<String, Object>();
            Map<String, Object> map2 = new HashMap<String, Object>();
            Map<String, Object> map3 = new HashMap<String, Object>();
            Map<String, Object> map5 = new HashMap<String, Object>();
            Map<String, Object> map6 = new HashMap<String, Object>();
            Map<String, Object> map7 = new HashMap<String, Object>();

            map.put("touser", openId);
            map.put("template_id", WeixinFinalValue.ORDERSTATETEMPLATEID);
            map.put("url", url);

            map3.put("value", "您好，您的订单已完成,人人实验诚邀您对我们的服务进行评价！\n");
            map2.put("first", map3);

            //根据订单方案id  shcId 查询项目名称


            map5.put("value", newOrder.getoNo());
            map5.put("color", "#173177");
            map2.put("keyword1", map5);

            map6.put("value", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(newOrder.getCreateTime()));
            map6.put("color", "#173177");
            map2.put("keyword2", map6);

            map7.put("value", "如有问题，请联系人工客服！");
            map7.put("color", "#173177");
            map2.put("remark", map7);


            map.put("data", map2);
            String msgBody = JsonUtil.getInstance().obj2json(map);
            String rel = WeixinBasicUtil.sendJsonPost(weChatUrl, msgBody);
            if (!WeixinBasicUtil.checkRequestSucc(rel)) {
            	if(WeixinBasicUtil.getRequestCode(rel)==WeixinFinalValue.INVALIDACCESSTOKEN){
        			refreshAccessTokenTask.refreshToken();
        			rel=WeixinBasicUtil.sendJsonPost(weChatUrl, msgBody);
        			if(WeixinBasicUtil.checkRequestSucc(rel)){
        				return a;
        			}
        		}
            	log.error("发布订单完成失败：" + WeixinBasicUtil.getRequestMsg(rel));
                throw new RuntimeException("发布订单完成失败：" + WeixinBasicUtil.getRequestMsg(rel));
            }
        }
        return a;
    }

    @Override
    public OrderBaseInfo selectByOId(Long id) throws Exception {
        return orderBaseInfoDao.selectByOId(id);
    }

    @Override
    public OrderBaseInfo selectByOpenIdAndSchId(String openId, Long schId) {
        UserWx wxUser = userWxDao.selectByOpenId(openId);
        return orderBaseInfoDao.selectByUIdAndSchId(wxUser.getuUid(), schId);
    }

    @Override
    public List<OrderInfo> getOrderList(Long u_id) {
        List<OrderBaseInfo> orderList = orderBaseInfoDao.selectByUId(u_id);
        List<OrderInfo> orderInfoList = new ArrayList<>();
        for (OrderBaseInfo order : orderList) {
            OrderInfo orderInfo = mergeOrderAndScheme(order);
            orderInfoList.add(orderInfo);
        }
        return orderInfoList;
    }

    @Override
    public OrderInfo mergeOrderAndScheme(OrderBaseInfo orderBaseInfo) {
        SchemeInfo scheme = orderSchemeDao.selectBySchId2(orderBaseInfo.getSchId()); // 根据方案id查方案表
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setoId(orderBaseInfo.getoId());
        orderInfo.setoNo(orderBaseInfo.getoNo());
        orderInfo.setSchId(orderBaseInfo.getSchId());
        orderInfo.setoState(orderBaseInfo.getoState());
        orderInfo.setoOriginPrice(orderBaseInfo.getoOriginPrice());
        orderInfo.setoPrice(orderBaseInfo.getoPrice());
        orderInfo.setoShippingName(orderBaseInfo.getoShippingName());
        orderInfo.setoShippingPhone(orderBaseInfo.getoShippingPhone());
        orderInfo.setoShippingAddress(orderBaseInfo.getoShippingAddress());
        orderInfo.setoType(orderBaseInfo.getoType());
        orderInfo.setCreateTime(orderBaseInfo.getCreateTime());

        orderInfo.setSchProject(scheme.getSchProject());
        orderInfo.setSchOrganization(scheme.getSchOrganization());
        orderInfo.setSchStandard(scheme.getSchStandard());
        orderInfo.setSchInstrument(scheme.getSchInstrument());
        orderInfo.setSchQualifications(scheme.getSchQualifications());
        orderInfo.setSchPeriod(scheme.getSchPeriod());
        orderInfo.setSchDistance(scheme.getSchDistance().toString());
        orderInfo.setSchOfferService(Integer.valueOf(scheme.getSchOfferService()));
        return orderInfo;
    }
}
