package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.InsDetailInfo;
import com.renrenlab.rlab.model.InsListInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 前端仪器模块
 * Created by guanjipeng on 2017/5/15.
 */
public interface FrontInsService {

    /**
     * 仪器查询接口
     *
     * @param keyword  查询关键字
     * @param pageNo   查询第几页
     * @param pageSize 该页条数
     * @return 仪器列表页面
     */
    PageInfo<InsListInfo> searchInstrument(String keyword,
                                           String insServiceType,
                                           Integer scopeLowPrice,
                                           Integer scopeHighPrice,
                                           String category1,
                                           String category2,
                                           String province,
                                           String city,
                                           String district,
                                           Integer pageNo,
                                           Integer pageSize,
                                           boolean isDis,
                                           HttpServletRequest request,
                                           String isSubscribe);

    /**
     * 获取省市下的区
     * @param province
     * @param city
     * @return
     */
    List<String> getDistrict(String province,String city);
    /**
     * @param id 根据mapId搜索仪器详情
     * @return 返回该仪器详情
     */
    InsDetailInfo search(Long id);

    /**
     * 判断仪器是否存在
     *
     * @param location
     * @param isCity
     * @return
     */
    boolean IsExistedInstrument(String location, boolean isCity);

}
