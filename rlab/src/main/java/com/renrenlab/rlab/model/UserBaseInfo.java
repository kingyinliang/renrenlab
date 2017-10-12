package com.renrenlab.rlab.model;

import java.util.Date;

public class UserBaseInfo {

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

    private Integer uAuthentication; //用户认证状态

    private Integer uSource;

    private Integer uState;

    private Integer uLoginCount;

    private Date uLastLoginTime;

    private Date createTime;

    private String createTimeStr;

    private Date modifyTime;

    private String identifyPic1;

    private String identifyPic2;

    private String identifyPic3;

    private String identifyFullname;

    private String identifyNo;

    //管理员工号
    private String uJobNumber;
    //拥有的权限
    private String rName;
    private Long rRid;
    private String rPermisssion;
    //所属的部门
    private String uDepartment;
    //管理员是否停用，1：停用，0：正常
    private Integer state;

    public String getrPermisssion() {
        return rPermisssion;
    }

    public void setrPermisssion(String rPermisssion) {
        this.rPermisssion = rPermisssion;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Long getrRid() {
        return rRid;
    }

    public void setrRid(Long rRid) {
        this.rRid = rRid;
    }

    public String getuJobNumber() {
        return uJobNumber;
    }

    public void setuJobNumber(String uJobNumber) {
        this.uJobNumber = uJobNumber;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getuDepartment() {
        return uDepartment;
    }

    public void setuDepartment(String uDepartment) {
        this.uDepartment = uDepartment;
    }

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

    public Integer getuAuthentication() {
        return uAuthentication;
    }

    public void setuAuthentication(Integer uAuthentication) {
        this.uAuthentication = uAuthentication;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String getIdentifyPic1() {
        return identifyPic1;
    }

    public void setIdentifyPic1(String identifyPic1) {
        this.identifyPic1 = identifyPic1;
    }

    public String getIdentifyPic2() {
        return identifyPic2;
    }

    public void setIdentifyPic2(String identifyPic2) {
        this.identifyPic2 = identifyPic2;
    }

    public String getIdentifyPic3() {
        return identifyPic3;
    }

    public void setIdentifyPic3(String identifyPic3) {
        this.identifyPic3 = identifyPic3;
    }

    public String getIdentifyFullname() {
        return identifyFullname;
    }

    public void setIdentifyFullname(String identifyFullname) {
        this.identifyFullname = identifyFullname;
    }

    public String getIdentifyNo() {
        return identifyNo;
    }

    public void setIdentifyNo(String identifyNo) {
        this.identifyNo = identifyNo;
    }
}