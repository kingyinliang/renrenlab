package com.renrenlab.cms.common.response;

import java.util.HashMap;
import java.util.Map;

import com.renrenlab.cms.communication.exception.ResponseEntity;



public class ResponseHelper {

    public static Response<Map<String, String>> createSuccessResponse() {
        Response<Map<String, String>> response = new Response<Map<String, String>>();
        response.setCode(ResponseEntity.SUCCESS.getCode());
        response.setPayload(new HashMap<String, String>());
        return response;
    }
    public static Response<Map<String, String>> createCollegeActivityResponse() {
        Response<Map<String, String>> response = new Response<Map<String, String>>();
        response.setCode(ResponseEntity.COLLEGEACTIVITY.getCode());
        response.setPayload(new HashMap<String, String>());
        return response;
    }

    public static <T> Response<T> createSuccessResponse(T payload) {
        Response<T> response = new Response<T>();
        response.setPayload(payload);
        response.setCode(ResponseEntity.SUCCESS.getCode());
        return response;
    }

	public static <T> Response<T> createBusinessErrorResponse(T payload) {
		Response<T> response = new Response<T>();
		 response.setPayload(payload);
		 response.setCode(ResponseEntity.BUSINESS_ERROR.getCode());
		return response;
	}
	
	   public static <T> Response<T> createResponse(int code, String description) {
	        Response<T> response = new Response<T>();
	        if (code != ReturnCode.NEVER_USED_CODE) response.setCode(code);
	        if (description != null) response.setDescription(description);
	        return response;
	    }

}
