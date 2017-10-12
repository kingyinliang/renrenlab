package com.renrenlab.rlab.model;

import java.util.Date;

public class InstrumentUploadHistory {
    private Long id;

    private Long insUlhistId;

    private Long uUid;

    private Long orgOid;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getInsUlhistId() {
        return insUlhistId;
    }

    public void setInsUlhistId(Long insUlhistId) {
        this.insUlhistId = insUlhistId;
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
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