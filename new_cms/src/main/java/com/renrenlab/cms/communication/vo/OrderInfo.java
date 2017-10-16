package com.renrenlab.cms.communication.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单表 和 方案表 组合字段
 */
public class OrderInfo implements Serializable {

	private static final long serialVersionUID = -4341222279869944343L;

	private Long oId;

    private Long oNo;

    private Long schId;

    private Integer oState;

    private Integer oPrice;

    private Integer oOriginPrice;

    private String oShippingName;

    private String oShippingPhone;

    private String oShippingAddress;

    private Integer oType;

    private Date createTime;

    //方案

    private String schProject;

    private String schOrganization;

    private String schStandard;

    private String schInstrument;

    private Integer schOfferService;

    private String schQualifications;

    private String schPeriod;

    private String schDistance;

    public Integer getoOriginPrice() {
        return oOriginPrice;
    }

    public void setoOriginPrice(Integer oOriginPrice) {
        this.oOriginPrice = oOriginPrice;
    }

    public Long getoNo() {
        return oNo;
    }

    public void setoNo(Long oNo) {
        this.oNo = oNo;
    }

    public Long getoId() {
        return oId;
    }

    public void setoId(Long oId) {
        this.oId = oId;
    }

    public Long getSchId() {
        return schId;
    }

    public void setSchId(Long schId) {
        this.schId = schId;
    }

    public Integer getoState() {
        return oState;
    }

    public void setoState(Integer oState) {
        this.oState = oState;
    }

    public String getoShippingName() {
        return oShippingName;
    }

    public void setoShippingName(String oShippingName) {
        this.oShippingName = oShippingName;
    }

    public String getoShippingPhone() {
        return oShippingPhone;
    }

    public void setoShippingPhone(String oShippingPhone) {
        this.oShippingPhone = oShippingPhone;
    }

    public String getoShippingAddress() {
        return oShippingAddress;
    }

    public void setoShippingAddress(String oShippingAddress) {
        this.oShippingAddress = oShippingAddress;
    }

    public Integer getoType() {
        return oType;
    }

    public void setoType(Integer oType) {
        this.oType = oType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public Integer getoPrice() {
        return oPrice;
    }

    public void setoPrice(Integer oPrice) {
        this.oPrice = oPrice;
    }

    public Integer getSchOfferService() {
        return schOfferService;
    }

    public void setSchOfferService(Integer schOfferService) {
        this.schOfferService = schOfferService;
    }

    public String getSchDistance() {
        return schDistance;
    }

    public void setSchDistance(String schDistance) {
        this.schDistance = schDistance;
    }
}