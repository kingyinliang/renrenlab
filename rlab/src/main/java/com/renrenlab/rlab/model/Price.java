package com.renrenlab.rlab.model;

/**
 * Created by guanjipeng on 2017/7/21.
 */
public class Price {
    private String accPrice;
    private String scopeHighPrice;
    private String scopeLowPrice;
    private String blurPrice;
    private String unit;
    private String remark;
    private int flag;
     /* case1:{
             "accPrice":100,
             "unit" : "天",
             "remark":"解释说明"
             "flag":1
         }
        case2:{
            "scopeHighPrice":100,
            "scopeLowPrice":10,
            "unit" : "天",
            "remark":"解释说明"
            "flag":2
        }
        case3:{
        "blurPrice":模糊价格,
        "remark":"解释说明"
        "flag":3
        }
        */

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

    public String getBlurPrice() {
        return blurPrice;
    }

    public void setBlurPrice(String blurPrice) {
        this.blurPrice = blurPrice;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }
}
