package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserRoleMap implements Serializable {

    private static final long serialVersionUID = 9216712724871196735L;

    private Long id;

    private Long uUid;

    private Long uRid;

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

    public Long getuRid() {
        return uRid;
    }

    public void setuRid(Long uRid) {
        this.uRid = uRid;
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