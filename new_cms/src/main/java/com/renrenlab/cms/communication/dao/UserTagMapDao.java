package com.renrenlab.cms.communication.dao;

import org.apache.ibatis.annotations.Param;

import com.renrenlab.cms.communication.model.UserTagMap;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTagMapDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserTagMap record);

    int insertSelective(UserTagMap record);

    UserTagMap selectByPrimaryKey(Long id);

    UserTagMap selectByUIdAndTId(@Param("uId") Long uId,@Param("tId")Long tId);
    
    int updateByPrimaryKeySelective(UserTagMap record);

    int updateByPrimaryKey(UserTagMap record);
    
    
}