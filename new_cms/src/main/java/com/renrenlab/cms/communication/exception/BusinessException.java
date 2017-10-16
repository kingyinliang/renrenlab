package com.renrenlab.cms.communication.exception;

/**
 * Created by Administrator on 2017/5/2.
 */
public class BusinessException extends RuntimeException {

    private static final long serialVersionUID = 1897502541147408915L;

    private ResponseEntity responseEntity;

    public BusinessException(ResponseEntity responseEntity){
        super(responseEntity.getMessage());
        this.responseEntity = responseEntity;
    }

    public ResponseEntity getResponseEntity() {
        return responseEntity;
    }

}
