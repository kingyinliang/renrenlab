package com.renrenlab.rlab.model;

import java.io.Serializable;
import java.util.Date;

public class InstrumentBaseInfo implements Serializable {

    private static final long serialVersionUID = 3921034807873984026L;

    private Long id;

    private Long insIid;

    private String insName;

    private String insMode;

    private String insBrand;

    private String insOrigin;

    private String insMaker;

    private Object insDescription;

    private Object insPic;

    private Object insCoreParam;

    private Integer insState;

    private Date createTime;

    private Date modifyTime;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Integer getInsState() {
        return insState;
    }

    public void setInsState(Integer insState) {
        this.insState = insState;
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
}