package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.UserWx;

public interface UserWxDao {
	
    int deleteByPrimaryKey(Long id);

    int insert(UserWx record);

    int insertSelective(UserWx record);

    UserWx selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserWx record);

    int updateByPrimaryKey(UserWx record);

	UserWx queryByOpenId(String openid);
}