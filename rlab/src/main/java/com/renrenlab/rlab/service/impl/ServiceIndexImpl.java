package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.ServiceIndexDao;
import com.renrenlab.rlab.model.ServiceIndexInfo;
import com.renrenlab.rlab.service.IServiceIndexService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by guanjipeng on 2017/10/18.
 *
 * @author guan
 * @date 2017/10/20
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ServiceIndexImpl implements IServiceIndexService {

    private static final Logger logger = LoggerFactory.getLogger(ServiceIndexImpl.class);
    @Autowired
    private ServiceIndexDao serviceIndexDao;

    /**
     * @param keyword
     * @param province
     * @param city
     * @param district
     * @param orderByDefault
     * @param orderByPrice
     * @param orderByDis
     * @param pageNo
     * @param pageSize
     * @param orgOid
     * @return
     */
    @Override
    public PageInfo<ServiceIndexInfo> search(String keyword,
                                             String province, String city, String district,
                                             Integer lowPrice, Integer highPrice,
                                             String orderByDefault, String orderByPrice, String orderByDis,
                                             Integer pageNo, Integer pageSize,
                                             Long orgOid, HttpSession session,
                                             String customTag,
                                             String category1,
                                             String category2) {
        if (lowPrice != null) {
            lowPrice *= 100;
        }
        if (highPrice != null) {
            highPrice *= 100;
        }
        keyword = SearchUtil.doHandleKeyword(keyword);
        province = SearchUtil.doHandleKeyword(province);
        city = SearchUtil.doHandleKeyword(city);
        district = SearchUtil.doHandleKeyword(district);

        Double longitude = null, latitude = null;
        if (session != null) {
            Object o1 = session.getAttribute(Constant.Service.LONGITUDE), o2 = session.getAttribute(Constant.Service.LATITUDE);
            if (o1 != null && o2 != null) {
                longitude = Double.parseDouble(o1.toString());
                latitude = Double.parseDouble(o2.toString());
            }
            //默认排序,优先根据机构是否认证，其次按距离
            if (orderByDis == null && orderByPrice == null) {
                orderByDefault = "certification_des";
                orderByDis = "dis_asc";
            }
        }
        if ("全国".equals(province)) {
            province = null;
        }
        if (pageNo == null) {
            pageNo = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        PageHelper.startPage(pageNo, pageSize);
        List<ServiceIndexInfo> infos = serviceIndexDao.search(keyword, province, city, district,
                lowPrice, highPrice,
                orderByDefault, orderByPrice, orderByDis,
                longitude, latitude, orgOid, customTag, category1, category2);
        for (ServiceIndexInfo info : infos) {
            if (info.getServicePic() != null) {
                info.setServicePic(SearchUtil.handlePicToStr(info.getServicePic().toString()));
            }
            info.setServicePrice(SearchUtil.handlePrice(info.getServicePrice().toString()));
            info.setServiceScope(JSONArray.parseArray(info.getServiceScope() == null ? "" : info.getServiceScope().toString()));
            info.setServiceAptitude(JSONArray.parseArray(info.getServiceAptitude() == null ? "" : info.getServiceAptitude().toString()));
        }
        return new PageInfo<>(infos);
    }

    @Override
    public PageInfo<ServiceIndexInfo> searchByOrgOid(Long orgOid, Integer pageNo, Integer pageSize, HttpSession session) {
        if (pageNo == null) {
            pageNo = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        return this.search(null, null, null, null,
                null, null,
                null, null, null,
                pageNo, pageSize, orgOid, session, null, null, null);
    }

    @Override
    public int selectCountsByOrgOid(Long orgOid) {
        return serviceIndexDao.selectCountsByOrgOid(orgOid);
    }
}
