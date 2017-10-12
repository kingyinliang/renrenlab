package com.renrenlab.rlab.model;

import java.util.Date;

public class UserWx {

    private Long id;

    private Long uUid;

    private String wxOpenId;

    private String wxUnionId;

    private Boolean wxSubscribe;

    private Date wxSubscribeTime;

    private Date createTime;

    private Date modifyTime;
    
    private Long wxSource;

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

	public Long getWxSource() {
		return wxSource;
	}

	public void setWxSource(Long wxSource) {
		this.wxSource = wxSource;
	}
    
}