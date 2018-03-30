package com.renrenlab.rlab.model;

import java.time.LocalDateTime;
import java.util.Date;

public class InfomationCareer {
    private Long id;

    private Long careerId;

    private String careerTitle;

    private String careerImage;

    private Long careerTag;

    private String careerContent;

    private Long careerReadCount;

    private String careerPublishName;

    private Short careerState;

    private LocalDateTime createTime;

    private Date modifyTime;
    //创建时间与当前时间相差
    private int hours;

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCareerId() {
        return careerId;
    }

    public void setCareerId(Long careerId) {
        this.careerId = careerId;
    }

    public String getCareerTitle() {
        return careerTitle;
    }

    public void setCareerTitle(String careerTitle) {
        this.careerTitle = careerTitle == null ? null : careerTitle.trim();
    }

    public String getCareerImage() {
        return careerImage;
    }

    public void setCareerImage(String careerImage) {
        this.careerImage = careerImage == null ? null : careerImage.trim();
    }

    public Long getCareerTag() {
        return careerTag;
    }

    public void setCareerTag(Long careerTag) {
        this.careerTag = careerTag;
    }

    public String getCareerContent() {
        return careerContent;
    }

    public void setCareerContent(String careerContent) {
        this.careerContent = careerContent == null ? null : careerContent.trim();
    }

    public Long getCareerReadCount() {
        return careerReadCount;
    }

    public void setCareerReadCount(Long careerReadCount) {
        this.careerReadCount = careerReadCount;
    }

    public String getCareerPublishName() {
        return careerPublishName;
    }

    public void setCareerPublishName(String careerPublishName) {
        this.careerPublishName = careerPublishName == null ? null : careerPublishName.trim();
    }

    public Short getCareerState() {
        return careerState;
    }

    public void setCareerState(Short careerState) {
        this.careerState = careerState;
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
}