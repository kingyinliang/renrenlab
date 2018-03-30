package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.common.util.CommonUtil;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.ServiceAptitudeInfo;
import com.renrenlab.rlab.model.ServiceClassify;
import com.renrenlab.rlab.model.ServiceFeature;
import com.renrenlab.rlab.service.ServiceInfoService;
import com.renrenlab.rlab.vo.OrgContacts;
import com.renrenlab.rlab.vo.ServiceInfoCustom;
import com.renrenlab.rlab.vo.ServiceListModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by renrenlab on 17/10/17.
 */
@Service
@Transactional
public class ServiceInfoServiceImpl implements ServiceInfoService {

    @Autowired
    ServiceInfoDao serviceInfoDao;
    @Autowired
    OrgContactsDao orgContactsDao;
    @Autowired
    UserBaseInfoDao userBaseInfoDao;
    @Autowired
    ServiceFeatureDao serviceFeatureDao;
    @Autowired
    ServiceAptitudeInfoDao serviceAptitudeInfoDao;
    @Autowired
    ServiceIndexDao serviceIndexDao;

    //    添加服务
    @Override
    public int addService(ServiceInfoCustom serviceInfoCustom) {
        serviceInfoCustom.setServiceState(1);
        if (serviceInfoCustom.getServiceName() == null
                || serviceInfoCustom.getOrgOid() == null
                || serviceInfoCustom.getServicePrice() == null
                || serviceInfoCustom.getServiceContacts() == null
                || serviceInfoCustom.getServiceProvince() == null
                || serviceInfoCustom.getServiceCity() == null
                || serviceInfoCustom.getServiceDistrict() == null
                || serviceInfoCustom.getServiceAddress() == null
                || serviceInfoCustom.getServiceLon() == null
                || serviceInfoCustom.getServiceLat() == null) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }

        JSONArray features = JSONArray.parseArray(serviceInfoCustom.getServiceFeature() == null ? "" : serviceInfoCustom.getServiceFeature().toString());
        JSONArray credits = JSONArray.parseArray(serviceInfoCustom.getServiceCredit() == null ? "" : serviceInfoCustom.getServiceCredit().toString());

        if (serviceInfoCustom.getServiceIsManager() == 0) {
            if (features.size() > 3 || credits.size() > 5) {
                throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
            }
        } else {
            if (features.size() > 5 || credits.size() > 5) {
                throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
            }
        }


        serviceInfoCustom.setServiceState(1);

        ServiceInfoCustom dbData = serviceInfoDao.selectByOrgIdAndServiceName(serviceInfoCustom.getServiceName(), serviceInfoCustom.getOrgOid());

        if (dbData != null) {
            throw new BusinessException(ResponseEntity.SERVICE_EXIST);
        }

        List<Long> contacts = new ArrayList<Long>();
        for (OrgContacts orgContacts : serviceInfoCustom.getServiceContacts()) {
            orgContacts.setConState(3);
            if (orgContacts.getConId() != null) {
                int result = orgContactsDao.updateOrgContacts(orgContacts);
                if (result != 1) {
                    throw new BusinessException(ResponseEntity.DATABASE_UPDATA_ERROR);
                }
                contacts.add(orgContacts.getConId());
            } else {
                int result = orgContactsDao.insertOrgContacts(orgContacts);
                contacts.add(orgContacts.getConId());
            }
        }

        serviceInfoCustom.setServiceContactId(contacts.toString());


        return serviceInfoDao.insertSelective(serviceInfoCustom);
    }

    //    查询服务详情
    @Override
    public ServiceInfoCustom selectDetail(Long serviceId) {
        ServiceInfoCustom serviceInfoCustom = serviceInfoDao.selectByServiceId(serviceId);
        if (serviceInfoCustom == null) {
            throw new BusinessException(ResponseEntity.SERVICE_NOT_EXIST);
        }
        JSONArray array = JSONObject.parseArray(serviceInfoCustom.getServiceContactId().toString());
        // 根据contactId查询服务联系人
        for (Object contactId : array) {
            OrgContacts contact = orgContactsDao.searchOrgContactsByConId(Long.valueOf(contactId.toString()), 3);
            serviceInfoCustom.getServiceContacts().add(contact);
        }
        serviceInfoCustom.setServicePics(SearchUtil.handlePic(serviceInfoCustom.getServicePics().toString()));
        serviceInfoCustom.setServiceFeature(JSONArray.parseArray(serviceInfoCustom.getServiceFeature() == null ? "" : serviceInfoCustom.getServiceFeature().toString()));
        serviceInfoCustom.setServiceCredit(JSONArray.parseArray(serviceInfoCustom.getServiceCredit() == null ? "" : serviceInfoCustom.getServiceCredit().toString()));
        serviceInfoCustom.setServiceScope(JSONArray.parseArray(serviceInfoCustom.getServiceScope() == null ? "" : serviceInfoCustom.getServiceScope().toString()));
        serviceInfoCustom.setServiceMachine(JSONArray.parseArray(serviceInfoCustom.getServiceMachine() == null ? "" : serviceInfoCustom.getServiceMachine().toString()));
        switch (serviceInfoCustom.getServiceState()) {
            case 0:
                serviceInfoCustom.setStateStr("审核通过");
                break;
            case 1:
                serviceInfoCustom.setStateStr("待审核");
                break;
            case 2:
                serviceInfoCustom.setStateStr("已下架");
                break;
            case 3:
                serviceInfoCustom.setStateStr("已拒绝");
                break;
            case 4:
                serviceInfoCustom.setStateStr("已上架");
                break;
            default:
                break;
        }
        return serviceInfoCustom;
    }

    /**
     * 查询服务列表
     */
    @Override
    public PageInfo<ServiceListModel> serviceList(Long managerId, Integer permission, String keyword, Integer state, String beginTime, String endTime, Integer pageNo, Integer pageSize, String order, Long uUid) {
        Long serviceId = null;
        if (CommonUtil.isNum(keyword)) {
            serviceId = Long.parseLong(keyword);
        }
        if (state == null || state.equals("99")) {
            state = null;
        }
        if (beginTime != null && beginTime.equals("")) {
            beginTime = null;
        }
        if (endTime != null && endTime.equals("")) {
            endTime = null;
        }
        PageHelper.startPage(pageNo, pageSize);
        List<ServiceListModel> serviceInfos = serviceInfoDao.selectServiceList(managerId, permission, keyword, serviceId, state, beginTime, endTime, order, uUid);

        for (ServiceListModel model : serviceInfos) {
            model.getServiceInfo().setServicePrice(SearchUtil.handlePrice(model.getServiceInfo().getServicePrice().toString()));
            model.getServiceInfo().setModifyTimeStr(CommonUtil.formatTime(model.getServiceInfo().getModifyTime()));
            model.getServiceInfo().setServiceScope(JSONArray.parseArray(model.getServiceInfo().getServiceScope() == null ? "" : model.getServiceInfo().getServiceScope().toString()));
            switch (model.getServiceInfo().getServiceState()) {
                case 0:
                    model.getServiceInfo().setStateStr("审核通过");
                    break;
                case 1:
                    model.getServiceInfo().setStateStr("待审核");
                    break;
                case 2:
                    model.getServiceInfo().setStateStr("已下架");
                    break;
                case 3:
                    model.getServiceInfo().setStateStr("已拒绝");
                    break;
                case 4:
                    model.getServiceInfo().setStateStr("已上架");
                    break;
                default:
                    break;
            }
        }
        return new PageInfo<>(serviceInfos);
    }

    /**
     * 用户端服务列表
     */
    @Override
    public PageInfo<ServiceInfoCustom> serviceFrontList(String keyword, Integer state, String beginTime, String endTime, Integer pageNo, Integer pageSize, String order, Long uUid) {
        Long serviceId = null;
        if (CommonUtil.isNum(keyword)) {
            serviceId = Long.parseLong(keyword);
        }
        if (state == null || state.equals("99")) {
            state = null;
        }
        if (beginTime != null && beginTime.equals("")) {
            beginTime = null;
        }
        if (endTime != null && endTime.equals("")) {
            endTime = null;
        }
        PageHelper.startPage(pageNo, pageSize);

        List<ServiceInfoCustom> serviceInfos = serviceInfoDao.selectFrontList(keyword, serviceId, state, beginTime, endTime, order, uUid);

        for (ServiceInfoCustom model : serviceInfos) {
            model.setServicePrice(JSONObject.parseObject(model.getServicePrice().toString()));
            model.setServicePrice(SearchUtil.handlePrice(model.getServicePrice().toString()));
            model.setModifyTimeStr(CommonUtil.formatTime(model.getModifyTime()));
            model.setServiceScope(JSONArray.parseArray(model.getServiceScope() == null ? "" : model.getServiceScope().toString()));
            switch (model.getServiceState()) {
                case 0:
                    model.setStateStr("审核通过");
                    break;
                case 1:
                    model.setStateStr("待审核");
                    break;
                case 2:
                    model.setStateStr("已下架");
                    break;
                case 3:
                    model.setStateStr("已拒绝");
                    break;
                case 4:
                    model.setStateStr("已上架");
                    break;
                default:
                    break;
            }
        }
        return new PageInfo<>(serviceInfos);
    }

    //    修改服务
    @Override
    public int updateService(ServiceInfoCustom serviceInfoCustom) {
        serviceInfoCustom.setServiceState(1);
        List<Long> contacts = new ArrayList<Long>();
        for (OrgContacts orgContacts : serviceInfoCustom.getServiceContacts()) {
            orgContacts.setConState(3);
            if (orgContacts.getConId() != null) {
                int result = orgContactsDao.updateOrgContacts(orgContacts);
                if (result != 1) {
                    throw new BusinessException(ResponseEntity.DATABASE_UPDATA_ERROR);
                }
                contacts.add(orgContacts.getConId());
            } else {
                int result = orgContactsDao.insertOrgContacts(orgContacts);
                contacts.add(orgContacts.getConId());
            }
        }
        serviceInfoCustom.setServiceContactId(contacts.toString());

        if (serviceInfoCustom.getServiceName() == null
                || serviceInfoCustom.getOrgOid() == null
                || serviceInfoCustom.getServicePrice() == null
                || serviceInfoCustom.getServiceContactId() == null
                || serviceInfoCustom.getServiceProvince() == null
                || serviceInfoCustom.getServiceCity() == null
                || serviceInfoCustom.getServiceDistrict() == null
                || serviceInfoCustom.getServiceAddress() == null
                || serviceInfoCustom.getServiceLon() == null
                || serviceInfoCustom.getServiceLat() == null) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //服务修改后，状态默认为待审核，删除索引表记录
        serviceIndexDao.deleteIndexByServiceId(serviceInfoCustom.getServiceId());
        return serviceInfoDao.updateByPrimaryKeySelective(serviceInfoCustom);
    }

    @Override
    public int auditService(List<Integer> serviceIds, Integer state) {
        if (state == 4) {
            serviceIndexDao.deleteIndexByServiceId(Long.valueOf(serviceIds.get(0)));
            serviceIndexDao.insertIndexByServiceId(Long.valueOf(serviceIds.get(0)));
        }
        if (state == 2) {
            serviceIndexDao.deleteIndexByServiceId(Long.valueOf(serviceIds.get(0)));
        }
        return serviceInfoDao.auditService(serviceIds, state);
    }

    @Override
    public List<ServiceFeature> featureList(Long uid) {
        List<ServiceFeature> serviceFeatures = serviceFeatureDao.selectList(uid);
        return serviceFeatures;
    }

    /**
     * 添加特点
     */
    @Override
    public int addFeature(ServiceFeature serviceFeature) {
        ServiceFeature serviceFeature1 = serviceFeatureDao.selectByName(serviceFeature.getFeatureName());
        if (serviceFeature1 != null) {
            throw new BusinessException(ResponseEntity.FEATURE_EXIST);
        }
        int result = serviceFeatureDao.insertSelective(serviceFeature);
        return result;
    }


    @Override
    public List<ServiceAptitudeInfo> aptitudeList(Long uid, Integer isManager) {
        List<ServiceAptitudeInfo> serviceAptitudeInfos = serviceAptitudeInfoDao.selectList(uid, isManager);
        return serviceAptitudeInfos;
    }

    /**
     * 添加资质
     */
    @Override
    public int addAptitude(ServiceAptitudeInfo serviceAptitudeInfo) {
        ServiceAptitudeInfo serviceAptitudeInfo1 = serviceAptitudeInfoDao.selectByName(serviceAptitudeInfo.getAptitudeName());
        if (serviceAptitudeInfo1 != null) {
            throw new BusinessException(ResponseEntity.APTITUDE_EXIST);
        }
        serviceAptitudeInfo.setIsManager((short) 1);
        int result = serviceAptitudeInfoDao.insertSelective(serviceAptitudeInfo);
        return result;
    }

    /**
     * 第三方检测和科研众包里面的分类
     */
    @Override
    public List<ServiceClassify> serviceClassifyList(Long id) {
        if (id == null) {
            id = 0L;
        }
        List<ServiceClassify> list = serviceInfoDao.selectProductClassify(id);
        return list;
    }

    /**
     * 获取服务产品分类
     */
    @Override
    public List<HashMap> serviceProductClassifyList(Long id, Boolean isMobile) {
        if (id == null) {
            id = 0L;
        }
        List<Long> ids = new ArrayList<>();
        List<ServiceClassify> list = serviceInfoDao.selectProductClassify(id);
        for (ServiceClassify classify : list) {
            ids.add(classify.getClassifyMap());
        }
        List<ServiceClassify> sonList = serviceInfoDao.selectFrontProductClassify(ids);
        List<HashMap> result = new ArrayList<HashMap>();

        for (ServiceClassify classify : list) {
            HashMap temp = new HashMap();
            List<ServiceClassify> sons = new ArrayList<>();
            for (int i = 0; i < sonList.size(); i++) {
                ServiceClassify son = sonList.get(i);
                if (classify.getClassifyMap().equals(son.getParentId())) {
                    sons.add(son);
                }
            }
            temp.put(classify.getClassifyName(), sons);
            result.add(temp);
        }

        if (id == 26 && isMobile){
            HashMap map = result.get(0);
            ArrayList l = (ArrayList) map.get("生物药");
            map.remove("生物药");
            map.put("生物药/化学药/中药", l);
            ArrayList<HashMap> res = new ArrayList<>();
            res.add(map);
            return res;
        }
        if (id == 61 && isMobile){
            HashMap map = result.get(1);
            ArrayList l = (ArrayList) map.get("二类医疗器械");
            map.remove("二类医疗器械");
            map.put("一/二/三类医疗器械", l);
            ArrayList<HashMap> res = new ArrayList<>();
            res.add(map);
            return res;
        }
        return result;
    }
}
