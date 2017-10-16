package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 方案表
 */
public class OrderScheme implements Serializable {

    private static final long serialVersionUID = -8190797632729886195L;

    private Long id;

    private Long schId;

    private long pjId;

    private String schProject;

    private String schOrganization;

    private String schStandard;

    private String schInstrument;

    private String schQualifications;

    private String schPeriod;

    private String schOfferService;

    private Integer schPrice;

    private String schDistance;

    private String schPraise;

    private Integer schFeature;

    private Integer schVersion;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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
        this.schProject = schProject == null ? null : schProject.trim();
    }

    public String getSchOrganization() {
        return schOrganization;
    }

    public void setSchOrganization(String schOrganization) {
        this.schOrganization = schOrganization == null ? null : schOrganization.trim();
    }

    public String getSchStandard() {
        return schStandard;
    }

    public void setSchStandard(String schStandard) {
        this.schStandard = schStandard == null ? null : schStandard.trim();
    }

    public String getSchInstrument() {
        return schInstrument;
    }

    public void setSchInstrument(String schInstrument) {
        this.schInstrument = schInstrument == null ? null : schInstrument.trim();
    }

    public String getSchQualifications() {
        return schQualifications;
    }

    public void setSchQualifications(String schQualifications) {
        this.schQualifications = schQualifications == null ? null : schQualifications.trim();
    }

    public String getSchPeriod() {
        return schPeriod;
    }

    public void setSchPeriod(String schPeriod) {
        this.schPeriod = schPeriod == null ? null : schPeriod.trim();
    }

    public String getSchOfferService() {
        return schOfferService;
    }

    public void setSchOfferService(String schOfferService) {
        this.schOfferService = schOfferService == null ? null : schOfferService.trim();
    }

    public Integer getSchPrice() {
        return schPrice;
    }

    public void setSchPrice(Integer schPrice) {
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
        this.schPraise = schPraise == null ? null : schPraise.trim();
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

	@Override
	public String toString() {
		return "OrderScheme [id=" + id + ", schId=" + schId + ", pjId=" + pjId + ", schProject=" + schProject
				+ ", schOrganization=" + schOrganization + ", schStandard=" + schStandard + ", schInstrument="
				+ schInstrument + ", schQualifications=" + schQualifications + ", schPeriod=" + schPeriod
				+ ", schOfferService=" + schOfferService + ", schPrice=" + schPrice + ", schDistance=" + schDistance
				+ ", schPraise=" + schPraise + ", schFeature=" + schFeature + ", schVersion=" + schVersion
				+ ", createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
	}
    
    
}