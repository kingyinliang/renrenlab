package com.renrenlab.rlab.vo;

import com.renrenlab.rlab.model.OrgCode;
import com.renrenlab.rlab.model.OrgLicense;

import java.util.Date;
import java.util.List;

/**
 * Created by wanshou on 2017/5/16.
 */
public class OrgInfo {

    private Long id;

    private Long orgOid;

    private String orgName;

    private Integer orgCategoryId;

    private String orgCategory;

    private long orgParentId;

    private String parentOrgName;

    private Integer orgIdentification;

    private String orgIdentificationStr;//审核状态

    private String orgLogo;

    private String orgDescription;

    private String orgWeb;

    private Integer orgState;

    private String orgCode;

    private OrgCode orgCodeObject;

    private Integer insCount;

    private String orgLicensePic;

    private OrgLicense orgLicense;

    private OrgAddress orgAddress;

    private OrgContacts orgContacts;

    private List<OrgManager> orgManagerList;

    private List<OrgCertificate> orgCertificateList;

    private String orgPosition; 

    private List<String> orgPositionList;

    private Integer orgInsCount;

    private Float orgShareIndex;

    private String orgShareIndexStr;

    private List<Character> orgShareIndexList;

    private Integer orgRank;

    private List<Character> orgRankList;

    private Long uUid;

    private Long orgMid;

    private String uMobile;

    private Date createTime;

    private String createTimeStr;

    private Date modifyTime;

    /**人人实验2.2新增字段**/
    private Integer orgType;

    private Integer orgSource;

    private String orgSourceStr;

    private Long orgBizUid;

    private String orgBizName;//机构对接业务人员

    private Date auditTime;

    private String auditPerson;

    private Date applicationTime;

    private String rejectReason;

    //拥有者类型1 拥有者 0创建者
    private Integer managerType;

    public Integer getManagerType() {
        return managerType;
    }

    public void setManagerType(Integer managerType) {
        this.managerType = managerType;
    }

    //机构联系人列表
    private List<OrgContacts> orgContactsList;

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

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public Integer getOrgCategoryId() {
        return orgCategoryId;
    }

    public void setOrgCategoryId(Integer orgCategoryId) {
        this.orgCategoryId = orgCategoryId;
    }

    public long getOrgParentId() {
        return orgParentId;
    }

    public void setOrgParentId(long orgParentId) {
        this.orgParentId = orgParentId;
    }

    public Integer getOrgIdentification() {
        return orgIdentification;
    }

    public void setOrgIdentification(Integer orgIdentification) {
        this.orgIdentification = orgIdentification;
    }

    public String getOrgLogo() {
        return orgLogo;
    }

    public void setOrgLogo(String orgLogo) {
        this.orgLogo = orgLogo;
    }

    public String getOrgDescription() {
        return orgDescription;
    }

    public void setOrgDescription(String orgDescription) {
        this.orgDescription = orgDescription;
    }

    public Integer getOrgState() {
        return orgState;
    }

    public void setOrgState(Integer orgState) {
        this.orgState = orgState;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public Integer getInsCount() {
        return insCount;
    }

    public void setInsCount(Integer insCount) {
        this.insCount = insCount;
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

    public String getParentOrgName() {
        return parentOrgName;
    }

    public void setParentOrgName(String parentOrgName) {
        this.parentOrgName = parentOrgName;
    }

    public OrgAddress getOrgAddress() {
        return orgAddress;
    }

    public void setOrgAddress(OrgAddress orgAddress) {
        this.orgAddress = orgAddress;
    }

    public String getOrgWeb() {
        return orgWeb;
    }

    public void setOrgWeb(String orgWeb) {
        this.orgWeb = orgWeb;
    }

    public OrgContacts getOrgContacts() {
        return orgContacts;
    }

    public void setOrgContacts(OrgContacts orgContacts) {
        this.orgContacts = orgContacts;
    }

    public List<OrgManager> getOrgManagerList() {
        return orgManagerList;
    }

    public void setOrgManagerList(List<OrgManager> orgManagerList) {
        this.orgManagerList = orgManagerList;
    }

    public String getOrgLicensePic() {
        return orgLicensePic;
    }

    public void setOrgLicensePic(String orgLicensePic) {
        this.orgLicensePic = orgLicensePic;
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public List<OrgCertificate> getOrgCertificateList() {
        return orgCertificateList;
    }

    public void setOrgCertificateList(List<OrgCertificate> orgCertificateList) {
        this.orgCertificateList = orgCertificateList;
    }

    public Long getOrgMid() {
        return orgMid;
    }

    public void setOrgMid(Long orgMid) {
        this.orgMid = orgMid;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String getOrgPosition() {
        return orgPosition;
    }

    public void setOrgPosition(String orgPosition) {
        this.orgPosition = orgPosition;
    }

    public String getOrgCategory() {
        return orgCategory;
    }

    public void setOrgCategory(String orgCategory) {
        this.orgCategory = orgCategory;
    }

    public String getuMobile() {
        return uMobile;
    }

    public void setuMobile(String uMobile) {
        this.uMobile = uMobile;
    }

    public List<String> getOrgPositionList() {
        return orgPositionList;
    }

    public void setOrgPositionList(List<String> orgPositionList) {
        this.orgPositionList = orgPositionList;
    }

    public Integer getOrgInsCount() {
        return orgInsCount;
    }

    public void setOrgInsCount(Integer orgInsCount) {
        this.orgInsCount = orgInsCount;
    }

    public Float getOrgShareIndex() {
        return orgShareIndex;
    }

    public void setOrgShareIndex(Float orgShareIndex) {
        this.orgShareIndex = orgShareIndex;
    }

    public Integer getOrgRank() {
        return orgRank;
    }

    public void setOrgRank(Integer orgRank) {
        this.orgRank = orgRank;
    }

    public List<Character> getOrgShareIndexList() {
        return orgShareIndexList;
    }

    public void setOrgShareIndexList(List<Character> orgShareIndexList) {
        this.orgShareIndexList = orgShareIndexList;
    }

    public List<Character> getOrgRankList() {
        return orgRankList;
    }

    public void setOrgRankList(List<Character> orgRankList) {
        this.orgRankList = orgRankList;
    }

    public String getOrgShareIndexStr() {
        return orgShareIndexStr;
    }

    public void setOrgShareIndexStr(String orgShareIndexStr) {
        this.orgShareIndexStr = orgShareIndexStr;
    }

    public OrgLicense getOrgLicense() {
        return orgLicense;
    }

    public void setOrgLicense(OrgLicense orgLicense) {
        this.orgLicense = orgLicense;
    }

    public Integer getOrgType() {
        return orgType;
    }

    public void setOrgType(Integer orgType) {
        this.orgType = orgType;
    }

    public Integer getOrgSource() {
        return orgSource;
    }

    public void setOrgSource(Integer orgSource) {
        this.orgSource = orgSource;
    }

    public Long getOrgBizUid() {
        return orgBizUid;
    }

    public void setOrgBizUid(Long orgBizUid) {
        this.orgBizUid = orgBizUid;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public String getAuditPerson() {
        return auditPerson;
    }

    public void setAuditPerson(String auditPerson) {
        this.auditPerson = auditPerson;
    }

    public Date getApplicationTime() {
        return applicationTime;
    }

    public void setApplicationTime(Date applicationTime) {
        this.applicationTime = applicationTime;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public String getOrgBizName() {
        return orgBizName;
    }

    public void setOrgBizName(String orgBizName) {
        this.orgBizName = orgBizName;
    }

    public OrgCode getOrgCodeObject() {
        return orgCodeObject;
    }

    public void setOrgCodeObject(OrgCode orgCodeObject) {
        this.orgCodeObject = orgCodeObject;
    }

    public String getOrgSourceStr() {
        return orgSourceStr;
    }

    public void setOrgSourceStr(String orgSourceStr) {
        this.orgSourceStr = orgSourceStr;
    }

    public List<OrgContacts> getOrgContactsList() {
        return orgContactsList;
    }

    public void setOrgContactsList(List<OrgContacts> orgContactsList) {
        this.orgContactsList = orgContactsList;
    }

    public String getOrgIdentificationStr() {
        return orgIdentificationStr;
    }

    public void setOrgIdentificationStr(String orgIdentificationStr) {
        this.orgIdentificationStr = orgIdentificationStr;
    }
}
