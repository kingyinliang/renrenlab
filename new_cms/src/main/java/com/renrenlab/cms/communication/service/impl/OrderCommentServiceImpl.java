package com.renrenlab.cms.communication.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.communication.dao.OrderCommentDao;
import com.renrenlab.cms.communication.model.OrderComment;
import com.renrenlab.cms.communication.service.IOrderCommentService;

/**
 * 订单评论
 *
 * Created by lihongxun on 2017/5/16.
 */
@Service
public class OrderCommentServiceImpl implements IOrderCommentService {
	
	@Autowired
	private OrderCommentDao commentDao;

	@Override
	public OrderComment selectByOId(long oId) {
		return commentDao.selectByOId(oId);
	}

	@Override
	public int insertSelective(OrderComment comment) {
		return commentDao.insertSelective(comment);
	}
}
