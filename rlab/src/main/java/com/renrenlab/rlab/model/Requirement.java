package com.renrenlab.rlab.model;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Requirement {

    private Long uReqId;

    private Long[] uReqIds;

    private Long uUid;

    private String uName;

    private String uMobile;

    private String uReqDescription;

    private Integer uReqState;

    private String uReqReason;

    private Short uHasDelay;

    private Integer uChkCount;

    private Integer uHasNotice;
    //标识是否为重新发布的需求
    private String isReDepoly;

    private Date uReqEndTime;

    private String beginTime;
    private String endTime;
    private String remainTime;
    private long modifyTimes;
    private String modifyTimeStr;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date modifyTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public String getIsReDepoly() {
        return isReDepoly;
    }

    public void setIsReDepoly(String isReDepoly) {
        this.isReDepoly = isReDepoly;
    }

    public String getModifyTimeStr() {
        return modifyTimeStr;
    }

    public void setModifyTimeStr(String modifyTimeStr) {
        this.modifyTimeStr = modifyTimeStr;
    }

    public long getModifyTimes() {
        return modifyTimes;
    }

    public void setModifyTimes(long modifyTimes) {
        this.modifyTimes = modifyTimes;
    }

    public String getRemainTime() {
        return remainTime;
    }

    public void setRemainTime(String remainTime) {
        this.remainTime = remainTime;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public Long[] getuReqIds() {
        return uReqIds;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setuReqIds(Long[] uReqIds) {
        this.uReqIds = uReqIds;
    }

    public Integer getuHasNotice() {
        return uHasNotice;
    }

    public void setuHasNotice(Integer uHasNotice) {
        this.uHasNotice = uHasNotice;
    }

    public String getuReqReason() {
        return uReqReason;
    }

    public void setuReqReason(String uReqReason) {
        this.uReqReason = uReqReason;
    }

    public Long getuReqId() {
        return uReqId;
    }

    public void setuReqId(Long uReqId) {
        this.uReqId = uReqId;
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuMobile() {
        return uMobile;
    }

    public void setuMobile(String uMobile) {
        this.uMobile = uMobile == null ? null : uMobile.trim();
    }

    public String getuReqDescription() {
        return uReqDescription;
    }

    public void setuReqDescription(String uReqDescription) {
        this.uReqDescription = uReqDescription == null ? null : uReqDescription.trim();
    }

    public Integer getuReqState() {
        return uReqState;
    }

    public void setuReqState(Integer uReqState) {
        this.uReqState = uReqState;
    }

    public Short getuHasDelay() {
        return uHasDelay;
    }

    public void setuHasDelay(Short uHasDelay) {
        this.uHasDelay = uHasDelay;
    }

    public Integer getuChkCount() {
        return uChkCount;
    }

    public void setuChkCount(Integer uChkCount) {
        this.uChkCount = uChkCount;
    }

    public Date getuReqEndTime() {
        return uReqEndTime;
    }

    public void setuReqEndTime(Date uReqEndTime) {
        this.uReqEndTime = uReqEndTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}