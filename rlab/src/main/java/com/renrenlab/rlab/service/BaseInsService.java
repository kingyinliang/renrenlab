package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.BaseInsInfo;

import java.util.Map;

/**
 * Created by guanjipeng on 2017/7/20.
 */
public interface BaseInsService {

    /**
     * 查询基本仪器列表
     *
     * @param keyword    仪器编号、仪器名称、仪器型号
     * @param insCatogry 仪器类别id
     * @param beginTime
     * @param endTime
     * @return
     */
    PageInfo<BaseInsInfo> getList(String keyword, String insCatogry,
                                  String beginTime, String endTime,
                                  Integer pageNo, Integer pageSize,
                                  String order);

    /**
     * 根据仪器id 查看详情
     *
     * @param insId
     * @return
     */
    BaseInsInfo getDetail(Long insId);

    /**
     * 修改仪器基本信息
     *
     * @param insInfo
     * @return
     */
    int modify(BaseInsInfo insInfo);

    /**
     * 仪器三级分类
     *
     * @param level
     * @param code
     * @return
     */
    Map<String, Object> getCategory(Integer level, String code);

    Map<String, Object> getCoreParam(String code);

}
