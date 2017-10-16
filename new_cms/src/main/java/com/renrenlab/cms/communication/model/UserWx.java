package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserWx implements Serializable {

    private static final long serialVersionUID = -1126330451515594791L;

    private Long id;

    private Long uUid;

    private String wxOpenId;

    private String wxUnionId;

    private Boolean wxSubscribe;

    private Date wxSubscribeTime;

    private Integer wxSource;

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

    public String getWxOpenId() {
        return wxOpenId;
    }

    public void setWxOpenId(String wxOpenId) {
        this.wxOpenId = wxOpenId == null ? null : wxOpenId.trim();
    }

    public String getWxUnionId() {
        return wxUnionId;
    }

    public void setWxUnionId(String wxUnionId) {
        this.wxUnionId = wxUnionId == null ? null : wxUnionId.trim();
    }

    public Boolean getWxSubscribe() {
        return wxSubscribe;
    }

    public void setWxSubscribe(Boolean wxSubscribe) {
        this.wxSubscribe = wxSubscribe;
    }

    public Date getWxSubscribeTime() {
        return wxSubscribeTime;
    }

    public void setWxSubscribeTime(Date wxSubscribeTime) {
        this.wxSubscribeTime = wxSubscribeTime;
    }

    public Integer getWxSource() {
        return wxSource;
    }

    public void setWxSource(Integer wxSource) {
        this.wxSource = wxSource;
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

    @Override
    public String toString() {
        return "UserWx{" +
                "id=" + id +
                ", uUid=" + uUid +
                ", wxOpenId='" + wxOpenId + '\'' +
                ", wxUnionId='" + wxUnionId + '\'' +
                ", wxSubscribe=" + wxSubscribe +
                ", wxSubscribeTime=" + wxSubscribeTime +
                ", wxSource=" + wxSource +
                ", createTime=" + createTime +
                ", modifyTime=" + modifyTime +
                '}';
    }
}