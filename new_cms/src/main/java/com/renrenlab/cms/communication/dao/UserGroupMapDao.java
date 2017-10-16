package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserGroupMap;
import org.springframework.stereotype.Repository;

@Repository
public interface UserGroupMapDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserGroupMap record);

    int insertSelective(UserGroupMap record);

    UserGroupMap selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserGroupMap record);

    int updateByPrimaryKey(UserGroupMap record);
}