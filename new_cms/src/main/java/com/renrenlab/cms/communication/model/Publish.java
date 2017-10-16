package com.renrenlab.cms.communication.model;

import java.util.Date;

public class Publish {
    private Long id;

    private Long pubId;

    //机构名称
    private String pubOrgName;
    //联系人姓名
    private String pubContactName;
    //联系人电话
    private String pubContactPhone;

    private String pubWxOpenid;
//0:北京市昌平区内,1:北京市昌平区内外
    private Integer pubDistrict;
//0:1000万元及以下,1:1000~2000万元（包括2000万）,2:2000~3000万元（包括3000万）,3:3000万元以上
    private Integer pubRegisteredFund;
//0:20人以下,1:20~100人,2:101~500人,3:500人以上
    private Integer pubStaffNum;
//0:500万元以下,1:500~1000万元（不包括1000万）,2:1000~2000万元（不包括2000万）,3:2000万元及以上
    private Integer pubTaking;
//0:500万元以下,1:500~1000万元（不包括1000万）,2:1000~2000万元（不包括2000万）,3:2000万元及以上
    private Integer pubLastTaking;
//0:审核不通过,1:审核通过
    private Integer pubState;
    //优惠
    private String pubDiscount;

    private String pubLimit;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPubId() {
        return pubId;
    }

    public void setPubId(Long pubId) {
        this.pubId = pubId;
    }

    public String getPubOrgName() {
        return pubOrgName;
    }

    public void setPubOrgName(String pubOrgName) {
        this.pubOrgName = pubOrgName == null ? null : pubOrgName.trim();
    }

    public String getPubWxOpenid() {
        return pubWxOpenid;
    }

    public void setPubWxOpenid(String pubWxOpenid) {
        this.pubWxOpenid = pubWxOpenid == null ? null : pubWxOpenid.trim();
    }

    public Integer getPubDistrict() {
        return pubDistrict;
    }

    public void setPubDistrict(Integer pubDistrict) {
        this.pubDistrict = pubDistrict;
    }

    public Integer getPubRegisteredFund() {
        return pubRegisteredFund;
    }

    public void setPubRegisteredFund(Integer pubRegisteredFund) {
        this.pubRegisteredFund = pubRegisteredFund;
    }

    public Integer getPubStaffNum() {
        return pubStaffNum;
    }

    public void setPubStaffNum(Integer pubStaffNum) {
        this.pubStaffNum = pubStaffNum;
    }

    public Integer getPubTaking() {
        return pubTaking;
    }

    public void setPubTaking(Integer pubTaking) {
        this.pubTaking = pubTaking;
    }

    public Integer getPubLastTaking() {
        return pubLastTaking;
    }

    public void setPubLastTaking(Integer pubLastTaking) {
        this.pubLastTaking = pubLastTaking;
    }

    public Integer getPubState() {
        return pubState;
    }

    public void setPubState(Integer pubState) {
        this.pubState = pubState;
    }

    public String getPubDiscount() {
        return pubDiscount;
    }

    public void setPubDiscount(String pubDiscount) {
        this.pubDiscount = pubDiscount == null ? null : pubDiscount.trim();
    }

    public String getPubLimit() {
        return pubLimit;
    }

    public void setPubLimit(String pubLimit) {
        this.pubLimit = pubLimit == null ? null : pubLimit.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPubContactName() {
        return pubContactName;
    }

    public void setPubContactName(String pubContactName) {
        this.pubContactName = pubContactName;
    }

    public String getPubContactPhone() {
        return pubContactPhone;
    }

    public void setPubContactPhone(String pubContactPhone) {
        this.pubContactPhone = pubContactPhone;
    }
}