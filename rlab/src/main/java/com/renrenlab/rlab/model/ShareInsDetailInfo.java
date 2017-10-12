package com.renrenlab.rlab.model;

import com.renrenlab.rlab.vo.OrgContacts;

import java.io.Serializable;
import java.util.List;

/**
 * Created by guanjipeng on 2017/7/21.
 * 共享仪器信息详情
 */
public class ShareInsDetailInfo implements Serializable {

    private Long mapId;
    private Object mapDescription;
    private Object mapNewIns;
    private Object mapState;
    private String insName;

    private String insMode;
    private String insBrand;
    private Object insPic;
    private String insOrigin;
    //仪器分类
    private Object insCategory;
    private List<InstrumentCategory> insCategoryList;
    //适用领域id
    private Object insScope;
    private List<InstrumentScope> insScopeList;
    private Object insCoreParam;
    private Object insDescription;
    private Long orgOid;
    private String orgName;
    private Object insOrgPriceList;
    // 仪器特点 ["服务好","送样快"]
    private Object insFeature;
    private List<InstrumentFeature> insFeatureList;
    private Object objInsFeatureList;
    private Long orgAddrId;
    private String orgAddrProvince;
    private String orgAddrCity;
    private String orgAddrDistrict;
    private String orgAddrStreet;
    //联系人id
    private Object conId;
    private List<String> conIdList;
    private List<OrgContacts> conList;
    private Object objConList;
    private String conPhone;
    private String conName;
    private String conProvince;
    private String conCity;
    private String conStreet;
    private Double orgAddrLongitude;
    private Double orgAddrLatitude;
    //服务类型
    private List<InsServiceType> types;
    private Long insServiceType;
    private String insServiceName;


    public List<String> getConIdList() {
        return conIdList;
    }

    public void setConIdList(List<String> conIdList) {
        this.conIdList = conIdList;
    }

    public Object getObjConList() {
        return objConList;
    }

    public void setObjConList(Object objConList) {
        this.objConList = objConList;
    }

    public Object getObjInsFeatureList() {
        return objInsFeatureList;
    }

    public void setObjInsFeatureList(Object objInsFeatureList) {
        this.objInsFeatureList = objInsFeatureList;
    }

    public String getInsServiceName() {
        return insServiceName;
    }

    public void setInsServiceName(String insServiceName) {
        this.insServiceName = insServiceName;
    }

    public List<InsServiceType> getTypes() {
        return types;
    }

    public void setTypes(List<InsServiceType> types) {
        this.types = types;
    }

    public Long getInsServiceType() {
        return insServiceType;
    }

    public void setInsServiceType(Long insServiceType) {
        this.insServiceType = insServiceType;
    }

    public Long getOrgAddrId() {
        return orgAddrId;
    }

    public void setOrgAddrId(Long orgAddrId) {
        this.orgAddrId = orgAddrId;
    }

    public Object getMapNewIns() {
        return mapNewIns;
    }

    public void setMapNewIns(Object mapNewIns) {
        this.mapNewIns = mapNewIns;
    }

    public String getOrgAddrDistrict() {
        return orgAddrDistrict;
    }

    public void setOrgAddrDistrict(String orgAddrDistrict) {
        this.orgAddrDistrict = orgAddrDistrict;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }

    public Object getMapDescription() {
        return mapDescription;
    }

    public void setMapDescription(Object mapDescription) {
        this.mapDescription = mapDescription;
    }

    public List<OrgContacts> getConList() {
        return conList;
    }

    public void setConList(List<OrgContacts> conList) {
        this.conList = conList;
    }

    public Object getInsFeature() {
        return insFeature;
    }

    public void setInsFeature(Object insFeature) {
        this.insFeature = insFeature;
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

    public Long getMapId() {
        return mapId;
    }

    public void setMapId(Long mapId) {
        this.mapId = mapId;
    }

    public Object getMapState() {
        return mapState;
    }

    public void setMapState(Object mapState) {
        this.mapState = mapState;
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

    public Object getInsPic() {
        return insPic;
    }

    public void setInsPic(Object insPic) {
        this.insPic = insPic;
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

    public Object getInsScope() {
        return insScope;
    }

    public void setInsScope(Object insScope) {
        this.insScope = insScope;
    }

    public List<InstrumentScope> getInsScopeList() {
        return insScopeList;
    }

    public void setInsScopeList(List<InstrumentScope> insScopeList) {
        this.insScopeList = insScopeList;
    }

    public Object getInsCoreParam() {
        return insCoreParam;
    }

    public void setInsCoreParam(Object insCoreParam) {
        this.insCoreParam = insCoreParam;
    }

    public Object getInsDescription() {
        return insDescription;
    }

    public void setInsDescription(Object insDescription) {
        this.insDescription = insDescription;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public Object getInsOrgPriceList() {
        return insOrgPriceList;
    }

    public void setInsOrgPriceList(Object insOrgPriceList) {
        this.insOrgPriceList = insOrgPriceList;
    }

    public Object getConId() {
        return conId;
    }

    public void setConId(Object conId) {
        this.conId = conId;
    }

    public String getConPhone() {
        return conPhone;
    }

    public void setConPhone(String conPhone) {
        this.conPhone = conPhone;
    }

    public String getConName() {
        return conName;
    }

    public void setConName(String conName) {
        this.conName = conName;
    }

    public String getConProvince() {
        return conProvince;
    }

    public void setConProvince(String conProvince) {
        this.conProvince = conProvince;
    }

    public String getConCity() {
        return conCity;
    }

    public void setConCity(String conCity) {
        this.conCity = conCity;
    }

    public String getConStreet() {
        return conStreet;
    }

    public void setConStreet(String conStreet) {
        this.conStreet = conStreet;
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

    public List<InstrumentCategory> getInsCategoryList() {
        return insCategoryList;
    }

    public void setInsCategoryList(List<InstrumentCategory> insCategoryList) {
        this.insCategoryList = insCategoryList;
    }

    public List<InstrumentFeature> getInsFeatureList() {
        return insFeatureList;
    }

    public void setInsFeatureList(List<InstrumentFeature> insFeatureList) {
        this.insFeatureList = insFeatureList;
    }

    @Override
    public String toString() {
        return "ShareInsDetailInfo{" +
                ", mapId=" + mapId +
                ", mapDescription=" + mapDescription +
                ", mapState=" + mapState +
                ", insName='" + insName + '\'' +
                ", insMode='" + insMode + '\'' +
                ", insBrand='" + insBrand + '\'' +
                ", insPic=" + insPic +
                ", insOrigin='" + insOrigin + '\'' +
                ", insCategory=" + insCategory +
                ", insCategoryList=" + insCategoryList +
                ", insScope=" + insScope +
                ", insScopeList=" + insScopeList +
                ", insCoreParam=" + insCoreParam +
                ", insDescription=" + insDescription +
                ", orgOid=" + orgOid +
                ", orgName='" + orgName + '\'' +
                ", insOrgPriceList=" + insOrgPriceList +
                ", insFeature=" + insFeature +
                ", insFeatureList=" + insFeatureList +
                ", orgAddrProvince='" + orgAddrProvince + '\'' +
                ", orgAddrCity='" + orgAddrCity + '\'' +
                ", orgAddrStreet='" + orgAddrStreet + '\'' +
                ", conId=" + conId +
                ", conList=" + conList +
                ", conPhone='" + conPhone + '\'' +
                ", conName='" + conName + '\'' +
                ", conProvince='" + conProvince + '\'' +
                ", conCity='" + conCity + '\'' +
                ", conStreet='" + conStreet + '\'' +
                ", orgAddrLongitude=" + orgAddrLongitude +
                ", orgAddrLatitude=" + orgAddrLatitude +
                '}';
    }
}
