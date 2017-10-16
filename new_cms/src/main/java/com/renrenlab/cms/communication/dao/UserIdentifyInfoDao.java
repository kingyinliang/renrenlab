package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserIdentifyInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserIdentifyInfoDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserIdentifyInfo record);

    int insertSelective(UserIdentifyInfo record);

    UserIdentifyInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserIdentifyInfo record);

    int updateByPrimaryKey(UserIdentifyInfo record);
}