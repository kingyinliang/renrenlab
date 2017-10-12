package com.renrenlab.rlab.vo;

import org.apache.poi.openxml4j.opc.PackageRelationship;

import java.util.List;

/**
 * 用于前端展示仪器详情
 *
 * @author guanjipeng
 */
public class InstrumentDetailInfo {

    private Long mapId;

    private String insName;

    private String insMode;

    private String insBrand;

    private String insOrigin;

    private Object insPic;

    private String orgName;

    private Long orgOid;

    private Object insDescription;

    private Object insCoreParam;

    private Object mapDescription;

    private Object insOrgPriceList;

    private String orgProvince;

    private String orgCity;

    private String orgStreet;

    private String orgPerson;

    private String orgPhone;

    private List<String> orgContacts;

   private Long orgAddrId;

   private Object conId;

    public static class Description {
        public String title;
        public Object content;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public Object getContent() {
            return content;
        }

        public void setContent(Object content) {
            this.content = content;
        }
    }

    public static class Price {
        private String accPrice;
        private String scopeHighPrice;
        private String scopeLowPrice;
        private String blurPrice;
        private String unit;
        private String remark;
        private int flag;

        public String getBlurPrice() {
            return blurPrice;
        }

        public void setBlurPrice(String blurPrice) {
            this.blurPrice = blurPrice;
        }

        public String getRemark() {
            return remark;
        }

        public void setRemark(String remark) {
            this.remark = remark;
        }

        public String getAccPrice() {
            return accPrice;
        }

        public void setAccPrice(String accPrice) {
            this.accPrice = accPrice;
        }

        public String getScopeHighPrice() {
            return scopeHighPrice;
        }

        public void setScopeHighPrice(String scopeHighPrice) {
            this.scopeHighPrice = scopeHighPrice;
        }

        public String getScopeLowPrice() {
            return scopeLowPrice;
        }

        public void setScopeLowPrice(String scopeLowPrice) {
            this.scopeLowPrice = scopeLowPrice;
        }

        public String getUnit() {
            return unit;
        }

        public void setUnit(String unit) {
            this.unit = unit;
        }

        public int getFlag() {
            return flag;
        }

        public void setFlag(int flag) {
            this.flag = flag;
        }
    }

    public Object getInsCoreParam() {
        return insCoreParam;
    }

    public void setInsCoreParam(Object insCoreParam) {
        this.insCoreParam = insCoreParam;
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

    public Object getInsPic() {
        return insPic;
    }

    public void setInsPic(Object insPic) {
        this.insPic = insPic;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public Object getInsDescription() {
        return insDescription;
    }

    public void setInsDescription(Object insDescription) {
        this.insDescription = insDescription;
    }

    public Object getMapDescription() {
        return mapDescription;
    }

    public void setMapDescription(Object mapDescription) {
        this.mapDescription = mapDescription;
    }

    public String getOrgProvince() {
        return orgProvince;
    }

    public void setOrgProvince(String orgProvince) {
        this.orgProvince = orgProvince;
    }

    public String getOrgCity() {
        return orgCity;
    }

    public void setOrgCity(String orgCity) {
        this.orgCity = orgCity;
    }

    public String getOrgStreet() {
        return orgStreet;
    }

    public void setOrgStreet(String orgStreet) {
        this.orgStreet = orgStreet;
    }

    public String getOrgPerson() {
        return orgPerson;
    }

    public void setOrgPerson(String orgPerson) {
        this.orgPerson = orgPerson;
    }

    public String getOrgPhone() {
        return orgPhone;
    }

    public void setOrgPhone(String orgPhone) {
        this.orgPhone = orgPhone;
    }

    public Object getInsOrgPriceList() {
        return insOrgPriceList;
    }

    public void setInsOrgPriceList(Object insOrgPriceList) {
        this.insOrgPriceList = insOrgPriceList;
    }

    public List<String> getOrgContacts() {
        return orgContacts;
    }

    public void setOrgContacts(List<String> orgContacts) {
        this.orgContacts = orgContacts;
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

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }
}