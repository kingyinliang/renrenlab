package com.renrenlab.rlab.vo;

public class Result<T> {
	
	private int code;
	private String message;
	private T t;

	public Result(int code, String message, T t) {
		super();
		this.code = code;
		this.message = message;
		this.t = t;
	}
	
	public Result(int code, String message) {
		super();
		this.code = code;
		this.message = message;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}
}
