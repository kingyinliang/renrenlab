package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单基本信息
 */
public class OrderBaseInfo implements Serializable {

    private static final long serialVersionUID = -8047039461082627105L;

    private Long id;

    private Long oId;

    private Long schId;

    private Long uUid;

    private Long oNo;

    private Integer oState;

    private String oShippingName;

    private String oShippingPhone;

    private String oShippingAddress;

    private Integer oOriginPrice;

    private Integer oPrice;

    private Integer oType;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public Long getoNo() {
        return oNo;
    }

    public void setoNo(Long oNo) {
        this.oNo = oNo;
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
        this.oShippingName = oShippingName == null ? null : oShippingName.trim();
    }

    public String getoShippingPhone() {
        return oShippingPhone;
    }

    public void setoShippingPhone(String oShippingPhone) {
        this.oShippingPhone = oShippingPhone == null ? null : oShippingPhone.trim();
    }

    public String getoShippingAddress() {
        return oShippingAddress;
    }

    public void setoShippingAddress(String oShippingAddress) {
        this.oShippingAddress = oShippingAddress == null ? null : oShippingAddress.trim();
    }

    public Integer getoOriginPrice() {
        return oOriginPrice;
    }

    public void setoOriginPrice(Integer oOriginPrice) {
        this.oOriginPrice = oOriginPrice;
    }

    public Integer getoPrice() {
        return oPrice;
    }

    public void setoPrice(Integer oPrice) {
        this.oPrice = oPrice;
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

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

	@Override
	public String toString() {
		return "OrderBaseInfo [id=" + id + ", oId=" + oId + ", schId=" + schId + ", uUid=" + uUid + ", oNo=" + oNo
				+ ", oState=" + oState + ", oShippingName=" + oShippingName + ", oShippingPhone=" + oShippingPhone
				+ ", oShippingAddress=" + oShippingAddress + ", oOriginPrice=" + oOriginPrice + ", oPrice=" + oPrice
				+ ", oType=" + oType + ", createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
	}
    
    
}