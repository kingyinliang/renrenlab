package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class SessionHistory implements Serializable {

    private static final long serialVersionUID = -1526869969822525224L;

    private Long id;

    private Long hId;

    private Long sSid;

    private String hValue;

    private String hKey;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long gethId() {
        return hId;
    }

    public void sethId(Long hId) {
        this.hId = hId;
    }

    public Long getsSid() {
        return sSid;
    }

    public void setsSid(Long sSid) {
        this.sSid = sSid;
    }

    public String gethValue() {
        return hValue;
    }

    public void sethValue(String hValue) {
        this.hValue = hValue == null ? null : hValue.trim();
    }

    public String gethKey() {
        return hKey;
    }

    public void sethKey(String hKey) {
        this.hKey = hKey == null ? null : hKey.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}