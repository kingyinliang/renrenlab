package com.renrenlab.cms.communication.exception.session;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 会话异常
 *
 * Created by Administrator on 2017/4/10.
 */
public class SessionException extends RuntimeException{

	private static final long serialVersionUID = 6537620408259036308L;

	public SessionException(ResponseMessage message) {
        super(message.getMessage());
    }
}
