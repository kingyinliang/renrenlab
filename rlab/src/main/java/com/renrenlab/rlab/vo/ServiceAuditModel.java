package com.renrenlab.rlab.vo;

import java.util.List;

/**
 * Created by renrenlab on 17/10/25.
 */
public class ServiceAuditModel {
    List<Integer> serviceIds;
    Integer state;

    public List<Integer> getServiceIds() {
        return serviceIds;
    }

    public void setServiceIds(List<Integer> serviceIds) {
        this.serviceIds = serviceIds;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
