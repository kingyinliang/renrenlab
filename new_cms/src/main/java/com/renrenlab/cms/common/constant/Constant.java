package com.renrenlab.cms.common.constant;

import java.util.Arrays;
import java.util.List;

/**
 * 常量
 *
 * Created by lihongxun on 2017/4/17.
 */
public class Constant {

    // 会话相关
    // 过期时间30分钟
    public static final long OVERTIME_30 = 30 * 60 * 1000;
    // 超时时间48小时
    public static final long OVERTIME_48 = 48 * 60 * 60 * 1000;
    // 会话待接入
    public static final int SESSION_PENDING = 0;
    // 会话聊天中
    public static final int SESSION_CHATTING = 1;
    // 会话结束
    public static final int SESSION_OVER = 2;
    // 会话过期
    public static final int SESSION_PASSED = 3;
    // token过期时间2分钟
    public static final int TOKEN_OVERTIME_2 = 2 * 60 * 1000;
    // access_token 失效时间
    public static final int TOKEN_INVALID_5 = 5 * 60 * 1000;
    // access_token 有效时间
    public static final int TOKEN_EFFECTIVE_120 = 2 * 60 * 60 * 1000;

    // 大学生优惠券
    public static final List<Long> COUPON_IDS = Arrays.asList(10002L, 10003L, 10004L);

    /**
     * 大学生活动的用户标签 1L
     */
    public static final Long TAG=10002L;
    
    // 优惠券使用状态 0:未使用 1:已使用 2:已过期
    public static final int COUPON_NOT_USED = 0;
    public static final int COUPON_USED = 1;
    public static final int COUPON_OVERTIME = 2;
    public static final String OLDWEBURL = "http://renrenlab.com/api/user/dataShare";

    /*
	 *  管理用户
	 */
    public static final int USER_MANAGE = 1;

    /*
     * 客服用户
     */
    public static final int USER_SERVICE = 2;

    /*
     * 认证用户
     */
    public static final int USER_AUTH = 4;

}
