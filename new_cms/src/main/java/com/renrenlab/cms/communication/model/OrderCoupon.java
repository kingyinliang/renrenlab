package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class OrderCoupon implements Serializable {

    private static final long serialVersionUID = -7935953245783491787L;

    private Long id;

    private Long oCid;

    private String oCouponName;

    private String oCouponDescription;

    private Integer oCouponEffective;

    private Integer oCouponStat;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getoCid() {
        return oCid;
    }

    public void setoCid(Long oCid) {
        this.oCid = oCid;
    }

    public String getoCouponName() {
        return oCouponName;
    }

    public void setoCouponName(String oCouponName) {
        this.oCouponName = oCouponName == null ? null : oCouponName.trim();
    }

    public String getoCouponDescription() {
        return oCouponDescription;
    }

    public void setoCouponDescription(String oCouponDescription) {
        this.oCouponDescription = oCouponDescription == null ? null : oCouponDescription.trim();
    }

    public Integer getoCouponEffective() {
        return oCouponEffective;
    }

    public void setoCouponEffective(Integer oCouponEffective) {
        this.oCouponEffective = oCouponEffective;
    }

    public Integer getoCouponStat() {
        return oCouponStat;
    }

    public void setoCouponStat(Integer oCouponStat) {
        this.oCouponStat = oCouponStat;
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