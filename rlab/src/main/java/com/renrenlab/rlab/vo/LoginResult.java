package com.renrenlab.rlab.vo;

import com.renrenlab.rlab.model.UserBaseInfo;

/**
 * Created by Administrator on 2017/5/24.
 */
public class LoginResult {

    private int code;
    private String message;
    private int param;

    public LoginResult(int code, String message, int error) {
        this.code = code;
        this.message = message;
        this.param = error;
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

    public int getParam() {
        return param;
    }

    public void setParam(int param) {
        this.param = param;
    }
}
