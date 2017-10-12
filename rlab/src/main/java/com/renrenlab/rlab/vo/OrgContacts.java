package com.renrenlab.rlab.vo;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/19.
 */
public class OrgContacts {

    private Long id;

    private Long conId;

    private Long uUid;

    private String conName;

    private String conPhone;

    private List<String> conPhoneList;

    private String conEmail;

    private String conCountry;

    private String conProvince;

    private String conCity;

    private String conStreet;

    private String conZipcode;

    private String conFax;

    private Integer conState;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getConId() {
        return conId;
    }

    public void setConId(Long conId) {
        this.conId = conId;
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public String getConName() {
        return conName;
    }

    public void setConName(String conName) {
        this.conName = conName;
    }

    public String getConPhone() {
        return conPhone;
    }

    public void setConPhone(String conPhone) {
        this.conPhone = conPhone;
    }

    public String getConEmail() {
        return conEmail;
    }

    public void setConEmail(String conEmail) {
        this.conEmail = conEmail;
    }

    public String getConCountry() {
        return conCountry;
    }

    public void setConCountry(String conCountry) {
        this.conCountry = conCountry;
    }

    public String getConProvince() {
        return conProvince;
    }

    public void setConProvince(String conProvince) {
        this.conProvince = conProvince;
    }

    public String getConCity() {
        return conCity;
    }

    public void setConCity(String conCity) {
        this.conCity = conCity;
    }

    public String getConStreet() {
        return conStreet;
    }

    public void setConStreet(String conStreet) {
        this.conStreet = conStreet;
    }

    public String getConZipcode() {
        return conZipcode;
    }

    public void setConZipcode(String conZipcode) {
        this.conZipcode = conZipcode;
    }

    public String getConFax() {
        return conFax;
    }

    public void setConFax(String conFax) {
        this.conFax = conFax;
    }

    public Integer getConState() {
        return conState;
    }

    public void setConState(Integer conState) {
        this.conState = conState;
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

    public List<String> getConPhoneList() {
        return conPhoneList;
    }

    public void setConPhoneList(List<String> conPhoneList) {
        this.conPhoneList = conPhoneList;
    }
}
