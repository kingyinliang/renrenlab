package com.renrenlab.rlab.model;

import java.io.Serializable;

/**
 * Created by guanjipeng on 2017/7/27.
 * 服务方式
 */
public class InsServiceType implements Serializable {
    private Long insServiceId;
    private String insServiceName;
    private Object insServiceType;

    public Long getInsServiceId() {
        return insServiceId;
    }

    public void setInsServiceId(Long insServiceId) {
        this.insServiceId = insServiceId;
    }

    public String getInsServiceName() {
        return insServiceName;
    }

    public void setInsServiceName(String insServiceName) {
        this.insServiceName = insServiceName;
    }

    public Object getInsServiceType() {
        return insServiceType;
    }

    public void setInsServiceType(Object insServiceType) {
        this.insServiceType = insServiceType;
    }
}
