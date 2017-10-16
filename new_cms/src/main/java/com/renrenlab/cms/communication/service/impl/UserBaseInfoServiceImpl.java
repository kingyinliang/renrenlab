package com.renrenlab.cms.communication.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.renrenlab.cms.common.constant.Constant;
import com.renrenlab.cms.common.util.*;
import com.renrenlab.cms.communication.dao.SessionBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserRoleDao;
import com.renrenlab.cms.communication.dao.UserRoleMapDao;
import com.renrenlab.cms.communication.dto.OldWebUser;
import com.renrenlab.cms.communication.exception.ResponseMessage;
import com.renrenlab.cms.communication.exception.customerService.CustomerServiceErrorOldpasswordException;
import com.renrenlab.cms.communication.exception.customerService.CustomerServiceExistsException;
import com.renrenlab.cms.communication.exception.customerService.CustomerServiceInsertException;
import com.renrenlab.cms.communication.exception.user.UserNotFoundException;
import com.renrenlab.cms.communication.exception.user.UserNotMatchException;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.model.UserRoleMap;
import com.renrenlab.cms.communication.service.IUserBaseInfoService;
import com.renrenlab.cms.communication.vo.CSOutInfo;
import com.renrenlab.cms.communication.vo.CustomerServiceInfo;
import com.renrenlab.cms.communication.vo.params.CSInInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * 用户基本信息
 *
 * Created by lihongxun on 2017/5/16.
 */
@Service
@Transactional
public class UserBaseInfoServiceImpl implements IUserBaseInfoService {

	private static Logger log = LoggerFactory.getLogger(UserBaseInfoServiceImpl.class);

	@Autowired
	private UserBaseInfoDao userBaseInfoDao;
	@Autowired
	private SessionBaseInfoDao sessionBaseInfoDao;
	@Autowired
	private UserRoleMapDao userRoleMapDao;
	@Autowired
	private UserRoleDao userRoleDao;

	/**
	 * 客服登录
	 *
	 * @param phone
	 * @param password
	 * @return
	 */
	@Override
	public CSOutInfo doLogin(String phone, String password) {
		UserBaseInfo userBaseInfo = userBaseInfoDao.selectByPhone(phone);
		if (null == userBaseInfo) {
			throw new UserNotFoundException(ResponseMessage.USER_NOT_FOUND_ERROR);
		}
		log.info("用户密码：" + PasswordUtils.encrypt(password));
		log.info("用户信息：" + userBaseInfo.toString());
		if (!userBaseInfo.getuPassword().equals(PasswordUtils.encrypt(password))) {
			throw new UserNotMatchException(ResponseMessage.USER_OR_PASSWORD_ERROR);
		}
		CSOutInfo csOutInfo = new CSOutInfo();
		csOutInfo.setCsId(userBaseInfo.getuUid());
		csOutInfo.setCsName(userBaseInfo.getuName());
		csOutInfo.setCsAvatar(userBaseInfo.getuAvatar());
		csOutInfo.setCsSex(userBaseInfo.getuSex());
		csOutInfo.setCsAge(userBaseInfo.getuAge());
		csOutInfo.setCsPhone(userBaseInfo.getuMobile());
		// todo: setrPermisssion 不确定
		UserRoleMap userRoleMap = userRoleMapDao.selectByuUid(userBaseInfo.getuUid());
		csOutInfo.setrId(userRoleMap.getuRid());
		// 0 普通客服 1 客服管理员
		csOutInfo.setrPermisssion(userRoleDao
				.selectByuRid(userRoleMapDao.selectByuUid(userBaseInfo.getuUid()).getuRid()).getrPermisssion());
		return csOutInfo;
	}

	/**
	 * 客服修改密码
	 *
	 * @param csInfo
	 * @param session
	 * @param CS_INFO
	 * @return
	 */
	@Override
	public int updatePassword(CSInInfo csInfo, HttpSession session, Map<Long, HttpSession> CS_INFO) {
		// 判断旧密码是否匹配
		if (!userBaseInfoDao.selectByUId(csInfo.getCsId()).getuPassword().equals(PasswordUtils.encrypt(csInfo.getOldpassword()))) {
			throw new CustomerServiceErrorOldpasswordException(ResponseMessage.CS_OLDPASSWORD_ERROR);
		}
		UserBaseInfo customerService = new UserBaseInfo();
		customerService.setuUid(csInfo.getCsId());
		customerService.setuPassword(PasswordUtils.encrypt(csInfo.getPassword()));
		try {
			userBaseInfoDao.updateByCsIdSelective(customerService);
			// 密码更新成功 执行退出操作
			CS_INFO.remove(session.getAttribute("csId"));
			session.removeAttribute("csId");
			session.removeAttribute("csName");
			session.removeAttribute("csAvatar");
			session.removeAttribute("rId");
			session.removeAttribute("csPhone");
		} catch (Exception e) {
			log.debug("修改密码时出现异常：" + e);
			throw new RuntimeException(e);
		}
		return 0;
	}

	/**
	 * 获取客服列表
	 *
	 * @return
	 */
	@Override
	public List<CustomerServiceInfo> getCSList() {
		List<CustomerServiceInfo> customerServiceInfos = null;
		List<UserBaseInfo> userBaseInfos = userBaseInfoDao.getCSList();

		if (userBaseInfos == null || userBaseInfos.size() == 0)
			return customerServiceInfos;

		customerServiceInfos = new ArrayList<CustomerServiceInfo>();
		CustomerServiceInfo customerServiceInfo;
		for (UserBaseInfo userBaseInfo : userBaseInfos) {
			customerServiceInfo = new CustomerServiceInfo();
			customerServiceInfo.setCsId(userBaseInfo.getuUid());
			customerServiceInfo.setMobile(userBaseInfo.getuMobile());
			customerServiceInfo.setCsName(userBaseInfo.getuName());
			customerServiceInfo.setCsAvatar(userBaseInfo.getuAvatar());
			customerServiceInfo.setCount(sessionBaseInfoDao.selectByCsId(userBaseInfo.getuUid()));
			customerServiceInfos.add(customerServiceInfo);
		}
		return customerServiceInfos;
	}

	/**
	 * 添加客服
	 *
	 * @param userBaseInfo
	 * @return
	 *
	 */
	@Transactional
	@Override
	public void addcs(UserBaseInfo userBaseInfo) {
		// 校验输入
		// 非空值（id,cs_id,cs_name,cs_password,r_id,g_id,cs_state,create_time,modify_time）
		if (userBaseInfo == null || userBaseInfo.getuMobile() == null || userBaseInfo.getuPassword() == null) {
			throw new CustomerServiceInsertException(ResponseMessage.CUSTOMERSERVICE_INSERT_ERROR);
		}

		// 密码加密
		userBaseInfo.setuPassword(PasswordUtils.encrypt(userBaseInfo.getuPassword()));

		// 用户手机号已存在
		UserBaseInfo user = userBaseInfoDao.selectByPhone(userBaseInfo.getuMobile());
		if (null != user) {
			log.info(user.toString());
			// 判断是否为客服
			JSONArray jsonArray = JSONObject.parseArray(user.getuType().toString());
			Integer o = (Integer)jsonArray.get(1);

			if (o != 1) {
				// 不为客服人员
				userBaseInfo.setuUid(user.getuUid());
				jsonArray.set(1,1);
				userBaseInfo.setuType(jsonArray.toString());
				userBaseInfoDao.updateByCsIdSelective(userBaseInfo);
			}

			UserRoleMap userRoleMap = userRoleMapDao.selectByuUid(userBaseInfo.getuUid());
			if (null != userRoleMap && 10004L == userRoleMap.getuRid()) {
				// 用户为客服用户
				throw new CustomerServiceExistsException(ResponseMessage.CUSTOMERSERVICE_EXISTS_ERROR);
			} else if (null != userRoleMap && (10004L != userRoleMap.getuRid())) {
				// 用户不为客服用户
				UserRoleMap map = new UserRoleMap();
				map.setId(userRoleMap.getId());
				map.setuRid(10004L);
				userRoleMapDao.updateByPrimaryKeySelective(map);
			} else {
				userBaseInfo.setuUid(user.getuUid());
				setUserRole(userBaseInfo);
			}
		} else {

			// 校验用户手机号不存在
			// 设置为客服
			userBaseInfo.setuType("[0,1,0]");
			userBaseInfoDao.insertSelective(userBaseInfo);

			// 插入用户角色关联
			setUserRole(userBaseInfo);
		}
	}

	/**
	 * 插入用户角色关联
	 *
	 * @param user
	 */
	private void setUserRole(UserBaseInfo user) {
		UserRoleMap userRoleMap = new UserRoleMap();
		userRoleMap.setuUid(user.getuUid());
		userRoleMap.setuRid(10004L);
		userRoleMapDao.insertSelective(userRoleMap);
	}

	/**
	 * 删除客服
	 *
	 * @param cs_id
	 * @return
	 */
	@Override
	public int delCs(Long cs_id) {
		userBaseInfoDao.deleteByCsId(cs_id);
		return userRoleMapDao.deleteByCsId(cs_id);
	}

	/**
	 * 修改客服信息
	 *
	 * @param userBaseInfo
	 * @return
	 */
	@Override
	public int updateCs(UserBaseInfo userBaseInfo) {
		// 检索数据库 校验用户名是否已存在
		if (null != userBaseInfoDao.selectByName(userBaseInfo.getuName())) {
			throw new CustomerServiceExistsException(ResponseMessage.CUSTOMERSERVICE_EXISTS_ERROR);
		}
		return userBaseInfoDao.updateByCsIdSelective(userBaseInfo);
	}

	/**
	 * 根据用户id查询用户
	 */
	@Override
	public UserBaseInfo selectByUserId(Long uid) {
		return userBaseInfoDao.selectByUId(uid);
	}

	/**
	 * 根据手机号查询用户
	 */
	@Override
	public UserBaseInfo selectByuPhone(String phone) {
		return userBaseInfoDao.selectByPhone(phone);
	}

	/**
	 * 添加新用户，返回uid
	 */
	@Override
	public int insertSelective(UserBaseInfo record) {
		return userBaseInfoDao.insertSelective(record);
	}

	/**
	 * 更新用户信息
	 */
	@Override
	public int updateByUserIdSelective(UserBaseInfo user) {
		return userBaseInfoDao.updateByUIdSelective(user);
	}

	/**
	 * 新老用户数据同步
	 */
	@Override
	public int synchronizeData(UserBaseInfo user) {
		log.debug("处理新老用户同步");
		// 私有密钥
		OldWebUser newUser = new OldWebUser();
		newUser.setPhone(user.getuMobile());
		newUser.setAvatar(user.getuAvatar());
		newUser.setPassword(user.getuPassword());
		newUser.setName(user.getuName());
		newUser.setRegisterTime(new Date());
		newUser.setNickname(user.getuNickname());
		
		Map<String,Object> map = new HashMap<>();
		
		String userInfo = JsonUtil.getInstance().obj2json(newUser);
		String md5 = MD5Util.MD5("rlab");
		userInfo = SymmetricEncoderUtil.AESEncode(md5, userInfo);
		map.put("userInfo", userInfo);
		userInfo = JsonUtil.getInstance().obj2json(map);
		log.debug(".....userInfo=" + userInfo);
		String url =Constant.OLDWEBURL;
		String rel = WeixinBasicUtil.sendJsonPost(url, userInfo);
		log.debug("rel=" + rel);
		if("0".equals(rel)){
			return 0;
		}
		return 1;
	}
}
