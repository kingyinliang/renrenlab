package com.renrenlab.rlab.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

public class ServiceInfo {
    private Long id;

    private Long serviceId;

    private Long orgOid;

    private String serviceName;

    private Object servicePics;

    private Object serviceFeature;

    private Object serviceCredit;

    private Object servicePrice;

    private String serviceDes;

    private Object serviceScope;

    private Object serviceMachine;

    private String serviceMethod;

    private String servicePeriod;

    private String serviceNote;

    private Object serviceContactId;

    private String serviceProvince;

    private String serviceCity;

    private String serviceDistrict;

    private String serviceAddress;

    private BigDecimal serviceLon;

    private BigDecimal serviceLat;

    private Date createTime;

    private Date modifyTime;

    private String modifyTimeStr;

    private Long serviceSubmiter;

    private int serviceIsManager;

    private int serviceState;

    private String stateStr;

    private Object serviceClassify;

    private Object serviceProductClassify;

    private String serviceCustomTag;

    public Object getServiceClassify() {
        return serviceClassify;
    }

    public void setServiceClassify(Object serviceClassify) {
        this.serviceClassify = serviceClassify;
    }

    public Object getServiceProductClassify() {
        return serviceProductClassify;
    }

    public void setServiceProductClassify(Object serviceProductClassify) {
        this.serviceProductClassify = serviceProductClassify;
    }

    public String getServiceCustomTag() {
        return serviceCustomTag;
    }

    public void setServiceCustomTag(String serviceCustomTag) {
        this.serviceCustomTag = serviceCustomTag;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    public String getModifyTimeStr() {
        return modifyTimeStr;
    }

    public void setModifyTimeStr(String modifyTimeStr) {
        this.modifyTimeStr = modifyTimeStr;
    }

    public int getServiceState() {
        return serviceState;
    }

    public void setServiceState(int serviceState) {
        this.serviceState = serviceState;
    }

    public Long getServiceSubmiter() {
        return serviceSubmiter;
    }

    public void setServiceSubmiter(Long serviceSubmiter) {
        this.serviceSubmiter = serviceSubmiter;
    }

    public int getServiceIsManager() {
        return serviceIsManager;
    }

    public void setServiceIsManager(int serviceIsManager) {
        this.serviceIsManager = serviceIsManager;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName == null ? null : serviceName.trim();
    }

    public Object getServicePics() {
        return servicePics;
    }

    public void setServicePics(Object servicePics) {
        this.servicePics = servicePics;
    }

    public Object getServiceFeature() {
        return serviceFeature;
    }

    public void setServiceFeature(Object serviceFeature) {
        this.serviceFeature = serviceFeature;
    }

    public Object getServiceCredit() {
        return serviceCredit;
    }

    public void setServiceCredit(Object serviceCredit) {
        this.serviceCredit = serviceCredit;
    }

    public Object getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(Object servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getServiceDes() {
        return serviceDes;
    }

    public void setServiceDes(String serviceDes) {
        this.serviceDes = serviceDes == null ? null : serviceDes.trim();
    }

    public Object getServiceScope() {
        return serviceScope;
    }

    public void setServiceScope(Object serviceScope) {
        this.serviceScope = serviceScope;
    }

    public Object getServiceMachine() {
        return serviceMachine;
    }

    public void setServiceMachine(Object serviceMachine) {
        this.serviceMachine = serviceMachine;
    }

    public String getServiceMethod() {
        return serviceMethod;
    }

    public void setServiceMethod(String serviceMethod) {
        this.serviceMethod = serviceMethod == null ? null : serviceMethod.trim();
    }

    public String getServicePeriod() {
        return servicePeriod;
    }

    public void setServicePeriod(String servicePeriod) {
        this.servicePeriod = servicePeriod == null ? null : servicePeriod.trim();
    }

    public String getServiceNote() {
        return serviceNote;
    }

    public void setServiceNote(String serviceNote) {
        this.serviceNote = serviceNote == null ? null : serviceNote.trim();
    }

    public Object getServiceContactId() {
        return serviceContactId;
    }

    public void setServiceContactId(Object serviceContactId) {
        this.serviceContactId = serviceContactId;
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

    public String getServiceAddress() {
        return serviceAddress;
    }

    public void setServiceAddress(String serviceAddress) {
        this.serviceAddress = serviceAddress == null ? null : serviceAddress.trim();
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