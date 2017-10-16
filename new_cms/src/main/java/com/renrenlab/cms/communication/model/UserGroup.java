package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserGroup implements Serializable {

    private static final long serialVersionUID = 1374315475216755712L;

    private Long id;

    private Long uGid;

    private String uGroupName;

    private String uGroupDescription;

    private Integer uGroupState;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getuGid() {
        return uGid;
    }

    public void setuGid(Long uGid) {
        this.uGid = uGid;
    }

    public String getuGroupName() {
        return uGroupName;
    }

    public void setuGroupName(String uGroupName) {
        this.uGroupName = uGroupName == null ? null : uGroupName.trim();
    }

    public String getuGroupDescription() {
        return uGroupDescription;
    }

    public void setuGroupDescription(String uGroupDescription) {
        this.uGroupDescription = uGroupDescription == null ? null : uGroupDescription.trim();
    }

    public Integer getuGroupState() {
        return uGroupState;
    }

    public void setuGroupState(Integer uGroupState) {
        this.uGroupState = uGroupState;
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