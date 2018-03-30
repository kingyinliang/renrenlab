package com.renrenlab.rlab.model;

import java.math.BigDecimal;
import java.util.Date;

public class OrgIndex {
    private Long id;

    private Long orgOid;

    private String orgName;

    private String orgCategoryName;

    private String orgLogo;

    private Integer orgInsCount;

    private Integer orgServiceCount;

    private String orgAddrProvince;

    private String orgAddrCity;

    private String orgAddrDistrict;

    private Float orgShareIndex;

    private Integer orgRank;

    private Object orgKeyword;

    private Date createTime;

    private Date modifyTime;

    private BigDecimal orgAddrLongitude;

    private BigDecimal orgAddrLatitude;

    private String orgShareIndexStr;

    private Short orgType;

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
        this.orgName = orgName == null ? null : orgName.trim();
    }

    public String getOrgCategoryName() {
        return orgCategoryName;
    }

    public void setOrgCategoryName(String orgCategoryName) {
        this.orgCategoryName = orgCategoryName == null ? null : orgCategoryName.trim();
    }

    public String getOrgLogo() {
        return orgLogo;
    }

    public void setOrgLogo(String orgLogo) {
        this.orgLogo = orgLogo == null ? null : orgLogo.trim();
    }

    public Integer getOrgInsCount() {
        return orgInsCount;
    }

    public void setOrgInsCount(Integer orgInsCount) {
        this.orgInsCount = orgInsCount;
    }

    public Integer getOrgServiceCount() {
        return orgServiceCount;
    }

    public void setOrgServiceCount(Integer orgServiceCount) {
        this.orgServiceCount = orgServiceCount;
    }

    public String getOrgAddrProvince() {
        return orgAddrProvince;
    }

    public void setOrgAddrProvince(String orgAddrProvince) {
        this.orgAddrProvince = orgAddrProvince == null ? null : orgAddrProvince.trim();
    }

    public String getOrgAddrCity() {
        return orgAddrCity;
    }

    public void setOrgAddrCity(String orgAddrCity) {
        this.orgAddrCity = orgAddrCity == null ? null : orgAddrCity.trim();
    }

    public String getOrgAddrDistrict() {
        return orgAddrDistrict;
    }

    public void setOrgAddrDistrict(String orgAddrDistrict) {
        this.orgAddrDistrict = orgAddrDistrict == null ? null : orgAddrDistrict.trim();
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

    public Object getOrgKeyword() {
        return orgKeyword;
    }

    public void setOrgKeyword(Object orgKeyword) {
        this.orgKeyword = orgKeyword;
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

    public BigDecimal getOrgAddrLongitude() {
        return orgAddrLongitude;
    }

    public void setOrgAddrLongitude(BigDecimal orgAddrLongitude) {
        this.orgAddrLongitude = orgAddrLongitude;
    }

    public BigDecimal getOrgAddrLatitude() {
        return orgAddrLatitude;
    }

    public void setOrgAddrLatitude(BigDecimal orgAddrLatitude) {
        this.orgAddrLatitude = orgAddrLatitude;
    }

    public Short getOrgType() {
        return orgType;
    }

    public void setOrgType(Short orgType) {
        this.orgType = orgType;
    }

    public String getOrgShareIndexStr() {
        return orgShareIndexStr;
    }

    public void setOrgShareIndexStr(String orgShareIndexStr) {
        this.orgShareIndexStr = orgShareIndexStr;
    }
}