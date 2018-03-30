package com.renrenlab.rlab.model;

import java.util.Date;

/**
 * @author guan
 */
public class ManagerInfo extends UserBaseInfo {

    private Long uUid;

    private String roleIds;

    private String jobNum;

    private String department;

    private Date createTime;

    private Date modifyTime;

    @Override
    public Long getuUid() {
        return uUid;
    }

    @Override
    public void setuUid(Long uUid) {
        this.uUid = uUid;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public String getJobNum() {
        return jobNum;
    }

    public void setJobNum(String jobNum) {
        this.jobNum = jobNum;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public Date getModifyTime() {
        return modifyTime;
    }

    @Override
    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
}