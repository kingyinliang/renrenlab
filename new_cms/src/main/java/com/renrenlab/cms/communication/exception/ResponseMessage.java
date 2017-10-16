package com.renrenlab.cms.communication.exception;

public enum ResponseMessage {

    GLOBAL_ERROR("系统异常"),

    USER_OR_PASSWORD_ERROR("用户名和密码不匹配异常"),

    USER_NOT_LOGIN_ERROR("用户未登录"),

    USER_NOT_FOUND_ERROR("用户不存在"),

    CUSTOMERSERVICE_INSERT_ERROR("客服添加异常"),

    CUSTOMERSERVICE_EXISTS_ERROR("用户名已存在"),

    LOWER_PERMISSION_ERROR("权限太低"),

    CS_OLDPASSWORD_ERROR("旧密码错误"),

    MESSAGE_ERROR("消息发送异常"),

    SESSION_ERROR("会话接入异常"),

    PROVIDER_IP_ERROR("不合法ip地址"),

    PROVIDER_TOKEN_ERROR("不合法token"),

    PROVIDER_TOKEN_OVERDUE("过期token"),
    
    ORDER_ERROR("订单修改异常");

    private String message;

    ResponseMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

}
