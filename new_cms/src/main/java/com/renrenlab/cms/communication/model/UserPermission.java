package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class UserPermission implements Serializable {

    private static final long serialVersionUID = 6602995043153436531L;

    private Long id;

    private Integer uPmId;

    private String uPmName;

    private String uPmDescription;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getuPmId() {
        return uPmId;
    }

    public void setuPmId(Integer uPmId) {
        this.uPmId = uPmId;
    }

    public String getuPmName() {
        return uPmName;
    }

    public void setuPmName(String uPmName) {
        this.uPmName = uPmName == null ? null : uPmName.trim();
    }

    public String getuPmDescription() {
        return uPmDescription;
    }

    public void setuPmDescription(String uPmDescription) {
        this.uPmDescription = uPmDescription == null ? null : uPmDescription.trim();
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