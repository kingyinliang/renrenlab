package com.renrenlab.rlab.model;

import java.time.LocalDateTime;
import java.util.Date;

public class InfomationResume {
    private Long id;

    private Long resumeId;

    private String resumeTitle;

    private String resumeName;

    private String resumeSex;

    private String resumeBirth;

    private String resumeBg;

    private String resumeExperience;

    private String resumeWorkExperience;

    private String resumeProjectExperience;

    private String resumeSkills;

    private String resumeSelfEvaluation;

    private Long resumeReadCount;

    private LocalDateTime createTime;

    private Date modifyTime;

    private Short resumeState;
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

    public Long getResumeId() {
        return resumeId;
    }

    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    public String getResumeTitle() {
        return resumeTitle;
    }

    public void setResumeTitle(String resumeTitle) {
        this.resumeTitle = resumeTitle == null ? null : resumeTitle.trim();
    }

    public String getResumeName() {
        return resumeName;
    }

    public void setResumeName(String resumeName) {
        this.resumeName = resumeName == null ? null : resumeName.trim();
    }

    public String getResumeSex() {
        return resumeSex;
    }

    public void setResumeSex(String resumeSex) {
        this.resumeSex = resumeSex == null ? null : resumeSex.trim();
    }

    public String getResumeBirth() {
        return resumeBirth;
    }

    public void setResumeBirth(String resumeBirth) {
        this.resumeBirth = resumeBirth == null ? null : resumeBirth.trim();
    }

    public String getResumeBg() {
        return resumeBg;
    }

    public void setResumeBg(String resumeBg) {
        this.resumeBg = resumeBg == null ? null : resumeBg.trim();
    }

    public String getResumeExperience() {
        return resumeExperience;
    }

    public void setResumeExperience(String resumeExperience) {
        this.resumeExperience = resumeExperience == null ? null : resumeExperience.trim();
    }

    public String getResumeWorkExperience() {
        return resumeWorkExperience;
    }

    public void setResumeWorkExperience(String resumeWorkExperience) {
        this.resumeWorkExperience = resumeWorkExperience == null ? null : resumeWorkExperience.trim();
    }

    public String getResumeProjectExperience() {
        return resumeProjectExperience;
    }

    public void setResumeProjectExperience(String resumeProjectExperience) {
        this.resumeProjectExperience = resumeProjectExperience == null ? null : resumeProjectExperience.trim();
    }

    public String getResumeSkills() {
        return resumeSkills;
    }

    public void setResumeSkills(String resumeSkills) {
        this.resumeSkills = resumeSkills == null ? null : resumeSkills.trim();
    }

    public String getResumeSelfEvaluation() {
        return resumeSelfEvaluation;
    }

    public void setResumeSelfEvaluation(String resumeSelfEvaluation) {
        this.resumeSelfEvaluation = resumeSelfEvaluation == null ? null : resumeSelfEvaluation.trim();
    }

    public Long getResumeReadCount() {
        return resumeReadCount;
    }

    public void setResumeReadCount(Long resumeReadCount) {
        this.resumeReadCount = resumeReadCount;
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

    public Short getResumeState() {
        return resumeState;
    }

    public void setResumeState(Short resumeState) {
        this.resumeState = resumeState;
    }
}