package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.KeywordInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KeywordInfoDao {

    int insertSelective(@Param("infos") List<KeywordInfo> infos);

    int insertSelective2(KeywordInfo info);

    List<KeywordInfo> selectKeywordInfos(@Param("beginTime") String beginTime,
                                         @Param("endTime") String endTime,
                                         @Param("limit") Integer limit);

    int updateByPrimaryKeySelective(KeywordInfo record);

}