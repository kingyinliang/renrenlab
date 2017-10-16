package com.renrenlab.cms.communication.vo.params;

public class UserInfo {

	private String uId;
	
	private String orgIds;
	
	private String uName;
	
	private String uPhone;
	
	private String uOrgName;

	private String uDetailAddress;

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getOrgIds() {
		return orgIds;
	}

	public void setOrgIds(String orgIds) {
		this.orgIds = orgIds;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuOrgName() {
		return uOrgName;
	}

	public void setuOrgName(String uOrgName) {
		this.uOrgName = uOrgName;
	}

	public String getuDetailAddress() {
		return uDetailAddress;
	}

	public void setuDetailAddress(String uDetailAddress) {
		this.uDetailAddress = uDetailAddress;
	}
}
