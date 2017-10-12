package com.renrenlab.rlab.model;

import java.util.Date;

public class InstrumentScope {
    private Long id;

    private Long insScopeId;

    private String insScopeName;

    private Object insScopeDes;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getInsScopeId() {
        return insScopeId;
    }

    public void setInsScopeId(Long insScopeId) {
        this.insScopeId = insScopeId;
    }

    public String getInsScopeName() {
        return insScopeName;
    }

    public void setInsScopeName(String insScopeName) {
        this.insScopeName = insScopeName;
    }

    public Object getInsScopeDes() {
        return insScopeDes;
    }

    public void setInsScopeDes(Object insScopeDes) {
        this.insScopeDes = insScopeDes;
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

    /* public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getInsScopeId() {
        return insScopeId;
    }

    public void setInsScopeId(Long insScopeId) {
        this.insScopeId = insScopeId;
    }

    public String getInsScopeName() {
        return insScopeName;
    }

    public void setInsScopeName(String insScopeName) {
        this.insScopeName = insScopeName == null ? null : insScopeName.trim();
    }

    public Object getInsScopeDes() {
        return insScopeDes;
    }

    public void setInsScopeDes(Object insScopeDes) {
        this.insScopeDes = insScopeDes;
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
    }*/
}