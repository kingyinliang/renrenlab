package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.VerifyCode;


public interface IVerifyCodeService {
	
	/**
	 * 插入
	 * @param record
	 * @return
	 */
	int insertSelective(VerifyCode record);

	/**
	 * 查询
	 * @param phone
	 * @return
	 */
	VerifyCode selectByPhoneAndGraphCode(String phone, String validateCode);
}
