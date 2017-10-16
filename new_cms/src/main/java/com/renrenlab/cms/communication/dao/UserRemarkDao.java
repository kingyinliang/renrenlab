package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserRemark;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRemarkDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserRemark record);

    int insertSelective(UserRemark record);

    UserRemark selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRemark record);

    int updateByPrimaryKey(UserRemark record);
}