package com.renrenlab.rlab.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by wanshou on 2017/5/17.
 */
public class OrgCode implements Serializable {

    private static final long serialVersionUID = -3894781167698022570L;

    private Long id;

    private Long orgOid;

    private String orgCode;

    private String orgFullname;

    private String orgType;

    private String orgAddress;

    private String orgExpiration;

    private String orgIssuer;

    private String orgRegNo;

    private String orgCodePic;

    private Date createTime;

    private Date modifyTime;

    public OrgCode(Long orgOid, String orgCode) {
        this.orgOid = orgOid;
        this.orgCode = orgCode;
    }
    public OrgCode(Long orgOid, String orgCode,String orgCodePic) {
        this.orgOid = orgOid;
        this.orgCode = orgCode;
        this.orgCodePic = orgCodePic;
    }

    public OrgCode(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getOrgFullname() {
        return orgFullname;
    }

    public void setOrgFullname(String orgFullname) {
        this.orgFullname = orgFullname;
    }

    public String getOrgType() {
        return orgType;
    }

    public void setOrgType(String orgType) {
        this.orgType = orgType;
    }

    public String getOrgAddress() {
        return orgAddress;
    }

    public void setOrgAddress(String orgAddress) {
        this.orgAddress = orgAddress;
    }

    public String getOrgExpiration() {
        return orgExpiration;
    }

    public void setOrgExpiration(String orgExpiration) {
        this.orgExpiration = orgExpiration;
    }

    public String getOrgIssuer() {
        return orgIssuer;
    }

    public void setOrgIssuer(String orgIssuer) {
        this.orgIssuer = orgIssuer;
    }

    public String getOrgRegNo() {
        return orgRegNo;
    }

    public void setOrgRegNo(String orgRegNo) {
        this.orgRegNo = orgRegNo;
    }

    public String getOrgCodePic() {
        return orgCodePic;
    }

    public void setOrgCodePic(String orgCodePic) {
        this.orgCodePic = orgCodePic;
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
