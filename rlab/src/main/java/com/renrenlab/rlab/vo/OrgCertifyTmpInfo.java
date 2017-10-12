package com.renrenlab.rlab.vo;


import java.util.Date;

public class OrgCertifyTmpInfo {

    private Long id;

    private Long orgCerId;

    private String uMobile;

    private Long orgId;

    private Long orgCerChkUid;

    private String orgName;

    private String orgPersonFrontPic;

    private String orgPersonBackPic;

    private String orgLicensePic;

    private Object orgReport;

    private String orgBaseReport;

    private Object orgOtherReport;

    private Integer orgCerState;

    private String orgCerRemark;

    private Integer orgCerSource;

    private Date orgCerChkTime;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgCerId() {
        return orgCerId;
    }

    public void setOrgCerId(Long orgCerId) {
        this.orgCerId = orgCerId;
    }

    public String getuMobile() {
        return uMobile;
    }

    public void setuMobile(String uMobile) {
        this.uMobile = uMobile;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public Long getOrgCerChkUid() {
        return orgCerChkUid;
    }

    public void setOrgCerChkUid(Long orgCerChkUid) {
        this.orgCerChkUid = orgCerChkUid;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    public String getOrgPersonFrontPic() {
        return orgPersonFrontPic;
    }

    public void setOrgPersonFrontPic(String orgPersonFrontPic) {
        this.orgPersonFrontPic = orgPersonFrontPic == null ? null : orgPersonFrontPic.trim();
    }

    public String getOrgPersonBackPic() {
        return orgPersonBackPic;
    }

    public void setOrgPersonBackPic(String orgPersonBackPic) {
        this.orgPersonBackPic = orgPersonBackPic == null ? null : orgPersonBackPic.trim();
    }

    public String getOrgLicensePic() {
        return orgLicensePic;
    }

    public void setOrgLicensePic(String orgLicensePic) {
        this.orgLicensePic = orgLicensePic == null ? null : orgLicensePic.trim();
    }

    public Object getOrgReport() {
        return orgReport;
    }

    public void setOrgReport(Object orgReport) {
        this.orgReport = orgReport;
    }

    public String getOrgBaseReport() {
        return orgBaseReport;
    }

    public void setOrgBaseReport(String orgBaseReport) {
        this.orgBaseReport = orgBaseReport == null ? null : orgBaseReport.trim();
    }

    public Object getOrgOtherReport() {
        return orgOtherReport;
    }

    public void setOrgOtherReport(Object orgOtherReport) {
        this.orgOtherReport = orgOtherReport;
    }

    public Integer getOrgCerState() {
        return orgCerState;
    }

    public void setOrgCerState(Integer orgCerState) {
        this.orgCerState = orgCerState;
    }

    public String getOrgCerRemark() {
        return orgCerRemark;
    }

    public void setOrgCerRemark(String orgCerRemark) {
        this.orgCerRemark = orgCerRemark == null ? null : orgCerRemark.trim();
    }

    public Integer getOrgCerSource() {
        return orgCerSource;
    }

    public void setOrgCerSource(Integer orgCerSource) {
        this.orgCerSource = orgCerSource;
    }

    public Date getOrgCerChkTime() {
        return orgCerChkTime;
    }

    public void setOrgCerChkTime(Date orgCerChkTime) {
        this.orgCerChkTime = orgCerChkTime;
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