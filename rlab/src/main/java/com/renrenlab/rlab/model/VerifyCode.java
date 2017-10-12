package com.renrenlab.rlab.model;

import java.util.Date;

public class VerifyCode {

    private Long id;

    private Long vcId;

    private String vcMobile;

    private String vcVerifyCode;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getVcId() {
        return vcId;
    }

    public void setVcId(Long vcId) {
        this.vcId = vcId;
    }

    public String getVcMobile() {
        return vcMobile;
    }

    public void setVcMobile(String vcMobile) {
        this.vcMobile = vcMobile;
    }

    public String getVcVerifyCode() {
        return vcVerifyCode;
    }

    public void setVcVerifyCode(String vcVerifyCode) {
        this.vcVerifyCode = vcVerifyCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}