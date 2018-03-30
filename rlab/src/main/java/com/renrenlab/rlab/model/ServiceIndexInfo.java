package com.renrenlab.rlab.model;

import java.math.BigDecimal;
import java.util.Date;

public class ServiceIndexInfo {

    private Long serviceId;

    private Long orgOid;

    private String serviceName;

    private String orgName;

    private Object servicePrice;

    private String servicePic;

    private Object serviceScope;

    private Object serviceAptitude;

    private String serviceProvince;

    private String serviceCity;

    private String serviceDistrict;

    private BigDecimal serviceLon;

    private BigDecimal serviceLat;

    private Date createTime;

    private Date modifyTime;

    private String serviceCustomTag;

    public String getServiceCustomTag() {
        return serviceCustomTag;
    }

    public void setServiceCustomTag(String serviceCustomTag) {
        this.serviceCustomTag = serviceCustomTag;
    }

    public Long getServiceId() {
        return serviceId;
    }

    public void setServiceId(Long serviceId) {
        this.serviceId = serviceId;
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

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName == null ? null : serviceName.trim();
    }

    public Object getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(Object servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getServicePic() {
        return servicePic;
    }

    public void setServicePic(String servicePic) {
        this.servicePic = servicePic == null ? null : servicePic.trim();
    }

    public Object getServiceScope() {
        return serviceScope;
    }

    public void setServiceScope(Object serviceScope) {
        this.serviceScope = serviceScope;
    }

    public Object getServiceAptitude() {
        return serviceAptitude;
    }

    public void setServiceAptitude(Object serviceAptitude) {
        this.serviceAptitude = serviceAptitude;
    }

    public String getServiceProvince() {
        return serviceProvince;
    }

    public void setServiceProvince(String serviceProvince) {
        this.serviceProvince = serviceProvince == null ? null : serviceProvince.trim();
    }

    public String getServiceCity() {
        return serviceCity;
    }

    public void setServiceCity(String serviceCity) {
        this.serviceCity = serviceCity == null ? null : serviceCity.trim();
    }

    public String getServiceDistrict() {
        return serviceDistrict;
    }

    public void setServiceDistrict(String serviceDistrict) {
        this.serviceDistrict = serviceDistrict == null ? null : serviceDistrict.trim();
    }

    public BigDecimal getServiceLon() {
        return serviceLon;
    }

    public void setServiceLon(BigDecimal serviceLon) {
        this.serviceLon = serviceLon;
    }

    public BigDecimal getServiceLat() {
        return serviceLat;
    }

    public void setServiceLat(BigDecimal serviceLat) {
        this.serviceLat = serviceLat;
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