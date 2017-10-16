package com.renrenlab.cms.communication.exception.customerService;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 客服插入异常
 *
 * Created by guan on 2017/3/31.
 */
public class CustomerServiceInsertException extends RuntimeException {
	
	private static final long serialVersionUID = 1227060589453947547L;

	public CustomerServiceInsertException(ResponseMessage message) {
        super(message.getMessage());
    }
}
