package com.renrenlab.cms.communication.exception.order;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 订单异常
 *
 * Created by Administrator on 2017/4/10.
 */
public class OrderException extends RuntimeException{

	private static final long serialVersionUID = -1296715087543683138L;

	public OrderException(ResponseMessage message) {
        super(message.getMessage());
    }
}
