package com.renrenlab.cms.communication.vo;

/**
 * 用户及优惠券信息
 *
 * Created by lihongxun on 2017/4/21.
 */
public class UserCouponInfo {

    /**
     * 用户Id
     */
    public Long uId;

    /**
     * 用户名称
     */
    public String uName;

    /**
     * 用户手机号
     */
    public String uPhone;

    /**
     * 优惠券名称
     */
    public String cName;

    /**
     * 优惠券Id
     */
    public Long coId;

    /**
     * 当前状态
     */
    public Integer cState;

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public Long getCoId() {
        return coId;
    }

    public void setCoId(Long coId) {
        this.coId = coId;
    }

    public Integer getcState() {
        return cState;
    }

    public void setcState(Integer cState) {
        this.cState = cState;
    }
}
