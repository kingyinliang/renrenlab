package com.renrenlab.rlab.vo;

import java.util.Date;

/**
 * 服务商封装VO
 * Created by guowanting on 2017/9/20.
 */
public class ProviderInfo {

    private Long id;

    private Long orgOid;

    private String orgName;

    private Integer orgState;

    private Date modifyTime;

    private Date createTime;

    private Integer orgRank;

    private Integer orgIdentification;

    private Short orgType;

    private Short orgSource;

    private Long orgBizUid;

    //业务人员名称
    private String orgBizName;

    //法人名称
    private String orgPersonName;

    //联系电话
    private String contact;

    private Date auditTime;

    private String auditPerson;

    private Date applicationTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public Integer getOrgState() {
        return orgState;
    }

    public void setOrgState(Integer orgState) {
        this.orgState = orgState;
    }

    public Integer getOrgIdentification() {
        return orgIdentification;
    }

    public void setOrgIdentification(Integer orgIdentification) {
        this.orgIdentification = orgIdentification;
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

    public Integer getOrgRank() {
        return orgRank;
    }

    public void setOrgRank(Integer orgRank) {
        this.orgRank = orgRank;
    }

    public Short getOrgType() {
        return orgType;
    }

    public void setOrgType(Short orgType) {
        this.orgType = orgType;
    }

    public Short getOrgSource() {
        return orgSource;
    }

    public void setOrgSource(Short orgSource) {
        this.orgSource = orgSource;
    }

    public Long getOrgBizUid() {
        return orgBizUid;
    }

    public void setOrgBizUid(Long orgBizUid) {
        this.orgBizUid = orgBizUid;
    }

    public String getOrgBizName() {
        return orgBizName;
    }

    public void setOrgBizName(String orgBizName) {
        this.orgBizName = orgBizName;
    }

    public String getOrgPersonName() {
        return orgPersonName;
    }

    public void setOrgPersonName(String orgPersonName) {
        this.orgPersonName = orgPersonName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public String getAuditPerson() {
        return auditPerson;
    }

    public void setAuditPerson(String auditPerson) {
        this.auditPerson = auditPerson;
    }

    public Date getApplicationTime() {
        return applicationTime;
    }

    public void setApplicationTime(Date applicationTime) {
        this.applicationTime = applicationTime;
    }
}
