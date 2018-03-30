package com.renrenlab.rlab.vo;

import com.renrenlab.rlab.model.OrgContactsMap;
import com.renrenlab.rlab.model.ServiceInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by renrenlab on 17/10/18.
 */
public class ServiceInfoCustom extends ServiceInfo{
    private List<OrgContacts> serviceContacts;
    private String orgName;

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public List<OrgContacts> getServiceContacts() {
        if (serviceContacts == null){
            serviceContacts = new ArrayList<OrgContacts>();
        }
        return serviceContacts;
    }

    public void setServiceContacts(List<OrgContacts> serviceContacts) {
        this.serviceContacts = serviceContacts;
    }
}
