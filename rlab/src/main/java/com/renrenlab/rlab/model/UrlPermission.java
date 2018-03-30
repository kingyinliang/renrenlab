package com.renrenlab.rlab.model;

import java.util.Date;

public class UrlPermission {

    private Long permissionId;
    //需要拦截的路径
    private String url;
    private Long parentId;
    private String permission;
    //资源描述
    private String urlDes;
    //请求方式
    private String requestType;

    private Date modifyTime;
    private Date createTime;

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getUrlDes() {
        return urlDes;
    }

    public void setUrlDes(String urlDes) {
        this.urlDes = urlDes;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission == null ? null : permission.trim();
    }
}