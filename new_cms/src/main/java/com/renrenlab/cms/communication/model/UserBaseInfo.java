package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserBaseInfo implements Serializable {

    private static final long serialVersionUID = -9167758546276337102L;

    private Long id;

    private Long uUid;

    private String uName;

    private String uNickname;

    private String uPassword;

    private Boolean uSex;

    private Integer uAge;

    private Date uBirthday;

    private String uMobile;

    private String uEmail;

    private String uAvatar;

    private Integer uLevel;

    private Object uType;

    private Integer uSource;

    private Integer uState;

    private Integer uLoginCount;

    private Date uLastLoginTime;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuNickname() {
        return uNickname;
    }

    public void setuNickname(String uNickname) {
        this.uNickname = uNickname == null ? null : uNickname.trim();
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword == null ? null : uPassword.trim();
    }

    public Boolean getuSex() {
        return uSex;
    }

    public void setuSex(Boolean uSex) {
        this.uSex = uSex;
    }

    public Integer getuAge() {
        return uAge;
    }

    public void setuAge(Integer uAge) {
        this.uAge = uAge;
    }

    public Date getuBirthday() {
        return uBirthday;
    }

    public void setuBirthday(Date uBirthday) {
        this.uBirthday = uBirthday;
    }

    public String getuMobile() {
        return uMobile;
    }

    public void setuMobile(String uMobile) {
        this.uMobile = uMobile == null ? null : uMobile.trim();
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail == null ? null : uEmail.trim();
    }

    public String getuAvatar() {
        return uAvatar;
    }

    public void setuAvatar(String uAvatar) {
        this.uAvatar = uAvatar == null ? null : uAvatar.trim();
    }

    public Integer getuLevel() {
        return uLevel;
    }

    public void setuLevel(Integer uLevel) {
        this.uLevel = uLevel;
    }

    public Object getuType() {
        return uType;
    }

    public void setuType(Object uType) {
        this.uType = uType;
    }

    public Integer getuSource() {
        return uSource;
    }

    public void setuSource(Integer uSource) {
        this.uSource = uSource;
    }

    public Integer getuState() {
        return uState;
    }

    public void setuState(Integer uState) {
        this.uState = uState;
    }

    public Integer getuLoginCount() {
        return uLoginCount;
    }

    public void setuLoginCount(Integer uLoginCount) {
        this.uLoginCount = uLoginCount;
    }

    public Date getuLastLoginTime() {
        return uLastLoginTime;
    }

    public void setuLastLoginTime(Date uLastLoginTime) {
        this.uLastLoginTime = uLastLoginTime;
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
		return "UserBaseInfo [id=" + id + ", uUid=" + uUid + ", uName=" + uName + ", uNickname=" + uNickname
				+ ", uPassword=" + uPassword + ", uSex=" + uSex + ", uAge=" + uAge + ", uBirthday=" + uBirthday
				+ ", uMobile=" + uMobile + ", uEmail=" + uEmail + ", uAvatar=" + uAvatar + ", uLevel=" + uLevel
				+ ", uType=" + uType + ", uSource=" + uSource + ", uState=" + uState + ", uLoginCount=" + uLoginCount
				+ ", uLastLoginTime=" + uLastLoginTime + ", createTime=" + createTime + ", modifyTime=" + modifyTime
				+ "]";
	}
    
    
}