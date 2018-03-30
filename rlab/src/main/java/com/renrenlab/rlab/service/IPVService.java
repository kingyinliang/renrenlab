package com.renrenlab.rlab.service;

import com.renrenlab.rlab.model.PVStatInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/11/30.
 */
public interface IPVService {
    List<PVStatInfo> getPV(Integer day);

    void statisticsPVCount();

    List<Map<String, Object>> rankList();

    List<Map<String, Object>> getOrgRank();

}
