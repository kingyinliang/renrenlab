package com.renrenlab.rlab.model;

import java.util.Date;

/**
 * Created by Administrator on 2017/9/13.
 */
public class UserRole {

    private Long id;

    private Long rRid;

    private String rName;

    private String rPermisssion;

    private String rDescription;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getrRid() {
        return rRid;
    }

    public void setrRid(Long rRid) {
        this.rRid = rRid;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getrPermisssion() {
        return rPermisssion;
    }

    public void setrPermisssion(String rPermisssion) {
        this.rPermisssion = rPermisssion;
    }

    public String getrDescription() {
        return rDescription;
    }

    public void setrDescription(String rDescription) {
        this.rDescription = rDescription;
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
