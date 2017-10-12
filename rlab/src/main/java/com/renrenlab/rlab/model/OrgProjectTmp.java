package com.renrenlab.rlab.model;

import java.util.Date;

public class OrgProjectTmp {
    private Long id;

    private Long orgProId;

    private Long orgCerId;

    private Long orgProChkUid;

    private String orgProName;

    private String orgProApplication;

    private String orgProContract;

    private String orgProInvoice;

    private String orgProAchievement;

    private Integer orgProState;

    private String orgProRemark;

    private Date orgProChkTime;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgProId() {
        return orgProId;
    }

    public void setOrgProId(Long orgProId) {
        this.orgProId = orgProId;
    }

    public Long getOrgCerId() {
        return orgCerId;
    }

    public void setOrgCerId(Long orgCerId) {
        this.orgCerId = orgCerId;
    }

    public Long getOrgProChkUid() {
        return orgProChkUid;
    }

    public void setOrgProChkUid(Long orgProChkUid) {
        this.orgProChkUid = orgProChkUid;
    }

    public String getOrgProName() {
        return orgProName;
    }

    public void setOrgProName(String orgProName) {
        this.orgProName = orgProName == null ? null : orgProName.trim();
    }

    public String getOrgProApplication() {
        return orgProApplication;
    }

    public void setOrgProApplication(String orgProApplication) {
        this.orgProApplication = orgProApplication == null ? null : orgProApplication.trim();
    }

    public String getOrgProContract() {
        return orgProContract;
    }

    public void setOrgProContract(String orgProContract) {
        this.orgProContract = orgProContract == null ? null : orgProContract.trim();
    }

    public String getOrgProInvoice() {
        return orgProInvoice;
    }

    public void setOrgProInvoice(String orgProInvoice) {
        this.orgProInvoice = orgProInvoice == null ? null : orgProInvoice.trim();
    }

    public String getOrgProAchievement() {
        return orgProAchievement;
    }

    public void setOrgProAchievement(String orgProAchievement) {
        this.orgProAchievement = orgProAchievement == null ? null : orgProAchievement.trim();
    }

    public Integer getOrgProState() {
        return orgProState;
    }

    public void setOrgProState(Integer orgProState) {
        this.orgProState = orgProState;
    }

    public String getOrgProRemark() {
        return orgProRemark;
    }

    public void setOrgProRemark(String orgProRemark) {
        this.orgProRemark = orgProRemark == null ? null : orgProRemark.trim();
    }

    public Date getOrgProChkTime() {
        return orgProChkTime;
    }

    public void setOrgProChkTime(Date orgProChkTime) {
        this.orgProChkTime = orgProChkTime;
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
}