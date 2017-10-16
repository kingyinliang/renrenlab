package com.renrenlab.cms.communication.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 方案表
 */
public class SchemeInfo implements Serializable {

	private static final long serialVersionUID = -9059759077132378434L;

	private Long schId;

    private Long pjId;

    private String schProject;

    private String schOrganization;

    private String schStandard;

    private String schInstrument;

    private String schQualifications;

    private String schPeriod;

    private Integer schOfferService;

    private Long schPrice;

    private String schDistance;

    private String schPraise;

    private Integer schFeature;

    private Integer schVersion;

    public Long getSchId() {
        return schId;
    }

    public void setSchId(Long schId) {
        this.schId = schId;
    }

    public Long getPjId() {
        return pjId;
    }

    public void setPjId(Long pjId) {
        this.pjId = pjId;
    }

    public String getSchProject() {
        return schProject;
    }

    public void setSchProject(String schProject) {
        this.schProject = schProject;
    }

    public String getSchOrganization() {
        return schOrganization;
    }

    public void setSchOrganization(String schOrganization) {
        this.schOrganization = schOrganization;
    }

    public String getSchStandard() {
        return schStandard;
    }

    public void setSchStandard(String schStandard) {
        this.schStandard = schStandard;
    }

    public String getSchInstrument() {
        return schInstrument;
    }

    public void setSchInstrument(String schInstrument) {
        this.schInstrument = schInstrument;
    }

    public String getSchQualifications() {
        return schQualifications;
    }

    public void setSchQualifications(String schQualifications) {
        this.schQualifications = schQualifications;
    }

    public String getSchPeriod() {
        return schPeriod;
    }

    public void setSchPeriod(String schPeriod) {
        this.schPeriod = schPeriod;
    }

    public Integer getSchOfferService() {
        return schOfferService;
    }

    public void setSchOfferService(Integer schOfferService) {
        this.schOfferService = schOfferService;
    }

    public Long getSchPrice() {
        return schPrice;
    }

    public void setSchPrice(Long schPrice) {
        this.schPrice = schPrice;
    }

    public String getSchDistance() {
        return schDistance;
    }

    public void setSchDistance(String schDistance) {
        this.schDistance = schDistance;
    }

    public String getSchPraise() {
        return schPraise;
    }

    public void setSchPraise(String schPraise) {
        this.schPraise = schPraise;
    }

    public Integer getSchFeature() {
        return schFeature;
    }

    public void setSchFeature(Integer schFeature) {
        this.schFeature = schFeature;
    }

    public Integer getSchVersion() {
        return schVersion;
    }

    public void setSchVersion(Integer schVersion) {
        this.schVersion = schVersion;
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

    private Date createTime;

    private Date modifyTime;

}