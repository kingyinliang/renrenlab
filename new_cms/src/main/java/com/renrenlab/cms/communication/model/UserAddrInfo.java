package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserAddrInfo implements Serializable {

    private static final long serialVersionUID = -4729808173091770772L;

    private Long id;

    private Long uUid;

    private String uFullname;

    private String uConuntry;

    private String uCity;

    private String uProvince;

    private String uStreet;

    private String uZipcode;

    private String uPhone;

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

    public String getuFullname() {
        return uFullname;
    }

    public void setuFullname(String uFullname) {
        this.uFullname = uFullname == null ? null : uFullname.trim();
    }

    public String getuConuntry() {
        return uConuntry;
    }

    public void setuConuntry(String uConuntry) {
        this.uConuntry = uConuntry == null ? null : uConuntry.trim();
    }

    public String getuCity() {
        return uCity;
    }

    public void setuCity(String uCity) {
        this.uCity = uCity == null ? null : uCity.trim();
    }

    public String getuProvince() {
        return uProvince;
    }

    public void setuProvince(String uProvince) {
        this.uProvince = uProvince == null ? null : uProvince.trim();
    }

    public String getuStreet() {
        return uStreet;
    }

    public void setuStreet(String uStreet) {
        this.uStreet = uStreet == null ? null : uStreet.trim();
    }

    public String getuZipcode() {
        return uZipcode;
    }

    public void setuZipcode(String uZipcode) {
        this.uZipcode = uZipcode == null ? null : uZipcode.trim();
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone == null ? null : uPhone.trim();
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
}