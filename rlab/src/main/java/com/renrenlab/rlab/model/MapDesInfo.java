package com.renrenlab.rlab.model;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * Created by guanjipeng on 2017/5/26.
 */
public class MapDesInfo {

    @JSONField(name = "保养情况")
    String maintenanceCondition;

    @JSONField(name = "出厂日期")
    String productionDate;

    @JSONField(name = "购买日期")
    String purchaseDate;

    @JSONField(name = "领域")
    String field;

    @JSONField(name = "其他说明")
    String[] otherComments;

    public String getMaintenanceCondition() {
        return maintenanceCondition;
    }

    public void setMaintenanceCondition(String maintenanceCondition) {
        this.maintenanceCondition = maintenanceCondition;
    }

    public String getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(String productionDate) {
        this.productionDate = productionDate;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String[] getOtherComments() {
        return otherComments;
    }

    public void setOtherComments(String[] otherComments) {
        this.otherComments = otherComments;
    }
}
