package com.renrenlab.rlab.vo;

import com.renrenlab.rlab.model.ServiceInfo;
import com.renrenlab.rlab.model.UserBaseInfo;

import java.util.List;

/**
 * Created by renrenlab on 17/10/19.
 */
public class ServiceListModel {
    private Integer id;
    private String orgName;
    private ServiceInfo serviceInfo;
    private UserBaseInfo userBaseInfo;
    private List<OrgContacts> serviceContacts;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
//    public ServiceListModel(){
//
//    }

//    public ServiceListModel(ServiceInfo s, UserBaseInfo u){
//        serviceInfo = s;
//        userBaseInfo = u;
//    }

    public ServiceInfo getServiceInfo() {
        return serviceInfo;
    }

    public void setServiceInfo(ServiceInfo serviceInfo) {
        this.serviceInfo = serviceInfo;
    }

    public com.renrenlab.rlab.model.UserBaseInfo getUserBaseInfo() {
        return userBaseInfo;
    }

    public void setUserBaseInfo(com.renrenlab.rlab.model.UserBaseInfo userBaseInfo) {
        this.userBaseInfo = userBaseInfo;
    }
}
