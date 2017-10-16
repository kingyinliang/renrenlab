package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserBaseInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserBaseInfoDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserBaseInfo record);

    //TODO 返回值问题
    int insertSelective(UserBaseInfo record);

    UserBaseInfo selectByPrimaryKey(Long id);

    /**
     * 根据用户Id查询用户信息
     *
     * @param uid
     * @return
     */
    UserBaseInfo selectByUId(Long uid);
    
    int updateByPrimaryKeySelective(UserBaseInfo record);

    int updateByPrimaryKey(UserBaseInfo record);

    /**
     * 删除客服
     *
     * @param cs_id
     * @return
     */
    int deleteByCsId(@Param("cs_id") Long cs_id);

    /**
     * 根据用户名查询登录信息
     *
     * @param name
     * @return
     */
    UserBaseInfo selectByName(@Param("cs_name") String name);

    /**
     * 管理员编辑客服信息  用户修改自己的登录密码
     *
     * @param userBaseInfo
     * @return
     */
    int updateByCsIdSelective(UserBaseInfo userBaseInfo);

    /**
     * 获取客服列表
     *
     * @return
     */
    List<UserBaseInfo> getCSList();

	UserBaseInfo selectByPhone(String phone);

	int updateByUIdSelective(UserBaseInfo user);

	List<UserBaseInfo> selectByuPhoneOruName(String searchMsg);

	List<UserBaseInfo> selectByPhoneAndPassword();
}