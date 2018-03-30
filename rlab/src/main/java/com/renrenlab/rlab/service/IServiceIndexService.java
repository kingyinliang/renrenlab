package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.ServiceIndexInfo;

import javax.servlet.http.HttpSession;

/**
 * Created by guanjipeng on 2017/10/18.
 */
public interface IServiceIndexService {
    /**
     * @param keyword
     * @param province
     * @param city
     * @param district
     * @param lowPrice
     * @param highPrice
     * @param orderByDefault
     * @param orderByPrice
     * @param orderByDis
     * @param pageNo
     * @param pageSzie
     * @param orgOid
     * @param session
     * @return
     */
    PageInfo<ServiceIndexInfo> search(
            String keyword,
            String province, String city, String district,
            Integer lowPrice, Integer highPrice,
            String orderByDefault, String orderByPrice, String orderByDis,
            Integer pageNo, Integer pageSzie,
            Long orgOid, HttpSession session, String customTag,
            String category1,
            String category2);

    /**
     * 根据机构id 检索服务
     *
     * @param orgOid
     * @param pageNo
     * @param pageSize
     * @param session
     * @return
     */
    PageInfo<ServiceIndexInfo> searchByOrgOid(Long orgOid, Integer pageNo, Integer pageSize, HttpSession session);

    /**
     * 根据机构id获取服务数量
     *
     * @param orgOid
     * @return
     */
    int selectCountsByOrgOid(Long orgOid);
}
