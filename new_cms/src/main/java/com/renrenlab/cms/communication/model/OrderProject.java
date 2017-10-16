package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class OrderProject implements Serializable {

    private static final long serialVersionUID = -8885409573454396459L;

    private Long id;

    private Long pjId;

    private String pjName;

    private Long uUid;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPjId() {
        return pjId;
    }

    public void setPjId(Long pjId) {
        this.pjId = pjId;
    }

    public String getPjName() {
        return pjName;
    }

    public void setPjName(String pjName) {
        this.pjName = pjName == null ? null : pjName.trim();
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
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