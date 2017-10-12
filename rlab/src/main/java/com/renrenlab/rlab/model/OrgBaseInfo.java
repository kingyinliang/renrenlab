package com.renrenlab.rlab.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 机构实体
 * Created by wanshou on 2017/5/15.
 */
public class OrgBaseInfo implements Serializable{

    private static final long serialVersionUID = -7649191071565727669L;

    private Long id;

    private Long orgOid;

    private String orgName;

    private Integer orgCategoryId;

    private long orgParentId;

    private Integer orgIdentification;

    private String orgLogo;

    private String orgDescription;

    private String orgWeb;

    private Integer orgState;

    private Float orgShareIndex;

    private Integer orgRank;

    private Date createTime;

    private Date modifyTime;

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

    public Integer getOrgCategoryId() {
        return orgCategoryId;
    }

    public void setOrgCategoryId(Integer orgCategoryId) {
        this.orgCategoryId = orgCategoryId;
    }

    public Integer getOrgState() {
        return orgState;
    }

    public void setOrgState(Integer orgState) {
        this.orgState = orgState;
    }

    public String getOrgLogo() {
        return orgLogo;
    }

    public void setOrgLogo(String orgLogo) {
        this.orgLogo = orgLogo;
    }

    public String getOrgDescription() {
        return orgDescription;
    }

    public void setOrgDescription(String orgDescription) {
        this.orgDescription = orgDescription;
    }

    public long getOrgParentId() {
        return orgParentId;
    }

    public void setOrgParentId(long orgParentId) {
        this.orgParentId = orgParentId;
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

    public Integer getOrgIdentification() {
        return orgIdentification;
    }

    public void setOrgIdentification(Integer orgIdentification) {
        this.orgIdentification = orgIdentification;
    }

    public String getOrgWeb() {
        return orgWeb;
    }

    public void setOrgWeb(String orgWeb) {
        this.orgWeb = orgWeb;
    }

    public Float getOrgShareIndex() {
        return orgShareIndex;
    }

    public void setOrgShareIndex(Float orgShareIndex) {
        this.orgShareIndex = orgShareIndex;
    }

    public Integer getOrgRank() {
        return orgRank;
    }

    public void setOrgRank(Integer orgRank) {
        this.orgRank = orgRank;
    }
}
