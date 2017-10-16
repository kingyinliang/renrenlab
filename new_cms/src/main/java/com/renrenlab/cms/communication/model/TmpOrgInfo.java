package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class TmpOrgInfo implements Serializable {

    private static final long serialVersionUID = -4576327918223835029L;

    private Long id;

    private Long uUid;

    private String uOrg;

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

    public String getuOrg() {
        return uOrg;
    }

    public void setuOrg(String uOrg) {
        this.uOrg = uOrg == null ? null : uOrg.trim();
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