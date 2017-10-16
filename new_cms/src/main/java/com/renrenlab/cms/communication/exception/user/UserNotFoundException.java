package com.renrenlab.cms.communication.exception.user;

import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 用户未找到异常
 */
public class UserNotFoundException extends RuntimeException {

    private static final long serialVersionUID = -3692051117521691541L;

    public UserNotFoundException(ResponseMessage message) {
        super(message.getMessage());
    }

}
