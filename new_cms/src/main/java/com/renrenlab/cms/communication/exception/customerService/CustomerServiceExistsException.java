package com.renrenlab.cms.communication.exception.customerService;

import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 客服已存在异常
 *
 * Created by guan on 2017/3/31.
 */
public class CustomerServiceExistsException extends RuntimeException {
	
	private static final long serialVersionUID = 8111929461898188349L;

	public CustomerServiceExistsException(ResponseMessage message) {
        super(message.getMessage());
    }
}
