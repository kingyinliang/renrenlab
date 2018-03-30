package com.renrenlab.rlab.model;

import java.util.Date;

public class ServiceAptitudeInfo {
    private Long id;

    private Long aptitudeId;

    private String aptitudeName;

    private Long uUid;

    private Short isManager;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAptitudeId() {
        return aptitudeId;
    }

    public void setAptitudeId(Long aptitudeId) {
        this.aptitudeId = aptitudeId;
    }

    public String getAptitudeName() {
        return aptitudeName;
    }

    public void setAptitudeName(String aptitudeName) {
        this.aptitudeName = aptitudeName == null ? null : aptitudeName.trim();
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public Short getIsManager() {
        return isManager;
    }

    public void setIsManager(Short isManager) {
        this.isManager = isManager;
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