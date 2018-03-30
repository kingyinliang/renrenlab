package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InfomationRecruit;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface InfomationRecruitDao {
    int deleteByPrimaryKey(Long id);

    int insert(InfomationRecruit record);

    int insertSelective(InfomationRecruit record);

    InfomationRecruit selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(InfomationRecruit record);

    int updateByPrimaryKey(InfomationRecruit record);

    List<InfomationRecruit> selectList(@Param("limit") int limit);
}