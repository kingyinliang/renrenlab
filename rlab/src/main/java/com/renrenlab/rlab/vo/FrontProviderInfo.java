package com.renrenlab.rlab.vo;

import java.util.Date;

/**
 * Created by wanshou on 2017/9/20.
 */
public class FrontProviderInfo {

    private Long orgOid;

    private String orgName;

    private Integer orgIdentification;

    private String orgIdentificationStr;

    private Date applicationTime;

    private String applicationTimeStr;

    private String orgBizName;

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

    public Integer getOrgIdentification() {
        return orgIdentification;
    }

    public void setOrgIdentification(Integer orgIdentification) {
        this.orgIdentification = orgIdentification;
    }

    public Date getApplicationTime() {
        return applicationTime;
    }

    public void setApplicationTime(Date applicationTime) {
        this.applicationTime = applicationTime;
    }

    public String getOrgBizName() {
        return orgBizName;
    }

    public void setOrgBizName(String orgBizName) {
        this.orgBizName = orgBizName;
    }

    public String getApplicationTimeStr() {
        return applicationTimeStr;
    }

    public void setApplicationTimeStr(String applicationTimeStr) {
        this.applicationTimeStr = applicationTimeStr;
    }

    public String getOrgIdentificationStr() {
        return orgIdentificationStr;
    }

    public void setOrgIdentificationStr(String orgIdentificationStr) {
        this.orgIdentificationStr = orgIdentificationStr;
    }
}
