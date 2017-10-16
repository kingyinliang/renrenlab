package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserAddrInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAddrInfoDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserAddrInfo record);

    int insertSelective(UserAddrInfo record);

    UserAddrInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserAddrInfo record);

    int updateByPrimaryKey(UserAddrInfo record);
}