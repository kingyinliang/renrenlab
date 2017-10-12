package com.renrenlab.rlab.model;

import java.util.Date;

public class InsListInfo {
    private Long mapId;

    private String insName;

    private String insMode;

    private String insBrand;

    private Object insCategory;

    private Object insScopeName;

    private Object insFeatureName;

    private String insServiceType;

    private String orgName;

    private String orgAddrProvince;

    private String orgAddrCity;

    private String orgAddrDistrict;

    private String orgAddrStreet;

    private Double orgAddrLongitude;

    private Double orgAddrLatitude;

    private String insOrgPriceList;

    private Price price;

    private String insPic;

    private Integer indexState;

    private Date createTime;

    private Date modifyTime;

    private Long orgOid;

    public Price getPrice() {
        return price;
    }

    public void setPrice(Price price) {
        this.price = price;
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
        this.insName = insName == null ? null : insName.trim();
    }

    public String getInsMode() {
        return insMode;
    }

    public void setInsMode(String insMode) {
        this.insMode = insMode == null ? null : insMode.trim();
    }

    public String getInsBrand() {
        return insBrand;
    }

    public void setInsBrand(String insBrand) {
        this.insBrand = insBrand == null ? null : insBrand.trim();
    }

    public Object getInsFeatureName() {
        return insFeatureName;
    }

    public void setInsFeatureName(Object insFeatureName) {
        this.insFeatureName = insFeatureName;
    }

    public String getInsServiceType() {
        return insServiceType;
    }

    public void setInsServiceType(String insServiceType) {
        this.insServiceType = insServiceType == null ? null : insServiceType.trim();
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
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

    public String getOrgAddrStreet() {
        return orgAddrStreet;
    }

    public void setOrgAddrStreet(String orgAddrStreet) {
        this.orgAddrStreet = orgAddrStreet == null ? null : orgAddrStreet.trim();
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

    public Object getInsCategory() {
        return insCategory;
    }

    public void setInsCategory(Object insCategory) {
        this.insCategory = insCategory;
    }

    public Object getInsScopeName() {
        return insScopeName;
    }

    public void setInsScopeName(Object insScopeName) {
        this.insScopeName = insScopeName;
    }

    public String getInsOrgPriceList() {
        return insOrgPriceList;
    }

    public void setInsOrgPriceList(String insOrgPriceList) {
        this.insOrgPriceList = insOrgPriceList;
    }

    public String getInsPic() {
        return insPic;
    }

    public void setInsPic(String insPic) {
        this.insPic = insPic == null ? null : insPic.trim();
    }

    public Integer getIndexState() {
        return indexState;
    }

    public void setIndexState(Integer indexState) {
        this.indexState = indexState;
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

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }
}