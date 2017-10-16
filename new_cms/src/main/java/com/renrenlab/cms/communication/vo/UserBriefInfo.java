package com.renrenlab.cms.communication.vo;

/**
 * 用户简介信息
 *
 * Created by lihongxun on 2017/4/8.
 */
public class UserBriefInfo {

    private Long uId;

    /**
     * 用户名
     */
    private String uName;

    /**
     * 用户昵称
     */
    private String uNickName;

    /**
     * 用户昵称
     */
    private String uAvatar;

    /**
     * 用户手机
     */
    private String uPhone;

    /**
     * 用户详细地址
     */
    private String uDetailAddress;

    /**
     * 用户所在机构
     */
    private String uOrgName;

    /**
     * 用户所在机构Id
     */
    private Long uOrgId;

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
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

    public String getuDetailAddress() {
        return uDetailAddress;
    }

    public void setuDetailAddress(String uDetailAddress) {
        this.uDetailAddress = uDetailAddress;
    }

    public String getuOrgName() {
        return uOrgName;
    }

    public void setuOrgName(String uOrgName) {
        this.uOrgName = uOrgName;
    }

    public String getuNickName() {
        return uNickName;
    }

    public void setuNickName(String uNickName) {
        this.uNickName = uNickName;
    }

    public String getuAvatar() {
        return uAvatar;
    }

    public void setuAvatar(String uAvatar) {
        this.uAvatar = uAvatar;
    }

    public Long getuOrgId() {
        return uOrgId;
    }

    public void setuOrgId(Long uOrgId) {
        this.uOrgId = uOrgId;
    }
}
