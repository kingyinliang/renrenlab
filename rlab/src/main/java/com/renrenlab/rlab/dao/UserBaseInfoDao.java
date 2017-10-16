package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.model.UserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserBaseInfoDao {

    /**
     * 通过手机号和密码查询用户
     *
     * @param mobile
     * @param password
     * @return
     */
    UserBaseInfo selectByMobileAndPassword(@Param("mobile") String mobile, @Param("password") String password);

    /**
     * 通过手机号查询用户数量
     *
     * @param mobile
     * @return
     */
    Integer selectUserCountByMobile(@Param("mobile") String mobile);

    /**
     * 通过手机号查询用户
     *
     * @param mobile
     * @return
     */
    List<UserBaseInfo> selectUserBaseInfoByMobile(@Param("mobile") String mobile);

    /**
     * 更新用户信息
     *
     * @param userBaseInfo
     * @return
     */
    Integer updateUserBaseInfo(UserBaseInfo userBaseInfo);

    /**
     * 添加用户信息
     *
     * @param userBaseInfo
     * @return
     */
    Integer insertUserBaseInfo(UserBaseInfo userBaseInfo);

    /**
     * 通过ID查询用户信息
     *
     * @param uuid
     * @return
     */
    UserBaseInfo selectUserBaseInfoByUUid(@Param("uuid") Long uuid);

    /**
     * 通过ID查询用户信息
     *
     * @param uuid
     * @return
     */
    UserBaseInfo selectUserDetailInfoByUUid(@Param("uuid") Long uuid);

    /**
     * 通过mobile查询用户信息
     *
     * @param mobile
     * @return
     */
    UserBaseInfo selectUserDetailInfoByMobile(@Param("mobile") String mobile);

    /**
     * 通过ID和密码查询用户数量
     *
     * @param uuid
     * @return
     */
    Integer selectUserCountByUUidAndPassword(@Param("uuid") Long uuid, @Param("password") String password);

    /**
     * 微信登录
     *
     * @param openId
     * @param unionid
     * @return
     */
    Integer insertUserInfoForWx(@Param("openId") String openId, @Param("unionid") String unionid);

    /**
     * 查询微信用户是否存在
     *
     * @param wxUnionId
     * @param wxSource
     * @return
     */
    Integer selectUserByUnionId(@Param("wx_union_id") String wxUnionId, @Param("wx_source") Integer wxSource);

    /**
     * 根据条件查询用户基本信息
     *
     * @param keyword
     * @param type
     * @param source
     * @param beginTime
     * @param endTime
     * @return
     */
    List<UserBaseInfo> searchUserList(@Param("keyword") String keyword, @Param("order") String order, @Param("type") String type, @Param("source") Integer source, @Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 根据条件查询所有用户管理信息
     *
     * @return
     */
    List<UserBaseInfo> searchUserBaseInfo();

    /**
     * 修改用户状态
     *
     * @param state
     */
    void updateUserState(@Param("state") Integer state, @Param("uuid") Long uid);

    List<UserBaseInfo> getRoleList(@Param("uUid") Long uUid, @Param("keyword") String keyword, @Param("rName") String rName, @Param("uPermisssion") String uPermisssion);

    //添加管理员 begin
    int addManager(UserBaseInfo baseInfo);

    int insertRoleMap(UserBaseInfo baseInfo);

    int insertDepartment(UserBaseInfo baseInfo);
    //添加管理员 end

    //修改管理员信息
    int updateManager(UserBaseInfo baseInfo);

    //移除管理员
    int deleteManager(Long uUid);

    //停用管理员
    int disableManager(@Param("uUids") Long[] uUids);

    //启用用管理员
    int enableManager(@Param("uUids") Long[] uUids);

    //更新角色权限
    int updateRolePermission(UserRole userRole);

    int updateMana(UserBaseInfo baseInfo);
}