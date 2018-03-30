package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.Infomation;
import com.renrenlab.rlab.model.InsListInfo;
import com.renrenlab.rlab.model.ServiceIndexInfo;

import java.util.Map;

/**
 * Created by guanjipeng on 2018/1/10.
 */
public interface ISearchAll {
    Map<String, PageInfo> searchAll(Integer pageNo, Integer pageSize, String searchKey,
                                    String province,
                                    String city,
                                    String district);


    /**
     * 仪器预约
     *
     * @param pageNo
     * @param pageSize
     * @param searchKey
     * @param tag       仪器预约
     * @return
     */
    PageInfo<InsListInfo> getMoreIns(Integer pageNo, Integer pageSize, String searchKey,
                                     String category2,
                                     String province,
                                     String city,
                                     String district,
                                     String tag);

    PageInfo<ServiceIndexInfo> getService(Integer pageNo, Integer pageSize, String key, String tag,
                                          String province,
                                          String city,
                                          String district,
                                          String category2);

    PageInfo<Infomation> getClassify(String classifyName, Integer pageNo);
}
