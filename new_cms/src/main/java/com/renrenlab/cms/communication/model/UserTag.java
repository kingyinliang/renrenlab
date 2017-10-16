package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserTag implements Serializable {

    private static final long serialVersionUID = -6337529800046725262L;

    private Long id;

    private Long uTid;

    private String uTagName;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getuTid() {
        return uTid;
    }

    public void setuTid(Long uTid) {
        this.uTid = uTid;
    }

    public String getuTagName() {
        return uTagName;
    }

    public void setuTagName(String uTagName) {
        this.uTagName = uTagName == null ? null : uTagName.trim();
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