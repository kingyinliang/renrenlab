package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.vo.CSOutInfo;
import com.renrenlab.cms.communication.vo.CustomerServiceInfo;
import com.renrenlab.cms.communication.vo.params.CSInInfo;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 用户基本信息
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface IUserBaseInfoService {

    /**
     * 客服执行登录
     *
     * @param name
     * @param password
     * @return
     */
    CSOutInfo doLogin(String name, String password);

    /**
     * 客服修改密码
     *
     * @param csInfo
     * @param session
     * @param CS_INFO
     * @return
     */
    int updatePassword(CSInInfo csInfo, HttpSession session, Map<Long, HttpSession> CS_INFO);

    /**
     * 查询客服列表
     *
     * @return
     */
    List<CustomerServiceInfo> getCSList();

    /**
     * 添加客服
     *
     * @param userBaseInfo
     * @return
     */
    void addcs(UserBaseInfo userBaseInfo);

    /**
     * 删除客服
     *
     * @param cs_id
     * @return
     */
    int delCs(Long cs_id);

    /**
     * 编辑客服昵称
     *
     * @param userBaseInfo
     * @return
     */
    int updateCs(UserBaseInfo userBaseInfo);


	UserBaseInfo selectByuPhone(String phone);
	/**
	 * 插入用户，返回uid
	 * @param record
	 * @return
	 */
	int insertSelective(UserBaseInfo record);

    /**
     * 根据用户I查询
     *
     * @return int
     */
    UserBaseInfo selectByUserId(Long id);

    /**
     * 根据uId更新
     *
     * @param user
     * @return int
     */
    int updateByUserIdSelective(UserBaseInfo user);
    
    int synchronizeData(UserBaseInfo user);

}
