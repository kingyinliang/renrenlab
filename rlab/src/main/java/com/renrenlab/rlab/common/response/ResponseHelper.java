package com.renrenlab.rlab.common.response;


import com.renrenlab.rlab.common.exception.ResponseEntity;

import java.util.HashMap;
import java.util.Map;


public class ResponseHelper {

    public static Response<Map<String, String>> createSuccessResponse() {
        Response<Map<String, String>> response = new Response<Map<String, String>>();
        response.setCode(ResponseEntity.SUCCESS.getCode());
        response.setDescription(ResponseEntity.SUCCESS.getMessage());
        response.setPayload(new HashMap<String, String>());
        return response;
    }

    public static <T> Response<T> createSuccessResponse(T payload) {
        Response<T> response = new Response<T>();
        response.setPayload(payload);
        response.setCode(ResponseEntity.SUCCESS.getCode());
        response.setDescription(ResponseEntity.SUCCESS.getMessage());
        return response;
    }

    public static <T> Response<T> createErrorResponse(String description) {
        Response<T> response = new Response<T>();
        response.setCode(ResponseEntity.GLOBAL_ERROR.getCode());
        if (description != null) response.setDescription(description);
        return response;
    }
}
