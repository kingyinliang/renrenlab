package com.renrenlab.cms.communication.vo;

/**
 * 客服信息
 *
 * Created by lihongxun on 2017/5/16.
 */
public class CustomerServiceInfo {

    private Long csId;

    private String csName;

    private String csAvatar;

    private Long count;

    private String Mobile;

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

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

    public String getMobile() {
        return Mobile;
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
    }
}
