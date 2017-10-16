package com.renrenlab.cms.communication.exception.provider;


import com.renrenlab.cms.communication.exception.ResponseMessage;

/**
 * 错误Ip异常
 *
 * Created by lihongxun on 2017/5/25.
 */
public class ProviderErrorIpException extends RuntimeException {

    public ProviderErrorIpException(ResponseMessage message){
        super(message.getMessage());
    }

}
