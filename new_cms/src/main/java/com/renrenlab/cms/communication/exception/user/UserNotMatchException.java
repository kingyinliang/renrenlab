package com.renrenlab.cms.communication.exception.user;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 用户不匹配异常
 */
public class UserNotMatchException extends RuntimeException {
	
	private static final long serialVersionUID = -5302614516695862026L;

	public UserNotMatchException(ResponseMessage message) {
        super(message.getMessage());
    }
}
