package com.renrenlab.cms.communication.vo.params;

/**
 * 修改密码 接收参数
 *
 * Created by lihongxun on 2017/5/16.
 */
public class CSInInfo {

    private Long csId;

    private String oldpassword;

    private String password;

    public String getOldpassword() {
        return oldpassword;
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public Long getCsId() {
        return csId;
    }

    public void setCsId(Long csId) {
        this.csId = csId;
    }

}
