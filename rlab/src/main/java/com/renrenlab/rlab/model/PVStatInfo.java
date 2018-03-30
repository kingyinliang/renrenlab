package com.renrenlab.rlab.model;

import java.util.Date;

public class PVStatInfo {
    private Long pvId;

    private Double pvCount;

    private Date creatTime;

    private String creatTimeStr;

    private Date modifyTime;

    public Long getPvId() {
        return pvId;
    }

    public void setPvId(Long pvId) {
        this.pvId = pvId;
    }

    public Double getPvCount() {
        return pvCount;
    }

    public void setPvCount(Double pvCount) {
        this.pvCount = pvCount;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getCreatTimeStr() {
        return creatTimeStr;
    }

    public void setCreatTimeStr(String creatTimeStr) {
        this.creatTimeStr = creatTimeStr;
    }
}