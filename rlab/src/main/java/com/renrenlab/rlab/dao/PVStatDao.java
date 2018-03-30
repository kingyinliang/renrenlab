package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.PVStatInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PVStatDao {
    int deleteByPrimaryKey(Long id);

    int addPVCount(@Param("pvCount") Integer pvCount);

    List<PVStatInfo> selectByDate(@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    int updatePVCount(PVStatInfo pvStatInfo);

    int updateByPrimaryKey(PVStatInfo record);

    List<Map<String, Object>> getRankList();

    List<Map<String, Object>> getOrgRank();
}