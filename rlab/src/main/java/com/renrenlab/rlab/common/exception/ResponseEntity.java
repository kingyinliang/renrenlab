package com.renrenlab.rlab.common.exception;

public enum ResponseEntity {

    SUCCESS(0,"成功"),
    GLOBAL_ERROR(1000,"系统异常"),
    PARAMETER_ERROR(1001, "参数异常"),
    USER_NOT_FOUND_ERROR(1002, "用户不存在"),
    USER_OR_PASSWORD_ERROR(1003, "用户名和密码不匹配异常"),
    USER_EXIST_ERROR(1004, "用户已经存在"),
    VALIDATE_CODE_ERROR(1005, "图形验证码输入异常"),
    VERIFY_CODE_ERROR(1006, "短信验证码输入异常"),
    MOBILE_VERICODE_ERROR(1007, "手机验证码发送太频繁"),
    MOBILE_VERICODE_SEND_ERROR(1008, "手机验证码发送失败"),
    MOBILE_VERICODE_MAX_LIMIT_ERROR(1009, "用户一天之内只能发送十条短信"),
    MOBILE_OLD_PASSWORD_ERROR(1010, "旧密码输入错误"),
    MOBILE_BIND_ERROR(1011, "手机号绑定异常"),
    USER_NOT_LOGIN(1012, "用户未登录"),
    ORG_NAME_REPEATABLE_ERROR(1013, "机构重复"),
    SYNCHRONOUS_USER_ERROR(1014, "同步用户异常"),
    USER_EXIST_WECHAT_ERROR(1015, "用户已经在微信号注册"),
    MOBILE_VERICODE_EXPIRE_ERROR(1016, "手机验证码过期异常"),
    USER_ERROR(1017, "用户被禁用"),
    PERMISSSION_ERROR(1018, "权限不够"),

    REPEAT_U_JOB_NUMBER(2000,"工号重复"),
    REPEAT_ORG_CODE(2001,"组织机构代码重复"),

    //    需求管理
    REQUIREMENT_HAS_CHANGE(3001, "该需求已经被修改，请管理员刷新页面重新审核"),
    MANAGER_EXIST(3002, "该用户已经存在，且身份为管理员"),
    ;

    private Integer code;

    private String message;

    ResponseEntity(int code) {
        this.code = code;
    }

    ResponseEntity(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    @Override
    public String toString() {
        return "{\"code\":"+this.code+",\"message\":\""+this.message+"\"}";
    }
}
