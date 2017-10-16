package com.renrenlab.cms.communication.vo;

/**
 * 登录成功后返回用户信息
 *
 * Created by lihongxun on 2017/5/16.
 */
public class CSOutInfo {

    private Long csId;

    private String csName;

    private String csAvatar;

    private Boolean csSex;

    private Integer csAge;

    private String csPhone;

    private String csAddress;

    private String csDescription;

    private Integer csMarried;

    private Integer gId;

    private Long rId;

    private String rPermisssion;

    public Long getCsId() {
        return csId;
    }

    public void setCsId(Long csId) {
        this.csId = csId;
    }

    public String getCsName() {
        return csName;
    }

    public void setCsName(String csName) {
        this.csName = csName;
    }

    public String getCsAvatar() {
        return csAvatar;
    }

    public void setCsAvatar(String csAvatar) {
        this.csAvatar = csAvatar;
    }

    public Boolean getCsSex() {
        return csSex;
    }

    public void setCsSex(Boolean csSex) {
        this.csSex = csSex;
    }

    public Integer getCsAge() {
        return csAge;
    }

    public void setCsAge(Integer csAge) {
        this.csAge = csAge;
    }

    public String getCsPhone() {
        return csPhone;
    }

    public void setCsPhone(String csPhone) {
        this.csPhone = csPhone;
    }

    public String getCsAddress() {
        return csAddress;
    }

    public void setCsAddress(String csAddress) {
        this.csAddress = csAddress;
    }

    public String getCsDescription() {
        return csDescription;
    }

    public void setCsDescription(String csDescription) {
        this.csDescription = csDescription;
    }

    public Integer getCsMarried() {
        return csMarried;
    }

    public void setCsMarried(Integer csMarried) {
        this.csMarried = csMarried;
    }

    public Integer getgId() {
        return gId;
    }

    public void setgId(Integer gId) {
        this.gId = gId;
    }

    public Long getrId() {
        return rId;
    }

    public void setrId(Long rId) {
        this.rId = rId;
    }

    public String getrPermisssion() {
        return rPermisssion;
    }

    public void setrPermisssion(String rPermisssion) {
        this.rPermisssion = rPermisssion;
    }

}
