package com.renrenlab.rlab.model;

public class InsDetailInfo {
    private Long mapId;

    private Long orgOid;

    private String insName;

    private String insMode;

    private String insBrand;

    private String insOrigin;

    private Object insPic;

    private Object insFeature;

    private String insServiceName;

    private Object insCategory;

    private Object insScope;

    private Object mapNewIns;

    private Price price;

    private Object insDescription;

    private Object mapDescription;

    private Object insCoreParam;

    private Object insOrgPriceList;

    private Object conId;

    private String linkPage;

    private String insCustomTag;

    public String getInsCustomTag() {
        return insCustomTag;
    }

    public void setInsCustomTag(String insCustomTag) {
        this.insCustomTag = insCustomTag;
    }

    public Object getMapDescription() {
        return mapDescription;
    }

    public void setMapDescription(Object mapDescription) {
        this.mapDescription = mapDescription;
    }

    public String getLinkPage() {
        return linkPage;
    }

    public void setLinkPage(String linkPage) {
        this.linkPage = linkPage;
    }

    public Object getConId() {
        return conId;
    }

    public void setConId(Object conId) {
        this.conId = conId;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }

    public Object getMapNewIns() {
        return mapNewIns;
    }

    public Object getInsScope() {
        return insScope;
    }

    public void setInsScope(Object insScope) {
        this.insScope = insScope;
    }

    public void setMapNewIns(Object mapNewIns) {
        this.mapNewIns = mapNewIns;
    }

    public Object getInsOrgPriceList() {
        return insOrgPriceList;
    }

    public void setInsOrgPriceList(Object insOrgPriceList) {
        this.insOrgPriceList = insOrgPriceList;
    }

    public Long getMapId() {
        return mapId;
    }

    public void setMapId(Long mapId) {
        this.mapId = mapId;
    }

    public String getInsName() {
        return insName;
    }

    public void setInsName(String insName) {
        this.insName = insName;
    }

    public String getInsMode() {
        return insMode;
    }

    public void setInsMode(String insMode) {
        this.insMode = insMode;
    }

    public String getInsBrand() {
        return insBrand;
    }

    public void setInsBrand(String insBrand) {
        this.insBrand = insBrand;
    }

    public String getInsOrigin() {
        return insOrigin;
    }

    public void setInsOrigin(String insOrigin) {
        this.insOrigin = insOrigin;
    }

    public Object getInsCategory() {
        return insCategory;
    }

    public void setInsCategory(Object insCategory) {
        this.insCategory = insCategory;
    }

    public Object getInsPic() {
        return insPic;
    }

    public void setInsPic(Object insPic) {
        this.insPic = insPic;
    }

    public Object getInsFeature() {
        return insFeature;
    }

    public void setInsFeature(Object insFeature) {
        this.insFeature = insFeature;
    }

    public String getInsServiceName() {
        return insServiceName;
    }

    public void setInsServiceName(String insServiceName) {
        this.insServiceName = insServiceName;
    }

    public Price getPrice() {
        return price;
    }

    public void setPrice(Price price) {
        this.price = price;
    }

    public Object getInsDescription() {
        return insDescription;
    }

    public void setInsDescription(Object insDescription) {
        this.insDescription = insDescription;
    }

    public Object getInsCoreParam() {
        return insCoreParam;
    }

    public void setInsCoreParam(Object insCoreParam) {
        this.insCoreParam = insCoreParam;
    }
}