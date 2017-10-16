package com.renrenlab.cms.communication.vo;

public class VerifyCodeApplyInfo {

	private String phone;
	private String password;
	private String validateCode;
	//0：注册
	//1：重置密码
	//2：绑定手机号
	private int action;
	
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "VerifyCodeApplyInfo [phone=" + phone + ", password=" + password + ", validateCode=" + validateCode
				+ ", action=" + action + "]";
	}

	
}
