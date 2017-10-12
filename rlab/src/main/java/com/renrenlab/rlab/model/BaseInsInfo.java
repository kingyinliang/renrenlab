package com.renrenlab.rlab.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 基本仪器信息表
 */
public class BaseInsInfo implements Serializable {

    private Long insIid;

    private Object insCategory;

    private String insName;

    private String insMode;

    private String insBrand;

    private String insOrigin;

    private String insMaker;

    private Object insDescription;

    private Object insPic;

    private Object insCoreParam;

    private Date modifyTime;

    private String time;

    //仪器分类 三级
    private List<InstrumentCategory> insturmentCategories;

    public List<InstrumentCategory> getInsturmentCategories() {
        return insturmentCategories;
    }

    public void setInsturmentCategories(List<InstrumentCategory> insturmentCategories) {
        this.insturmentCategories = insturmentCategories;
    }

    public Long getInsIid() {
        return insIid;
    }

    public void setInsIid(Long insIid) {
        this.insIid = insIid;
    }

    public Object getInsCategory() {
        return insCategory;
    }

    public void setInsCategory(Object insCategory) {
        this.insCategory = insCategory;
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

    public String getInsMaker() {
        return insMaker;
    }

    public void setInsMaker(String insMaker) {
        this.insMaker = insMaker;
    }

    public Object getInsDescription() {
        return insDescription;
    }

    public void setInsDescription(Object insDescription) {
        this.insDescription = insDescription;
    }

    public Object getInsPic() {
        return insPic;
    }

    public void setInsPic(Object insPic) {
        this.insPic = insPic;
    }

    public Object getInsCoreParam() {
        return insCoreParam;
    }

    public void setInsCoreParam(Object insCoreParam) {
        this.insCoreParam = insCoreParam;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}