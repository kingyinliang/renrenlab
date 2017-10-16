package com.renrenlab.cms.communication.exception;

public class GlobalException extends RuntimeException {

	private static final long serialVersionUID = -1183376733688904915L;

    private ResponseEntity responseEntity;

	public GlobalException() {
        super(ResponseEntity.GLOBAL_ERROR.getMessage());
        this.responseEntity = ResponseEntity.GLOBAL_ERROR;
    }

    public ResponseEntity getResponseEntity() {
        return responseEntity;
    }

}
