package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InfomationCareer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
* 职来职往资讯表
*/
@Repository
public interface InfomationCareerDao {
    int deleteByPrimaryKey(Long id);

    int insert(InfomationCareer record);

    int insertSelective(InfomationCareer record);

    InfomationCareer selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(InfomationCareer record);

    int updateByPrimaryKey(InfomationCareer record);

    List<InfomationCareer> selectList(@Param("limit") int limit);
}