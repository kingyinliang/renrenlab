package com.renrenlab.rlab.vo;

import java.util.Date;

/**
 * 微信基本的配置 装配accessToken
 * @author Renrenlab
 *
 */
public class OldWebUser {

	private Long id;
	
	private String phone;

	private String password;

	private int roleId;

	private Date registerTime;

	private Date updateTime;

	//头像，如果是第三方登录则从外部抓取
	private String avatar;

	//真实姓名
	private String name;

	//昵称，如果是第三方登录则从外部抓取
	private String nickname;

	private String email;

	private String idcard;

	private String idcardPositive;

	private String idcardNegavite;
	
	private String idcardHandheld;

	private long orgId;

	private int status;

	private int action;
	
	//审核失败原因
	private String reason;

	private Date lastLoginTime;

	private long checkUserId;

	private Date checkTime;

	//0-常规数据，1-爬虫数据
	private int source;
	
	private int hopeRoleId = 1; //属性意向
	
	private String openid; 		//qq登陆openID，wx登录openID
	private String unionid;		//wx登录unionID
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getIdcardPositive() {
		return idcardPositive;
	}
	public void setIdcardPositive(String idcardPositive) {
		this.idcardPositive = idcardPositive;
	}
	public String getIdcardNegavite() {
		return idcardNegavite;
	}
	public void setIdcardNegavite(String idcardNegavite) {
		this.idcardNegavite = idcardNegavite;
	}
	public String getIdcardHandheld() {
		return idcardHandheld;
	}
	public void setIdcardHandheld(String idcardHandheld) {
		this.idcardHandheld = idcardHandheld;
	}
	public long getOrgId() {
		return orgId;
	}
	public void setOrgId(long orgId) {
		this.orgId = orgId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAction() {
		return action;
	}
	public void setAction(int action) {
		this.action = action;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public long getCheckUserId() {
		return checkUserId;
	}
	public void setCheckUserId(long checkUserId) {
		this.checkUserId = checkUserId;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public int getHopeRoleId() {
		return hopeRoleId;
	}
	public void setHopeRoleId(int hopeRoleId) {
		this.hopeRoleId = hopeRoleId;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getUnionid() {
		return unionid;
	}
	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}
	
}
