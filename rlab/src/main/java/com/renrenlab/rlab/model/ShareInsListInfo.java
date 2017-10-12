package com.renrenlab.rlab.model;

import java.util.Date;
import java.util.List;

/**
 * Created by guanjipeng on 2017/7/21.
 * 共享仪器信息列表
 */
public class ShareInsListInfo {

    private Long mapId;
    //适用领域ids
    private Object insScope;

    private String insName;

    private String orgName;
    private String mapNewIns;

    private Long orgOid;

    private Object insOrgPriceList;
    //仪器适用用领域
    private List<InstrumentScope> insScopeList;

    private Date modifyTime;

    private Object mapState;

    private String time;

    public String getMapNewIns() {
        return mapNewIns;
    }

    public void setMapNewIns(String mapNewIns) {
        this.mapNewIns = mapNewIns;
    }

    public List<InstrumentScope> getInsScopeList() {
        return insScopeList;
    }

    public void setInsScopeList(List<InstrumentScope> insScopeList) {
        this.insScopeList = insScopeList;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public Long getMapId() {
        return mapId;
    }

    public void setMapId(Long mapId) {
        this.mapId = mapId;
    }

    public Object getInsScope() {
        return insScope;
    }

    public void setInsScope(Object insScope) {
        this.insScope = insScope;
    }

    public String getInsName() {
        return insName;
    }

    public void setInsName(String insName) {
        this.insName = insName;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }

    public Object getInsOrgPriceList() {
        return insOrgPriceList;
    }

    public void setInsOrgPriceList(Object insOrgPriceList) {
        this.insOrgPriceList = insOrgPriceList;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Object getMapState() {
        return mapState;
    }

    public void setMapState(Object mapState) {
        this.mapState = mapState;
    }
}
