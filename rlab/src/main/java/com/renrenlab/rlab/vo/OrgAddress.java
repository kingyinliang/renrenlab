package com.renrenlab.rlab.vo;

import java.util.Date;

/**
 * Created by wanshou on 2017/5/16.
 */
public class OrgAddress {

    private Long id;

    private Long orgAddrId;

    private long orgId;

    private String orgAddrCountry;

    private String orgAddrProvince;

    private String orgAddrCity;

    private String orgAddrDistrict;

    private String orgAddrStreet;

    private String orgZipcode;

    private Integer orgAddrState;

    private Double orgAddrLongitude;

    private Double orgAddrLatitude;

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

    public long getOrgId() {
        return orgId;
    }

    public void setOrgId(long orgId) {
        this.orgId = orgId;
    }

    public String getOrgAddrCountry() {
        return orgAddrCountry;
    }

    public void setOrgAddrCountry(String orgAddrCountry) {
        this.orgAddrCountry = orgAddrCountry;
    }

    public String getOrgAddrProvince() {
        return orgAddrProvince;
    }

    public void setOrgAddrProvince(String orgAddrProvince) {
        this.orgAddrProvince = orgAddrProvince;
    }

    public String getOrgAddrCity() {
        return orgAddrCity;
    }

    public void setOrgAddrCity(String orgAddrCity) {
        this.orgAddrCity = orgAddrCity;
    }

    public String getOrgAddrStreet() {
        return orgAddrStreet;
    }

    public void setOrgAddrStreet(String orgAddrStreet) {
        this.orgAddrStreet = orgAddrStreet;
    }

    public String getOrgZipcode() {
        return orgZipcode;
    }

    public void setOrgZipcode(String orgZipcode) {
        this.orgZipcode = orgZipcode;
    }

    public Integer getOrgAddrState() {
        return orgAddrState;
    }

    public void setOrgAddrState(Integer orgAddrState) {
        this.orgAddrState = orgAddrState;
    }

    public Double getOrgAddrLongitude() {
        return orgAddrLongitude;
    }

    public void setOrgAddrLongitude(Double orgAddrLongitude) {
        this.orgAddrLongitude = orgAddrLongitude;
    }

    public Double getOrgAddrLatitude() {
        return orgAddrLatitude;
    }

    public void setOrgAddrLatitude(Double orgAddrLatitude) {
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
