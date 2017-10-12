package com.renrenlab.rlab.vo;

import java.util.Date;

public class OrgCertificate {

    private Long id;

    private Long orgCertificateId;

    private Long orgOid;

    private String orgCertificateNo;

    private String orgCertificateExpr;

    private String orgCertificatePic;

    private String orgCertificateName;

    private Date createTime;

    private Date modifyTime;

    public OrgCertificate(){}

    public OrgCertificate( String orgCertificatePic, String orgCertificateName, Long orgCertificateId) {
        this.orgCertificateId= orgCertificateId;
        this.orgCertificatePic = orgCertificatePic;
        this.orgCertificateName = orgCertificateName;
    }

    public OrgCertificate(Long orgOid, String orgCertificatePic, String orgCertificateName) {
        this.orgOid = orgOid;
        this.orgCertificatePic = orgCertificatePic;
        this.orgCertificateName = orgCertificateName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgCertificateId() {
        return orgCertificateId;
    }

    public void setOrgCertificateId(Long orgCertificateId) {
        this.orgCertificateId = orgCertificateId;
    }

    public Long getOrgOid() {
        return orgOid;
    }

    public void setOrgOid(Long orgOid) {
        this.orgOid = orgOid;
    }

    public String getOrgCertificateNo() {
        return orgCertificateNo;
    }

    public void setOrgCertificateNo(String orgCertificateNo) {
        this.orgCertificateNo = orgCertificateNo == null ? null : orgCertificateNo.trim();
    }

    public String getOrgCertificateExpr() {
        return orgCertificateExpr;
    }

    public void setOrgCertificateExpr(String orgCertificateExpr) {
        this.orgCertificateExpr = orgCertificateExpr == null ? null : orgCertificateExpr.trim();
    }

    public String getOrgCertificatePic() {
        return orgCertificatePic;
    }

    public void setOrgCertificatePic(String orgCertificatePic) {
        this.orgCertificatePic = orgCertificatePic == null ? null : orgCertificatePic.trim();
    }

    public String getOrgCertificateName() {
        return orgCertificateName;
    }

    public void setOrgCertificateName(String orgCertificateName) {
        this.orgCertificateName = orgCertificateName == null ? null : orgCertificateName.trim();
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