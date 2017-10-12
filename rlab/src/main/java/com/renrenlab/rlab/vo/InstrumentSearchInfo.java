package com.renrenlab.rlab.vo;

/**
 * 用于前端搜索仪器列表页
 *
 * @author guanjipeng
 */
public class InstrumentSearchInfo {

    private Long mapId;

    private Object insKeyword;

    private String insName;

    private String insMode;

    private String insBrand;

    private String orgName;

    private String insDescription;

    private Object insOrgPriceList;

    private String insPic;

    private String orgProvince;

    private String orgCity;

    private String orgStreet;

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

    public Long getMapId() {
        return mapId;
    }

    public void setMapId(Long mapId) {
        this.mapId = mapId;
    }

    public Object getInsKeyword() {
        return insKeyword;
    }

    public void setInsKeyword(Object insKeyword) {
        this.insKeyword = insKeyword;
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

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    public String getInsDescription() {
        return insDescription;
    }

    public void setInsDescription(String insDescription) {
        this.insDescription = insDescription == null ? null : insDescription.trim();
    }

    public Object getInsOrgPriceList() {
        return insOrgPriceList;
    }

    public void setInsOrgPriceList(Object insOrgPriceList) {
        this.insOrgPriceList = insOrgPriceList;
    }

    public String getInsPic() {
        return insPic;
    }

    public void setInsPic(String insPic) {
        this.insPic = insPic == null ? null : insPic.trim();
    }

    public String getOrgProvince() {
        return orgProvince;
    }

    public void setOrgProvince(String orgProvince) {
        this.orgProvince = orgProvince == null ? null : orgProvince.trim();
    }

    public String getOrgCity() {
        return orgCity;
    }

    public void setOrgCity(String orgCity) {
        this.orgCity = orgCity == null ? null : orgCity.trim();
    }

    public String getOrgStreet() {
        return orgStreet;
    }

    public void setOrgStreet(String orgStreet) {
        this.orgStreet = orgStreet == null ? null : orgStreet.trim();
    }

    @Override
    public String toString() {
        return this.orgName;
    }

}