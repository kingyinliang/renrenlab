package com.renrenlab.rlab.model;

import java.time.LocalDateTime;

public class MessageInfo {
    private Long mId;

    private String mPhone;

    private String mMessage;

    private Short mFrom;

    private String mSendBy;

    private String mIp;

    private String mCallback;

    private LocalDateTime createTime;

    public Long getmId() {
        return mId;
    }

    public void setmId(Long mId) {
        this.mId = mId;
    }

    public String getmPhone() {
        return mPhone;
    }

    public void setmPhone(String mPhone) {
        this.mPhone = mPhone == null ? null : mPhone.trim();
    }

    public String getmMessage() {
        return mMessage;
    }

    public void setmMessage(String mMessage) {
        this.mMessage = mMessage == null ? null : mMessage.trim();
    }

    public Short getmFrom() {
        return mFrom;
    }

    public void setmFrom(Short mFrom) {
        this.mFrom = mFrom;
    }

    public String getmSendBy() {
        return mSendBy;
    }

    public void setmSendBy(String mSendBy) {
        this.mSendBy = mSendBy;
    }

    public String getmIp() {
        return mIp;
    }

    public void setmIp(String mIp) {
        this.mIp = mIp == null ? null : mIp.trim();
    }

    public String getmCallback() {
        return mCallback;
    }

    public void setmCallback(String mCallback) {
        this.mCallback = mCallback == null ? null : mCallback.trim();
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
}