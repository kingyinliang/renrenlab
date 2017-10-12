package com.renrenlab.rlab.vo;

import java.io.Serializable;

/**
 * 用于仪器列表页显示 仪器概略信息
 * 加了些字段   仪器详细信息
 *
 * @author guanjipeng
 */
public class InstrumentInfo implements Serializable {

    private static final long serialVersionUID = -4069193728351922544L;

    private Long mapId; //rlab_instrument_info.t_intrument_org_map
    private Long insIid;

    private Long orgOid;

    private Long newOrgOid;

    private String insName;

    private String insMode;

    private String insBrand;

    private String insMaker;

    /*    {
             "accPrice":100,
             "unit" : "天",
             "remark":"解释说明"
             "flag":1
          }
        {
            "scopeHighPrice":100,
            "scopeLowPrice":10,
            "unit" : "天",
            "remark":"解释说明"
            "flag":2
        }

        {
        "blurPrice":模糊价格,
        "remark":"解释说明"
        "flag":3
        }
        */
    private Object insOrgPriceList;

    private String orgName;

    private Object insPic;

    private String insOrigin;

    private Object insDescription;

    private Integer insState;

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

    public Long getMapId() {
        return mapId;
    }

    public void setMapId(Long mapId) {
        this.mapId = mapId;
    }

    public String getInsMaker() {
        return insMaker;
    }

    public void setInsMaker(String insMaker) {
        this.insMaker = insMaker;
    }

    public Long getNewOrgOid() {
        return newOrgOid;
    }

    public void setNewOrgOid(Long newOrgOid) {
        this.newOrgOid = newOrgOid;
    }

    public Integer getInsState() {
        return insState;
    }

    public void setInsState(Integer insState) {
        this.insState = insState;
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

    public Object getInsDescription() {
        return insDescription;
    }

    public void setInsDescription(Object insDescription) {
        this.insDescription = insDescription;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
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

    public Long getInsIid() {
        return insIid;
    }

    public void setInsIid(Long insIid) {
        this.insIid = insIid;
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


    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
}