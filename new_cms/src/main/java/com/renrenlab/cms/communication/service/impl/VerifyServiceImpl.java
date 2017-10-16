package com.renrenlab.cms.communication.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.communication.dao.VerifyCodeDao;
import com.renrenlab.cms.communication.model.VerifyCode;
import com.renrenlab.cms.communication.service.IVerifyCodeService;

/**
 * 手机验证码
 */
@Service
public class VerifyServiceImpl implements IVerifyCodeService {

	@Autowired
	private VerifyCodeDao verifycodeDao;

	/**
	 * 插入
	 */
	@Override
	public int insertSelective(VerifyCode record) {
		return verifycodeDao.insertSelective(record);
	}

	/**
	 * 查询
	 */
	@Override
	public VerifyCode selectByPhoneAndGraphCode(String phone, String validateCode) {
		return verifycodeDao.selectByPhoneAndGraphCode(phone,validateCode);
	}


}
