package com.renrenlab.rlab.model;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class Infomation {

    private Long tInfoId;

    private String tInfoTitle;

    private String tInfoSubTitle;

    private String tInfoImage;

    private Object tInfoTags;

    private String tInfoContent;

    private Long tUid;

    private Long tReadCount;

    private LocalDateTime createTime;

    private String createTimeStr;

    private Date modifyTime;

    private String tInfoClassify;

    private int tInfoState;

    private String tUname;
    //创建时间与当前时间相差
    private int hours;

    private int tInfoClassifyHot;

    private String tInfoFrom;

    private int source;

    public int getSource() {
        return source;
    }

    public void setSource(int source) {
        this.source = source;
    }

    public String gettInfoFrom() {
        return tInfoFrom;
    }

    public void settInfoFrom(String tInfoFrom) {
        this.tInfoFrom = tInfoFrom;
    }

    public int gettInfoClassifyHot() {
        return tInfoClassifyHot;
    }

    public void settInfoClassifyHot(int tInfoClassifyHot) {
        this.tInfoClassifyHot = tInfoClassifyHot;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String gettUname() {
        return tUname;
    }

    public void settUname(String tUname) {
        this.tUname = tUname;
    }

    public int gettInfoState() {
        return tInfoState;
    }

    public void settInfoState(int tInfoState) {
        this.tInfoState = tInfoState;
    }

    public Long gettInfoId() {
        return tInfoId;
    }

    public void settInfoId(Long tInfoId) {
        this.tInfoId = tInfoId;
    }

    public String gettInfoTitle() {
        return tInfoTitle;
    }

    public void settInfoTitle(String tInfoTitle) {
        this.tInfoTitle = tInfoTitle == null ? null : tInfoTitle.trim();
    }

    public String gettInfoSubTitle() {
        return tInfoSubTitle;
    }

    public void settInfoSubTitle(String tInfoSubTitle) {
        this.tInfoSubTitle = tInfoSubTitle == null ? null : tInfoSubTitle.trim();
    }

    public String gettInfoImage() {
        return tInfoImage;
    }

    public void settInfoImage(String tInfoImage) {
        this.tInfoImage = tInfoImage == null ? null : tInfoImage.trim();
    }

    public Object gettInfoTags() {
        return tInfoTags;
    }

    public void settInfoTags(Object tInfoTags) {
        this.tInfoTags = tInfoTags;
    }

    public String gettInfoContent() {
        return tInfoContent;
    }

    public void settInfoContent(String tInfoContent) {
        this.tInfoContent = tInfoContent == null ? null : tInfoContent.trim();
    }

    public Long gettUid() {
        return tUid;
    }

    public void settUid(Long tUid) {
        this.tUid = tUid;
    }

    public Long gettReadCount() {
        return tReadCount;
    }

    public void settReadCount(Long tReadCount) {
        this.tReadCount = tReadCount;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String gettInfoClassify() {
        return tInfoClassify;
    }

    public void settInfoClassify(String tInfoClassify) {
        this.tInfoClassify = tInfoClassify == null ? null : tInfoClassify.trim();
    }
}