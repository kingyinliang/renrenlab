package com.renrenlab.cms.communication.dao;

import org.apache.ibatis.annotations.Param;

import com.renrenlab.cms.communication.model.VerifyCode;
import org.springframework.stereotype.Repository;

@Repository
public interface VerifyCodeDao {
    int deleteByPrimaryKey(Long id);

    int insert(VerifyCode record);

    int insertSelective(VerifyCode record);

    VerifyCode selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VerifyCode record);

    int updateByPrimaryKey(VerifyCode record);

	VerifyCode selectByPhoneAndGraphCode(@Param("phone") String phone,@Param("validateCode") String validateCode);
}