package com.renrenlab.cms.communication.vo;

/**
 * 优惠券VO
 * @author Renrenlab
 *
 */
public class CouponInfo {

    private long coId;

    private String couponName;
    /**
     * 0 正常 1已过期 2已使用3已禁用
     */
    private int cState;
	public long getCoId() {
		return coId;
	}
	public void setCoId(long coId) {
		this.coId = coId;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getcState() {
		return cState;
	}
	public void setcState(int cState) {
		this.cState = cState;
	}
	@Override
	public String toString() {
		return "CouponInfo [coId=" + coId + ", couponName=" + couponName + ", cState=" + cState + "]";
	}
    

}
