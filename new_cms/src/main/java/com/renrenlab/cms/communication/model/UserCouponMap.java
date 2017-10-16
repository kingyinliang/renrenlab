package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserCouponMap implements Serializable {

    private static final long serialVersionUID = 5608288574948548641L;

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