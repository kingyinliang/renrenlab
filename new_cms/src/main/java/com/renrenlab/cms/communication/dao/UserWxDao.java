package com.renrenlab.cms.communication.dao;

import java.util.List;

import com.renrenlab.cms.communication.model.UserWx;
import org.springframework.stereotype.Repository;

@Repository
public interface UserWxDao {
    /**
     * 插入微信表
     *
     * @param userWx
     * @return
     */
    int insertSelective(UserWx userWx);

    UserWx selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserWx record);

    int updateByPrimaryKey(UserWx record);
    
	/**
	 * 根据用户ID获取微信表信息
	 * @param uUid
	 * @return UserWx
	 */
    List<UserWx> selectByUserId(Long uUid);

	/**
	 * 根据微信openId获取微信表信息
	 * @param wxOpenId
	 * @return WxUser
	 */
    UserWx selectByOpenId(String wxOpenId);

	/**
	 * 更新微信表信息
	 * 根据openId
	 * @param record
	 * @return
	 */
	int updateByOpenIdSelective(UserWx record);

	/**
	 * 根据用户ID获取微信表中聊天所用信息
	 *
	 * @param uUid
	 * @return
	 */
	UserWx selectChatUserByUuId(Long uUid);

	/**
	 * 根据用户ID获取微信表中聊天所用信息关注的
	 *
	 * @param uUid
	 * @return
	 */
	UserWx selectUserByUuId(Long uUid);
}