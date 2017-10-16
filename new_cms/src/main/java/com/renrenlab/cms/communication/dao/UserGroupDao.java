package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserGroup;
import org.springframework.stereotype.Repository;

@Repository
public interface UserGroupDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserGroup record);

    int insertSelective(UserGroup record);

    UserGroup selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserGroup record);

    int updateByPrimaryKey(UserGroup record);
}