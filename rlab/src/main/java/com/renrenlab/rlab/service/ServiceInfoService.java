package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.ServiceAptitudeInfo;
import com.renrenlab.rlab.model.ServiceClassify;
import com.renrenlab.rlab.model.ServiceFeature;
import com.renrenlab.rlab.vo.ServiceInfoCustom;
import com.renrenlab.rlab.vo.ServiceListModel;

import java.util.HashMap;
import java.util.List;

/**
 * Created by renrenlab on 17/10/17.
 */
public interface ServiceInfoService {
    public int addService(ServiceInfoCustom serviceInfoCustom);

    public ServiceInfoCustom selectDetail(Long serviceId);

    public PageInfo<ServiceListModel> serviceList(Long managerId, Integer permission, String keyword, Integer state, String beginTime, String endTime, Integer pageNo, Integer pageSize, String order, Long uUid);

    public PageInfo<ServiceInfoCustom> serviceFrontList(String keyword, Integer state, String beginTime, String endTime, Integer pageNo, Integer pageSize, String order, Long uUid);

    public int updateService(ServiceInfoCustom serviceInfoCustom);

    //    审核服务
    public int auditService(List<Integer> serviceIds, Integer state);

    public List<ServiceFeature> featureList(Long uid);

    public int addFeature(ServiceFeature serviceFeature);

    public List<ServiceAptitudeInfo> aptitudeList(Long uid, Integer isManager);

    public int addAptitude(ServiceAptitudeInfo serviceAptitudeInfo);

    public List<ServiceClassify> serviceClassifyList(Long id);

    public List<HashMap> serviceProductClassifyList(Long id, Boolean isMobile);
}
