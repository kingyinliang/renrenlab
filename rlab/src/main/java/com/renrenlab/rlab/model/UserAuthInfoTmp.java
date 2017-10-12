package com.renrenlab.rlab.model;

public class UserAuthInfoTmp {
    private Long id;

    private Long uAuthId;

    private String uAuthIdcardNum;

    private String uAuthIdcardHandheld;

    private String uAuthIdcardPositive;

    private String uAuthIdcardNegative;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getuAuthId() {
        return uAuthId;
    }

    public void setuAuthId(Long uAuthId) {
        this.uAuthId = uAuthId;
    }

    public String getuAuthIdcardNum() {
        return uAuthIdcardNum;
    }

    public void setuAuthIdcardNum(String uAuthIdcardNum) {
        this.uAuthIdcardNum = uAuthIdcardNum == null ? null : uAuthIdcardNum.trim();
    }

    public String getuAuthIdcardHandheld() {
        return uAuthIdcardHandheld;
    }

    public void setuAuthIdcardHandheld(String uAuthIdcardHandheld) {
        this.uAuthIdcardHandheld = uAuthIdcardHandheld == null ? null : uAuthIdcardHandheld.trim();
    }

    public String getuAuthIdcardPositive() {
        return uAuthIdcardPositive;
    }

    public void setuAuthIdcardPositive(String uAuthIdcardPositive) {
        this.uAuthIdcardPositive = uAuthIdcardPositive == null ? null : uAuthIdcardPositive.trim();
    }

    public String getuAuthIdcardNegative() {
        return uAuthIdcardNegative;
    }

    public void setuAuthIdcardNegative(String uAuthIdcardNegative) {
        this.uAuthIdcardNegative = uAuthIdcardNegative == null ? null : uAuthIdcardNegative.trim();
    }
}