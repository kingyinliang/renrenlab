package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class SessionMessage implements Serializable {

    private static final long serialVersionUID = -7159856781731241243L;

    private Long id;

    private Long mMid;

    private Long mFrom;

    private Long mTo;

    private Long sSid;

    private Integer mState;

    private String mBody;

    private Integer mSource;

    private Integer mType;

    private Date mTime;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getmMid() {
        return mMid;
    }

    public void setmMid(Long mMid) {
        this.mMid = mMid;
    }

    public Long getmFrom() {
        return mFrom;
    }

    public void setmFrom(Long mFrom) {
        this.mFrom = mFrom;
    }

    public Long getmTo() {
        return mTo;
    }

    public void setmTo(Long mTo) {
        this.mTo = mTo;
    }

    public Long getsSid() {
        return sSid;
    }

    public void setsSid(Long sSid) {
        this.sSid = sSid;
    }

    public Integer getmState() {
        return mState;
    }

    public void setmState(Integer mState) {
        this.mState = mState;
    }

    public String getmBody() {
        return mBody;
    }

    public void setmBody(String mBody) {
        this.mBody = mBody == null ? null : mBody.trim();
    }

    public Integer getmSource() {
        return mSource;
    }

    public void setmSource(Integer mSource) {
        this.mSource = mSource;
    }

    public Integer getmType() {
        return mType;
    }

    public void setmType(Integer mType) {
        this.mType = mType;
    }

    public Date getmTime() {
        return mTime;
    }

    public void setmTime(Date mTime) {
        this.mTime = mTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	@Override
	public String toString() {
		return "SessionMessage [id=" + id + ", mMid=" + mMid + ", mFrom=" + mFrom + ", mTo=" + mTo + ", sSid=" + sSid
				+ ", mState=" + mState + ", mBody=" + mBody + ", mSource=" + mSource + ", mType=" + mType + ", mTime="
				+ mTime + ", createTime=" + createTime + "]";
	}
    
    
}