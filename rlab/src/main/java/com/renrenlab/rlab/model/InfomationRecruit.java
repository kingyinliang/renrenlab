package com.renrenlab.rlab.model;

import java.time.LocalDateTime;
import java.util.Date;

public class InfomationRecruit {
    private Long id;

    private Long recruitId;

    private String recruitTitle;

    private String recruitDescription;

    private String recruitRequirement;

    private String recruitReward;

    private String recruitAgeRequirement;

    private String recruitEducational;

    private String recruitValidityDate;

    private String recruitEmail;

    private String recruitContactPhone;

    private String recruitContactName;

    private Long recruitReadCount;

    private LocalDateTime createTime;

    private Date modifyTime;

    private Short recruitState;

    private String recruitPlace;

    private String recruitWelfare;

    private String recruitCompanyDes;
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

    public Long getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(Long recruitId) {
        this.recruitId = recruitId;
    }

    public String getRecruitTitle() {
        return recruitTitle;
    }

    public void setRecruitTitle(String recruitTitle) {
        this.recruitTitle = recruitTitle == null ? null : recruitTitle.trim();
    }

    public String getRecruitDescription() {
        return recruitDescription;
    }

    public void setRecruitDescription(String recruitDescription) {
        this.recruitDescription = recruitDescription == null ? null : recruitDescription.trim();
    }

    public String getRecruitRequirement() {
        return recruitRequirement;
    }

    public void setRecruitRequirement(String recruitRequirement) {
        this.recruitRequirement = recruitRequirement == null ? null : recruitRequirement.trim();
    }

    public String getRecruitReward() {
        return recruitReward;
    }

    public void setRecruitReward(String recruitReward) {
        this.recruitReward = recruitReward == null ? null : recruitReward.trim();
    }

    public String getRecruitAgeRequirement() {
        return recruitAgeRequirement;
    }

    public void setRecruitAgeRequirement(String recruitAgeRequirement) {
        this.recruitAgeRequirement = recruitAgeRequirement == null ? null : recruitAgeRequirement.trim();
    }

    public String getRecruitEducational() {
        return recruitEducational;
    }

    public void setRecruitEducational(String recruitEducational) {
        this.recruitEducational = recruitEducational == null ? null : recruitEducational.trim();
    }

    public String getRecruitValidityDate() {
        return recruitValidityDate;
    }

    public void setRecruitValidityDate(String recruitValidityDate) {
        this.recruitValidityDate = recruitValidityDate == null ? null : recruitValidityDate.trim();
    }

    public String getRecruitEmail() {
        return recruitEmail;
    }

    public void setRecruitEmail(String recruitEmail) {
        this.recruitEmail = recruitEmail == null ? null : recruitEmail.trim();
    }

    public String getRecruitContactPhone() {
        return recruitContactPhone;
    }

    public void setRecruitContactPhone(String recruitContactPhone) {
        this.recruitContactPhone = recruitContactPhone == null ? null : recruitContactPhone.trim();
    }

    public String getRecruitContactName() {
        return recruitContactName;
    }

    public void setRecruitContactName(String recruitContactName) {
        this.recruitContactName = recruitContactName == null ? null : recruitContactName.trim();
    }

    public Long getRecruitReadCount() {
        return recruitReadCount;
    }

    public void setRecruitReadCount(Long recruitReadCount) {
        this.recruitReadCount = recruitReadCount;
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

    public Short getRecruitState() {
        return recruitState;
    }

    public void setRecruitState(Short recruitState) {
        this.recruitState = recruitState;
    }

    public String getRecruitPlace() {
        return recruitPlace;
    }

    public void setRecruitPlace(String recruitPlace) {
        this.recruitPlace = recruitPlace;
    }

    public String getRecruitWelfare() {
        return recruitWelfare;
    }

    public void setRecruitWelfare(String recruitWelfare) {
        this.recruitWelfare = recruitWelfare;
    }

    public String getRecruitCompanyDes() {
        return recruitCompanyDes;
    }

    public void setRecruitCompanyDes(String recruitCompanyDes) {
        this.recruitCompanyDes = recruitCompanyDes;
    }
}