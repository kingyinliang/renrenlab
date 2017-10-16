package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserRole implements Serializable {

    private static final long serialVersionUID = -8123744412481186988L;
    
    private Long id;

    private Long rRid;

    private String rName;

    private String rPermisssion;

    private String rDescription;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getrRid() {
        return rRid;
    }

    public void setrRid(Long rRid) {
        this.rRid = rRid;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName == null ? null : rName.trim();
    }

    public String getrPermisssion() {
        return rPermisssion;
    }

    public void setrPermisssion(String rPermisssion) {
        this.rPermisssion = rPermisssion == null ? null : rPermisssion.trim();
    }

    public String getrDescription() {
        return rDescription;
    }

    public void setrDescription(String rDescription) {
        this.rDescription = rDescription == null ? null : rDescription.trim();
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