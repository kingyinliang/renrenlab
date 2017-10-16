package com.renrenlab.cms.communication.exception.message;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 消息异常
 *
 * Created by Administrator on 2017/4/10.
 */
public class MessageException extends RuntimeException{

	private static final long serialVersionUID = -7621141912540822745L;

	public MessageException(ResponseMessage message) {
        super(message.getMessage());
    }
}
