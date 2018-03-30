package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.vo.Result;
import com.renrenlab.rlab.vo.UserSimpleInfo;

import javax.servlet.http.HttpSession;

public interface UserBaseInfoService {

    /**
     * 用户登陆
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    Result<UserBaseInfo> login(UserSimpleInfo userSimpleInfo, HttpSession session);

    /**
     * 用户登陆
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    Result<UserBaseInfo> textLogin(UserSimpleInfo userSimpleInfo, HttpSession session);

    /**
     * 用户注册
     *
     * @param userSimpleInfo
     * @return
     */
    Result<UserBaseInfo> register(UserSimpleInfo userSimpleInfo, HttpSession session);



    /*
            * 用户使用验证码注册*/
    Result<UserBaseInfo> newRegister(UserSimpleInfo userSimpleInfo, HttpSession session);
    /**
     * 绑定手机号
     *
     * @param userSimpleInfo
     * @param session
     */
    void bindMobile(UserSimpleInfo userSimpleInfo, HttpSession session);

    /**
     * 修改用户密码
     *
     * @param oldPassword
     * @param newPassword
     */
    void modifyPassword(Long uUid, String oldPassword, String newPassword);

    /**
     * 修改用户信息
     *
     * @param userBaseInfo
     */
    void modifyUserBaseInfo(UserBaseInfo userBaseInfo);

    /**
     * 重置密码
     *
     * @param userSimpleInfo
     * @param session
     */
    void resetPassword(UserSimpleInfo userSimpleInfo, HttpSession session);

    /**
     * 发送手机验证码
     *
     * @param userSimpleInfo
     * @param session
     */
    void sendVerifyCode(UserSimpleInfo userSimpleInfo, HttpSession session);

    /**
     * 发送快速登录/注册手机验证码
     *
     * @param userSimpleInfo
     * @param session
     */
    void sendRegisterVerifyCode(UserSimpleInfo userSimpleInfo, HttpSession session);

    /**
     * 微信登录
     *
     * @param openId
     * @param unionid
     */
    void wxLogin(String openId, String unionid);

    /**
     * 获取用户信息
     *
     * @param uuid
     * @return
     */
    UserBaseInfo searchUserBaseInfo(Long uuid);

    /**
     * 分页查询用户信息
     *
     * @param pageNo
     * @param pageSize
     * @param keyword
     * @param type
     * @param source
     * @param beginTime
     * @param endTime
     * @return
     */
    PageInfo<UserBaseInfo> searchUserList(Integer pageNo, Integer pageSize, String keyword, String order, String type, Integer source, String beginTime, String endTime);

    /**
     * 修改用户状态
     *
     * @param state
     */
    void modifyUserState(Integer state, Long uuid);

    /**
     * 获取用户信息通过mobile
     *
     * @param mobile
     * @return
     */
    UserBaseInfo searchUserBaseInfoByMobile(String mobile);
}
