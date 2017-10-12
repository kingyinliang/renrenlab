package com.renrenlab.rlab.common.response;

/**
 * Ajax 返回结果封装类
 */
public class Response<T> {

    private int code;
    private T payload;
	private String description = "";
 

	public Response() {
    }

    public Response(int code) {
        this.code = code;
    }
    public String getDescription() {
 		return description;
 	}

 	public void setDescription(String description) {
 		this.description = description;
 	}
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getPayload() {
        return payload;
    }

    public void setPayload(T payload) {
        this.payload = payload;
    }

    @Override
    public String toString() {
        return "Response [code=" + code + ",description=" + description + ", payload=" + payload + "]";
    }
}
