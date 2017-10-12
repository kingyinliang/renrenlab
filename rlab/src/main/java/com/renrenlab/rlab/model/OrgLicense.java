package com.renrenlab.rlab.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/20.
 */
public class OrgLicense implements Serializable {

    private Long id;

    private Long orgOid;

    private String orgRegCode;

    private String orgFullname;

    private String orgType;

    private String orgPerson;

    private String orgAddress;

    private String orgCapital;

    private Date orgFoundDate;

    private String orgExpiration;

    private String orgScope;

    private Date orgIssuanceDate;

    private String orgIssuer;

    private String orgLicensePic;

    private Date createTime;

    private Date modifyTime;

    private String legalPersonPic1;

    private String legalPersonPic2;

    private String identificationNumber;

    private String taxEnrolCertificatePic;

    private String orgAddrProvince;

    private String orgAddrCity;

    private String orgAddrDistrict;

    public OrgLicense(){}

    public OrgLicense(Long orgOid, String orgLicensePic) {
        this.orgOid = orgOid;
        this.orgLicensePic = orgLicensePic;
    }

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

    public String getOrgRegCode() {
        return orgRegCode;
    }

    public void setOrgRegCode(String orgRegCode) {
        this.orgRegCode = orgRegCode == null ? null : orgRegCode.trim();
    }

    public String getOrgFullname() {
        return orgFullname;
    }

    public void setOrgFullname(String orgFullname) {
        this.orgFullname = orgFullname == null ? null : orgFullname.trim();
    }

    public String getOrgType() {
        return orgType;
    }

    public void setOrgType(String orgType) {
        this.orgType = orgType == null ? null : orgType.trim();
    }

    public String getOrgPerson() {
        return orgPerson;
    }

    public void setOrgPerson(String orgPerson) {
        this.orgPerson = orgPerson == null ? null : orgPerson.trim();
    }

    public String getOrgAddress() {
        return orgAddress;
    }

    public void setOrgAddress(String orgAddress) {
        this.orgAddress = orgAddress == null ? null : orgAddress.trim();
    }

    public String getOrgCapital() {
        return orgCapital;
    }

    public void setOrgCapital(String orgCapital) {
        this.orgCapital = orgCapital == null ? null : orgCapital.trim();
    }

    public Date getOrgFoundDate() {
        return orgFoundDate;
    }

    public void setOrgFoundDate(Date orgFoundDate) {
        this.orgFoundDate = orgFoundDate;
    }

    public String getOrgExpiration() {
        return orgExpiration;
    }

    public void setOrgExpiration(String orgExpiration) {
        this.orgExpiration = orgExpiration == null ? null : orgExpiration.trim();
    }

    public String getOrgScope() {
        return orgScope;
    }

    public void setOrgScope(String orgScope) {
        this.orgScope = orgScope == null ? null : orgScope.trim();
    }

    public Date getOrgIssuanceDate() {
        return orgIssuanceDate;
    }

    public void setOrgIssuanceDate(Date orgIssuanceDate) {
        this.orgIssuanceDate = orgIssuanceDate;
    }

    public String getOrgIssuer() {
        return orgIssuer;
    }

    public void setOrgIssuer(String orgIssuer) {
        this.orgIssuer = orgIssuer == null ? null : orgIssuer.trim();
    }

    public String getOrgLicensePic() {
        return orgLicensePic;
    }

    public void setOrgLicensePic(String orgLicensePic) {
        this.orgLicensePic = orgLicensePic == null ? null : orgLicensePic.trim();
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

    public String getLegalPersonPic1() {
        return legalPersonPic1;
    }

    public void setLegalPersonPic1(String legalPersonPic1) {
        this.legalPersonPic1 = legalPersonPic1;
    }

    public String getLegalPersonPic2() {
        return legalPersonPic2;
    }

    public void setLegalPersonPic2(String legalPersonPic2) {
        this.legalPersonPic2 = legalPersonPic2;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    public String getTaxEnrolCertificatePic() {
        return taxEnrolCertificatePic;
    }

    public void setTaxEnrolCertificatePic(String taxEnrolCertificatePic) {
        this.taxEnrolCertificatePic = taxEnrolCertificatePic;
    }

    public String getOrgAddrProvince() {
        return orgAddrProvince;
    }

    public void setOrgAddrProvince(String orgAddrProvince) {
        this.orgAddrProvince = orgAddrProvince;
    }

    public String getOrgAddrCity() {
        return orgAddrCity;
    }

    public void setOrgAddrCity(String orgAddrCity) {
        this.orgAddrCity = orgAddrCity;
    }

    public String getOrgAddrDistrict() {
        return orgAddrDistrict;
    }

    public void setOrgAddrDistrict(String orgAddrDistrict) {
        this.orgAddrDistrict = orgAddrDistrict;
    }
}
