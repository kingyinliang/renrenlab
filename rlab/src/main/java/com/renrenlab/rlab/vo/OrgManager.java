package com.renrenlab.rlab.vo;

import java.util.Date;

public class OrgManager {

    private Long id;

    private Long orgMid;

    private Long orgOid;

    private Long uUid;

    private Integer managerType;

    private String uMobile;

    private String uName;

    private String uNickname;

    private Date modifyTime;

    private Date createTime;

    private String createTimeStr;

    public OrgManager(){}

    public OrgManager(Long orgOid, Long uUid) {
        this.orgOid = orgOid;
        this.uUid = uUid;
    }

    public OrgManager(Long orgMid, Long orgOid, Long uUid) {
        this.orgMid = orgMid;
        this.orgOid = orgOid;
        this.uUid = uUid;
    }

    public OrgManager(Long orgOid, Long uUid,Integer managerType) {
        this.orgOid = orgOid;
        this.uUid = uUid;
        this.managerType = managerType;
    }

    public Long getId() {
        return id;
    }

    public Long getOrgMid() {
        return orgMid;
    }

    public void setOrgMid(Long orgMid) {
        this.orgMid = orgMid;
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

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public Integer getManagerType() {
        return managerType;
    }

    public void setManagerType(Integer managerType) {
        this.managerType = managerType;
    }

    public String getuMobile() {
        return uMobile;
    }

    public void setuMobile(String uMobile) {
        this.uMobile = uMobile;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuNickname() {
        return uNickname;
    }

    public void setuNickname(String uNickname) {
        this.uNickname = uNickname;
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

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }
}