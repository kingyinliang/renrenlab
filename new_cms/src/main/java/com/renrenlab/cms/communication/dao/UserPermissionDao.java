package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserPermission;
import org.springframework.stereotype.Repository;

@Repository
public interface UserPermissionDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserPermission record);

    int insertSelective(UserPermission record);

    UserPermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserPermission record);

    int updateByPrimaryKey(UserPermission record);
}