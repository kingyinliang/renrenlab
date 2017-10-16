package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserTagMap implements Serializable {

    private static final long serialVersionUID = 392895484388344023L;

    private Long id;

    private Long uUid;

    private Long tTid;

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

    public Long gettTid() {
        return tTid;
    }

    public void settTid(Long tTid) {
        this.tTid = tTid;
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