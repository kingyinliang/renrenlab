package com.renrenlab.cms.communication.exception;

public enum ResponseEntity {

    SUCCESS(0,"成功"),
    COLLEGEACTIVITY(1),
    BUSINESS_ERROR(1002),
    GLOBAL_ERROR(1001,"系统异常"),
    USER_NOT_LOGIN_ERROR(1003, "用户未登录"),
    USER_NOT_FOUND_ERROR(1004, "用户不存在"),
    USER_OR_PASSWORD_ERROR(1005, "用户名和密码不匹配异常"),

    CUSTOMERSERVICE_INSERT_ERROR(1006, "客服添加异常"),
    CUSTOMERSERVICE_EXISTS_ERROR(1007, "用户名已存在"),
    LOWER_PERMISSION_ERROR(1008, "权限太低"),
    CS_OLDPASSWORD_ERROR(1009, "旧密码错误"),

    PROVIDER_IP_ERROR(10010, "不合法ip地址"),
    PROVIDER_TOKEN_ERROR(10011, "token不合法"),
    PROVIDER_TOKEN_OVERDUE(10012, "token已过期"),

    MESSAGE_ERROR(3001, "消息发送异常"),

    SESSION_ERROR(4001, "会话接入异常"),



    ORDER_ERROR(5001, "订单修改异常");

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
