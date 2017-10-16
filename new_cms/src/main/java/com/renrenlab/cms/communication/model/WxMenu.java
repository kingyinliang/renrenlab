package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class WxMenu implements Serializable {

    private static final long serialVersionUID = -3856169398369422135L;

    private Long id;

    private Integer wmSeq;

    private String wmContent;

    private String wmMenuKey;

    private String wmName;

    private Long wmPid;

    private Integer wmRespType;

    private String wmType;

    private String wmUrl;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getWmSeq() {
        return wmSeq;
    }

    public void setWmSeq(Integer wmSeq) {
        this.wmSeq = wmSeq;
    }

    public String getWmContent() {
        return wmContent;
    }

    public void setWmContent(String wmContent) {
        this.wmContent = wmContent == null ? null : wmContent.trim();
    }

    public String getWmMenuKey() {
        return wmMenuKey;
    }

    public void setWmMenuKey(String wmMenuKey) {
        this.wmMenuKey = wmMenuKey == null ? null : wmMenuKey.trim();
    }

    public String getWmName() {
        return wmName;
    }

    public void setWmName(String wmName) {
        this.wmName = wmName == null ? null : wmName.trim();
    }

    public Long getWmPid() {
        return wmPid;
    }

    public void setWmPid(Long wmPid) {
        this.wmPid = wmPid;
    }

    public Integer getWmRespType() {
        return wmRespType;
    }

    public void setWmRespType(Integer wmRespType) {
        this.wmRespType = wmRespType;
    }

    public String getWmType() {
        return wmType;
    }

    public void setWmType(String wmType) {
        this.wmType = wmType == null ? null : wmType.trim();
    }

    public String getWmUrl() {
        return wmUrl;
    }

    public void setWmUrl(String wmUrl) {
        this.wmUrl = wmUrl == null ? null : wmUrl.trim();
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