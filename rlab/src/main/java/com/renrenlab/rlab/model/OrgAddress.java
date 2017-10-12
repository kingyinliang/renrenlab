package com.renrenlab.rlab.model;

import java.math.BigDecimal;
import java.util.Date;

public class OrgAddress {

    private Long id;

    private Long orgAddrId;

    private Long orgId;

    private String orgAddrCountry;

    private String orgAddrProvince;

    private String orgAddrCity;

    private String orgAddrDistrict;

    private String orgAddrStreet;

    private String orgZipcode;

    private Integer orgAddrState;

    private BigDecimal orgAddrLongitude;

    private BigDecimal orgAddrLatitude;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgAddrId() {
        return orgAddrId;
    }

    public void setOrgAddrId(Long orgAddrId) {
        this.orgAddrId = orgAddrId;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getOrgAddrCountry() {
        return orgAddrCountry;
    }

    public void setOrgAddrCountry(String orgAddrCountry) {
        this.orgAddrCountry = orgAddrCountry == null ? null : orgAddrCountry.trim();
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

    public String getOrgAddrStreet() {
        return orgAddrStreet;
    }

    public void setOrgAddrStreet(String orgAddrStreet) {
        this.orgAddrStreet = orgAddrStreet == null ? null : orgAddrStreet.trim();
    }

    public String getOrgZipcode() {
        return orgZipcode;
    }

    public void setOrgZipcode(String orgZipcode) {
        this.orgZipcode = orgZipcode == null ? null : orgZipcode.trim();
    }

    public Integer getOrgAddrState() {
        return orgAddrState;
    }

    public void setOrgAddrState(Integer orgAddrState) {
        this.orgAddrState = orgAddrState;
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

    public String getOrgAddrDistrict() {
        return orgAddrDistrict;
    }

    public void setOrgAddrDistrict(String orgAddrDistrict) {
        this.orgAddrDistrict = orgAddrDistrict;
    }
}