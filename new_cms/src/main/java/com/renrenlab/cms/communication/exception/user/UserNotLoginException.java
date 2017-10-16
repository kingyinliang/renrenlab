package com.renrenlab.cms.communication.exception.user;

import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 用户未登录异常
 */
public class UserNotLoginException extends RuntimeException {

    private static final long serialVersionUID = 8077980189180122301L;

    public UserNotLoginException(ResponseMessage message) {
        super(message.getMessage());
    }

}
