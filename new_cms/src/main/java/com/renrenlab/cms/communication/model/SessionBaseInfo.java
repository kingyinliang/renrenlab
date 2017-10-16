package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class SessionBaseInfo implements Serializable {

    private static final long serialVersionUID = -3574428954420569948L;

    private Long id;

    private Long sSid;

    private Long uUid;

    private Long csId;

    private Integer sState;

    private Integer sSource;

    private Date sTime;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getsSid() {
        return sSid;
    }

    public void setsSid(Long sSid) {
        this.sSid = sSid;
    }

    public Long getuUid() {
        return uUid;
    }

    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public Long getCsId() {
        return csId;
    }

    public void setCsId(Long csId) {
        this.csId = csId;
    }

    public Integer getsState() {
        return sState;
    }

    public void setsState(Integer sState) {
        this.sState = sState;
    }

    public Integer getsSource() {
        return sSource;
    }

    public void setsSource(Integer sSource) {
        this.sSource = sSource;
    }

    public Date getsTime() {
        return sTime;
    }

    public void setsTime(Date sTime) {
        this.sTime = sTime;
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