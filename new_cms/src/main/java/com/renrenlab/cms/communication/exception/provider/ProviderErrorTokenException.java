package com.renrenlab.cms.communication.exception.provider;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 错误或非法的Token
 *
 * Created by lihongxun on 2017/5/25.
 */
public class ProviderErrorTokenException extends RuntimeException {

    public ProviderErrorTokenException(ResponseMessage message) {
        super(message.getMessage());
    }
}
