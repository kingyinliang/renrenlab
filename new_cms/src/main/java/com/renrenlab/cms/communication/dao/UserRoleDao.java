package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserRole;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);

    UserRole selectByuRid(Long id);
}