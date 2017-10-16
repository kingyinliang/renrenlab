package com.renrenlab.cms.communication.exception;

/**
 * Created by Administrator on 2017/5/2.
 */
public class ParameterException extends RuntimeException {

    private static final long serialVersionUID = 8851159120331619658L;

    public ParameterException() {
    }

    public ParameterException(String msg){
        super(msg);
    }

}
