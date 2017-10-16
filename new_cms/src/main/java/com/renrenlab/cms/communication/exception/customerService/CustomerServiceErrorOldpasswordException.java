package com.renrenlab.cms.communication.exception.customerService;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 旧密码不匹配异常
 *
 * Created by guan on 2017/3/31.
 */
public class CustomerServiceErrorOldpasswordException extends RuntimeException {
	
	private static final long serialVersionUID = 5478017060291458729L;

	public CustomerServiceErrorOldpasswordException(ResponseMessage message) {
        super(message.getMessage());
    }
}
