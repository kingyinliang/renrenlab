package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.MessageInfo;
import org.springframework.stereotype.Component;

@Component
public interface MessageInfoDao {
    int deleteByPrimaryKey(Long mId);

    int insertSelective(MessageInfo record);

    MessageInfo selectByPrimaryKey(Long mId);

    int updateByPrimaryKeySelective(MessageInfo record);

}