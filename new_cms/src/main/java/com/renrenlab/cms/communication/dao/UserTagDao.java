package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserTag;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTagDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserTag record);

    int insertSelective(UserTag record);

    UserTag selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserTag record);

    int updateByPrimaryKey(UserTag record);
}