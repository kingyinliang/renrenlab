package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InfomationResume;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface InfomationResumeDao {
    int deleteByPrimaryKey(Long id);

    int insertSelective(InfomationResume record);

    InfomationResume selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(InfomationResume record);

    int updateByPrimaryKey(InfomationResume record);

    List<InfomationResume> selectList(@Param("limit") int limit);
}