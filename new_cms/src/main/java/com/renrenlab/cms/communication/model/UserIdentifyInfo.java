package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserIdentifyInfo implements Serializable {

    private static final long serialVersionUID = -8373373495766183169L;

    private Long id;

    private Long uUid;

    private String uIdentifyType;

    private String uIdentifyNo;

    private Date uIdentifyIssue;

    private Date uIdentifyExpiry;

    private String uIdentifyFullname;

    private String uIdentifyPic1;

    private String uIdentifyPic2;

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

    public String getuIdentifyType() {
        return uIdentifyType;
    }

    public void setuIdentifyType(String uIdentifyType) {
        this.uIdentifyType = uIdentifyType == null ? null : uIdentifyType.trim();
    }

    public String getuIdentifyNo() {
        return uIdentifyNo;
    }

    public void setuIdentifyNo(String uIdentifyNo) {
        this.uIdentifyNo = uIdentifyNo == null ? null : uIdentifyNo.trim();
    }

    public Date getuIdentifyIssue() {
        return uIdentifyIssue;
    }

    public void setuIdentifyIssue(Date uIdentifyIssue) {
        this.uIdentifyIssue = uIdentifyIssue;
    }

    public Date getuIdentifyExpiry() {
        return uIdentifyExpiry;
    }

    public void setuIdentifyExpiry(Date uIdentifyExpiry) {
        this.uIdentifyExpiry = uIdentifyExpiry;
    }

    public String getuIdentifyFullname() {
        return uIdentifyFullname;
    }

    public void setuIdentifyFullname(String uIdentifyFullname) {
        this.uIdentifyFullname = uIdentifyFullname == null ? null : uIdentifyFullname.trim();
    }

    public String getuIdentifyPic1() {
        return uIdentifyPic1;
    }

    public void setuIdentifyPic1(String uIdentifyPic1) {
        this.uIdentifyPic1 = uIdentifyPic1 == null ? null : uIdentifyPic1.trim();
    }

    public String getuIdentifyPic2() {
        return uIdentifyPic2;
    }

    public void setuIdentifyPic2(String uIdentifyPic2) {
        this.uIdentifyPic2 = uIdentifyPic2 == null ? null : uIdentifyPic2.trim();
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