package com.renrenlab.rlab.model;

import java.util.Date;

public class ShareInsModel {

    private Long id;

    private Long mapId;

    private Long insIid;

    private Long orgOid;

    private Object mapState;

    private Object insScope;

    private Object insFeature;

    private Object insOrgPriceList;

    private Object mapDescription;

    private Integer infoSource;

    private Long orgAddrId;

    private Object conId;

    private Date createTime;

    private Date modifyTime;

    private Integer serviceType;

    private Object mapNewIns;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMapId() {
        return mapId;
    }

    public void setMapId(Long mapId) {
        this.mapId = mapId;
    }

    public Long getInsIid() {
        return insIid;
    }

    public void setInsIid(Long insIid) {
        this.insIid = insIid;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }

    public Object getMapState() {
        return mapState;
    }

    public void setMapState(Object mapState) {
        this.mapState = mapState;
    }

    public Object getInsScope() {
        return insScope;
    }

    public void setInsScope(Object insScope) {
        this.insScope = insScope;
    }

    public Object getInsFeature() {
        return insFeature;
    }

    public void setInsFeature(Object insFeature) {
        this.insFeature = insFeature;
    }

    public Object getInsOrgPriceList() {
        return insOrgPriceList;
    }

    public void setInsOrgPriceList(Object insOrgPriceList) {
        this.insOrgPriceList = insOrgPriceList;
    }

    public Object getMapDescription() {
        return mapDescription;
    }

    public void setMapDescription(Object mapDescription) {
        this.mapDescription = mapDescription;
    }

    public Integer getInfoSource() {
        return infoSource;
    }

    public void setInfoSource(Integer infoSource) {
        this.infoSource = infoSource;
    }

    public Long getOrgAddrId() {
        return orgAddrId;
    }

    public void setOrgAddrId(Long orgAddrId) {
        this.orgAddrId = orgAddrId;
    }

    public Object getConId() {
        return conId;
    }

    public void setConId(Object conId) {
        this.conId = conId;
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

    public Integer getServiceType() {
        return serviceType;
    }

    public void setServiceType(Integer serviceType) {
        this.serviceType = serviceType;
    }

    public Object getMapNewIns() {
        return mapNewIns;
    }

    public void setMapNewIns(Object mapNewIns) {
        this.mapNewIns = mapNewIns;
    }
}