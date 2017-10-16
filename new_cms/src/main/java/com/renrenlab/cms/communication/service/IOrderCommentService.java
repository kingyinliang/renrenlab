package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.OrderComment;

/**
 * 评论
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface IOrderCommentService {

	OrderComment selectByOId(long oId);

	int insertSelective(OrderComment comment);
	
	
}
