package com.renrenlab.rlab.model;

import java.util.Date;

/**
 * 大学生用户创新券关联实体
 */
public class UserCouponMap {
    private Long id;

    private Long uUid;

    private Long oCid;

    private Integer uCouponState;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public Long getoCid() {
        return oCid;
    }

    public void setoCid(Long oCid) {
        this.oCid = oCid;
    }

    public Integer getuCouponState() {
        return uCouponState;
    }

    public void setuCouponState(Integer uCouponState) {
        this.uCouponState = uCouponState;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
}