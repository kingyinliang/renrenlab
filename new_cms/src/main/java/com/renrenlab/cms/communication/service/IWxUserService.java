package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.wechat.dto.UserOriginalWx;

public interface IWxUserService {
	
	/**
	 * 插入微信表
	 * @param userWx
	 * @return
	 */
	int insertSelective(UserWx userWx);

	/**
	 * 根据用户ID获取微信表信息
	 * @param uId
	 * @return
	 */
	UserWx selectByUserId(Long uId);

	/**
	 * 根据微信openId获取微信表信息
	 * @param wxOpenId
	 * @return userWx
	 */
	UserWx selectByOpenId(String wxOpenId);

	/**
	 * 更新微信表信息
	 * 根据openId
	 * @param userWx
	 * @return
	 */
	int updateByOpenIdSelective(UserWx userWx);

	/**
	 * 根据openId获取原始用户信息
	 * @param openid
	 * @return
	 */
	UserOriginalWx queryByOpenid(String openid);

	/**
	 * 根据code获取openId
	 * 
	 * @param code
	 * @return
	 */
	String queryOpenidByCode(String code);

	/**
	 * 
	 * @param getuId
	 * @param wxOpenId
	 * @param action 
	 */
	void handlerPhoneMsg(Long getuId, String wxOpenId, int action);
}
