package com.renrenlab.rlab.model;

import java.util.Date;

public class InstrumentFeature {
    private Long id;

    private Long insFeatureId;

    private String insFeatureName;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getInsFeatureId() {
        return insFeatureId;
    }

    public void setInsFeatureId(Long insFeatureId) {
        this.insFeatureId = insFeatureId;
    }

    public String getInsFeatureName() {
        return insFeatureName;
    }

    public void setInsFeatureName(String insFeatureName) {
        this.insFeatureName = insFeatureName == null ? null : insFeatureName.trim();
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