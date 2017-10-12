package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.common.interceptor.AuthenticationInterceptor;
import com.renrenlab.rlab.common.util.*;
import com.renrenlab.rlab.dao.UserBaseInfoDao;
import com.renrenlab.rlab.dao.UserRoleDao;
import com.renrenlab.rlab.dao.VerifyCodeDao;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.model.UserRole;
import com.renrenlab.rlab.model.VerifyCode;
import com.renrenlab.rlab.service.UserBaseInfoService;
import com.renrenlab.rlab.vo.OldWebUser;
import com.renrenlab.rlab.vo.Result;
import com.renrenlab.rlab.vo.UserSimpleInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Transactional
public class UserBaseInfoServiceImpl implements UserBaseInfoService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserBaseInfoDao userBaseInfoDao;

    @Autowired
    VerifyCodeDao verifyCodeDao;

    @Autowired
    UserRoleDao userRoleDao;

    @Override
    public Result<UserBaseInfo> login(UserSimpleInfo userSimpleInfo, HttpSession session) {
        // 判断是否错误登录三次
        Map<String, Integer> errorMap = (HashMap<String, Integer>) session.getAttribute("errorMap");
        Integer errorCount = 0;
        if (errorMap != null) {
            errorCount = (Integer) errorMap.get(userSimpleInfo.getMobile());
        } else {
            errorMap = new HashMap<String, Integer>();
        }
        if (errorCount != null && errorCount >= 3) {
            String validateCode = (String) session.getAttribute("validateCode");
            String loginValidateCode = userSimpleInfo.getValidateCode();
            if (!(validateCode != null && loginValidateCode != null && loginValidateCode.equalsIgnoreCase(validateCode))) {
                errorCount = errorCount == null ? 1 : errorCount + 1;
                session.setAttribute("error", errorCount);
                errorMap.put(userSimpleInfo.getMobile(), errorCount);
                session.setAttribute("errorMap", errorMap);
                return new Result<UserBaseInfo>(ResponseEntity.VALIDATE_CODE_ERROR.getCode(),
                        ResponseEntity.VALIDATE_CODE_ERROR.getMessage());
            }
        }
        // 判断手机号和密码参数是否正确
        if (StringUtils.isBlank(userSimpleInfo.getMobile()) || StringUtils.isBlank(userSimpleInfo.getPassword())) {
            errorCount = errorCount == null ? 1 : errorCount + 1;
            session.setAttribute("error", errorCount);
            errorMap.put(userSimpleInfo.getMobile(), errorCount);
            session.setAttribute("errorMap", errorMap);
            return new Result<UserBaseInfo>(ResponseEntity.PARAMETER_ERROR.getCode(),
                    ResponseEntity.PARAMETER_ERROR.getMessage());
        }
        // 判断用户是否注册
        Integer count = userBaseInfoDao.selectUserCountByMobile(userSimpleInfo.getMobile());
        if (count == 0) {
            errorCount = errorCount == null ? 1 : errorCount + 1;
            session.setAttribute("error", errorCount);
            errorMap.put(userSimpleInfo.getMobile(), errorCount);
            session.setAttribute("errorMap", errorMap);
            return new Result<UserBaseInfo>(ResponseEntity.USER_NOT_FOUND_ERROR.getCode(),
                    ResponseEntity.USER_NOT_FOUND_ERROR.getMessage());
        }
        // 用户登录
        UserBaseInfo userBaseInfo = userBaseInfoDao.selectByMobileAndPassword(userSimpleInfo.getMobile(),
                PasswordUtils.md5(userSimpleInfo.getPassword()));
        if (userBaseInfo == null) {
            errorCount = errorCount == null ? 1 : errorCount + 1;
            session.setAttribute("error", errorCount);
            errorMap.put(userSimpleInfo.getMobile(), errorCount);
            session.setAttribute("errorMap", errorMap);
            return new Result<UserBaseInfo>(ResponseEntity.USER_OR_PASSWORD_ERROR.getCode(),
                    ResponseEntity.USER_OR_PASSWORD_ERROR.getMessage());
        }
        if (userBaseInfo.getuState() != null && userBaseInfo.getuState() == 1) {
            session.setAttribute("error", errorCount == null ? 1 : errorCount + 1);
            Map<String, Integer> map = new HashMap<String, Integer>();
            map.put(userSimpleInfo.getMobile(), errorCount);
            session.setAttribute("errorMap", map);
            return new Result<UserBaseInfo>(ResponseEntity.USER_ERROR.getCode(),
                    ResponseEntity.USER_ERROR.getMessage());
        }
        // 登录成功更新用户信息
        userBaseInfo.setuLastLoginTime(new Date());
        userBaseInfo.setuLoginCount(userBaseInfo.getuLoginCount() == null ? 1 : userBaseInfo.getuLoginCount() + 1);
        userBaseInfoDao.updateUserBaseInfo(userBaseInfo);
        //获取用户角色
        UserRole userRole = userRoleDao.selectUserRoleByUUID(userBaseInfo.getuUid());
        //获取用户权限
        if (userRole != null) {
            Integer permisssion = Integer.parseInt(userRole.getrPermisssion());
            Long userRoleId = userRole.getrRid();
            session.setAttribute("u_permisssion_array", userRole.getrPermisssion().toCharArray());
            session.setAttribute("u_permisssion", permisssion);
            session.setAttribute("u_rid", userRoleId);
            session.setAttribute("r_description", userRole.getrDescription());
            session.setAttribute("u_r_name", userRole.getrName());
            StringBuffer permissionReverse = new StringBuffer(userRole.getrPermisssion()).reverse();
            session.setAttribute("u_permission", permissionReverse);
            String modifyTime = AuthenticationInterceptor.authenticationMap.get(Constant.RolePermission.ROLE_KEY);
            if (modifyTime != null)
                session.setAttribute(Constant.RolePermission.ROLE_KEY, modifyTime);
        }
        //处理用户头像为空的情况
        String avatar = Constant.TESTPICURL;
        if (StringUtils.isBlank(userBaseInfo.getuAvatar())) {
            userBaseInfo.setuAvatar(avatar + "/avatar/person_default.jpg");
        } else if (!userBaseInfo.getuAvatar().startsWith("http")) {
            userBaseInfo.setuAvatar(avatar + userBaseInfo.getuAvatar());
        }
        //处理昵称
        String nickName = userBaseInfo.getuNickname();
        session.setAttribute("simpleNickName", UserUtil.cutUserNickName(nickName));
        return new Result<UserBaseInfo>(ResponseEntity.SUCCESS.getCode(), ResponseEntity.SUCCESS.getMessage(), userBaseInfo);
    }

    @Override
    public Result<UserBaseInfo> textLogin(UserSimpleInfo userSimpleInfo, HttpSession session) {
        //判断参数是否合法
        String mobile = (String) session.getAttribute("mobile");
        if (StringUtils.isBlank(mobile) || StringUtils.isBlank(userSimpleInfo.getMobile()) || !mobile.equals(userSimpleInfo.getMobile())) {
            throw new BusinessException(ResponseEntity.VERIFY_CODE_ERROR);
        }
        //判断手机验证码是否合法
        String verifyCode = userSimpleInfo.getVerifyCode();
        String sVerifyCode = (String) session.getAttribute("verifyCode");
        if (StringUtils.isBlank(verifyCode) || StringUtils.isBlank(sVerifyCode) || !verifyCode.equals(sVerifyCode)) {
            throw new BusinessException(ResponseEntity.VERIFY_CODE_ERROR);
        }
        //判断验证码是否过期
        VerifyCode code = verifyCodeDao.selectByMoblie(userSimpleInfo.getMobile());
        code.getCreateTime();
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, -10);
        if (code != null && code.getCreateTime().before(calendar.getTime())) {
            throw new BusinessException(ResponseEntity.MOBILE_VERICODE_EXPIRE_ERROR);
        }
        session.removeAttribute("verifyCode");
        // 用户登录
        List<UserBaseInfo> userBaseInfos = userBaseInfoDao.selectUserBaseInfoByMobile(mobile);
        if (userBaseInfos.size() != 1) {
            throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
        }
        UserBaseInfo userBaseInfo = userBaseInfos.get(0);
        if (userBaseInfo == null) {
            return new Result<UserBaseInfo>(ResponseEntity.USER_NOT_FOUND_ERROR.getCode(),
                    ResponseEntity.USER_NOT_FOUND_ERROR.getMessage());
        }
        if (userBaseInfo.getuState() != null && userBaseInfo.getuState() == 1) {
            return new Result<UserBaseInfo>(ResponseEntity.USER_ERROR.getCode(),
                    ResponseEntity.USER_ERROR.getMessage());
        }
        // 登录成功更新用户信息
        userBaseInfo.setuLastLoginTime(new Date());
        userBaseInfo.setuLoginCount(userBaseInfo.getuLoginCount() == null ? 1 : userBaseInfo.getuLoginCount() + 1);
        userBaseInfoDao.updateUserBaseInfo(userBaseInfo);
        //处理用户头像为空的情况
        String avatar = Constant.TESTPICURL;
        if (StringUtils.isBlank(userBaseInfo.getuAvatar())) {
            userBaseInfo.setuAvatar(avatar + "/avatar/person_default.jpg");
        } else if (!userBaseInfo.getuAvatar().startsWith("http")) {
            userBaseInfo.setuAvatar(avatar + userBaseInfo.getuAvatar());
        }
        return new Result<UserBaseInfo>(ResponseEntity.SUCCESS.getCode(), ResponseEntity.SUCCESS.getMessage(), userBaseInfo);
    }

    @Override
    public Result<UserBaseInfo> register(UserSimpleInfo userSimpleInfo, HttpSession session) {
        //判断参数是否合法
        String mobile = (String) session.getAttribute("mobile");
        String password = userSimpleInfo.getPassword();
        String comfirmPassword = userSimpleInfo.getConfirmPassword();
        if (StringUtils.isBlank(userSimpleInfo.getMobile()) || StringUtils.isBlank(password) || StringUtils.isBlank(comfirmPassword) || !password.equals(comfirmPassword)) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //判断手机验证码是否合法
        String verifyCode = userSimpleInfo.getVerifyCode();
        String sVerifyCode = (String) session.getAttribute("verifyCode");
        if (StringUtils.isBlank(verifyCode) || StringUtils.isBlank(sVerifyCode) || !verifyCode.equals(sVerifyCode)) {
            throw new BusinessException(ResponseEntity.VERIFY_CODE_ERROR);
        }
        //判断手机号是否是之前发验证码的手机号
        if (StringUtils.isBlank(mobile) || !mobile.equals(userSimpleInfo.getMobile())) {
            throw new BusinessException(ResponseEntity.VERIFY_CODE_ERROR);
        }
        //判断验证码是否过期
        VerifyCode code = verifyCodeDao.selectByMoblie(userSimpleInfo.getMobile());
        code.getCreateTime();
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, -10);
        if (code != null && code.getCreateTime().before(calendar.getTime())) {
            throw new BusinessException(ResponseEntity.MOBILE_VERICODE_EXPIRE_ERROR);
        }
        session.removeAttribute("verifyCode");
        session.removeAttribute("mobile");
        //判断用户是否已经注册
        List<UserBaseInfo> userBaseInfoList = userBaseInfoDao.selectUserBaseInfoByMobile(userSimpleInfo.getMobile());
        if (userBaseInfoList.size() > 1) {
            throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
        } else if (userBaseInfoList.size() == 1) {
            String uPassword = userBaseInfoList.get(0).getuPassword();
            if (StringUtils.isBlank(uPassword)) {
                throw new BusinessException(ResponseEntity.USER_EXIST_WECHAT_ERROR);
            } else {
                throw new BusinessException(ResponseEntity.USER_EXIST_ERROR);
            }
        }
        //注册完用户默认登录
        UserBaseInfo userBaseInfo = new UserBaseInfo();
        userBaseInfo.setuLoginCount(1);
        userBaseInfo.setuSource(1);
        userBaseInfo.setuLastLoginTime(new Date());
        userBaseInfo.setuNickname("lab" + userSimpleInfo.getMobile().substring(userSimpleInfo.getMobile().length() - 4));
        userBaseInfo.setuMobile(userSimpleInfo.getMobile());
        userBaseInfo.setuPassword(PasswordUtils.md5(userSimpleInfo.getPassword()));
        try {
            userBaseInfoDao.insertUserBaseInfo(userBaseInfo);
        } catch (Exception e) {
//			e.printStackTrace();
            throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
        }
        //到旧主站去注册
        try {
            logger.debug("处理新老用户同步");
            OldWebUser newUser = new OldWebUser();
            newUser.setPhone(userSimpleInfo.getMobile());
            newUser.setPassword(PasswordUtils.md5(userSimpleInfo.getPassword()));
            newUser.setRegisterTime(new Date());
            newUser.setNickname("lab" + userSimpleInfo.getMobile().substring(userSimpleInfo.getMobile().length() - 4));
            Map<String, Object> map = new HashMap<String, Object>();
            String userInfo = null;
            userInfo = JsonMapper.getJsonString(newUser);
            String md5 = MD5Util.MD5("rlab");
            userInfo = SymmetricEncoderUtil.AESEncode(md5, userInfo);
            map.put("userInfo", userInfo);
            userInfo = JsonMapper.getJsonString(map);
            logger.debug(".....userInfo=" + userInfo);
            String renrenlab = HttpClientUtils.doPost(Constant.OLDWEBURL, userInfo, "JSON");
            logger.debug("共同用户结果为：" + renrenlab);
//			if(renrenlab == null || !"0".equals(renrenlab)){
//				throw new BusinessException(ResponseEntity.SYNCHRONOUS_USER_ERROR);
//			}
        } catch (Exception e) {
            logger.debug(e.getMessage());
            throw new BusinessException(ResponseEntity.SYNCHRONOUS_USER_ERROR);
        }
        //添加完用户后，返回用户信息
        userBaseInfo = userBaseInfoDao.selectUserBaseInfoByUUid(userBaseInfo.getuUid());
        session.setAttribute("simpleNickName", UserUtil.cutUserNickName(userBaseInfo.getuNickname()));
        return new Result<UserBaseInfo>(ResponseEntity.SUCCESS.getCode(), ResponseEntity.SUCCESS.getMessage(), userBaseInfo);
    }

    @Override
    public void modifyPassword(Long uUid, String oldPassword, String newPassword) {
        //判断用户旧密码是否输入错误
        if (uUid == null || StringUtils.isBlank(oldPassword)) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        Integer count = userBaseInfoDao.selectUserCountByUUidAndPassword(uUid, PasswordUtils.md5(oldPassword));
        if (count == 0) {
            throw new BusinessException(ResponseEntity.MOBILE_OLD_PASSWORD_ERROR);
        }
        //更新用户密码
        UserBaseInfo userBaseInfo = new UserBaseInfo();
        userBaseInfo.setuUid(uUid);
        userBaseInfo.setuPassword(PasswordUtils.md5(newPassword));
        userBaseInfoDao.updateUserBaseInfo(userBaseInfo);
    }

    @Override
    public void modifyUserBaseInfo(UserBaseInfo userBaseInfo) {
        userBaseInfoDao.updateUserBaseInfo(userBaseInfo);
    }

    @Override
    public void resetPassword(UserSimpleInfo userSimpleInfo, HttpSession session) {
        //判断手机号是否合法
        String mobile = userSimpleInfo.getMobile();
        String password = userSimpleInfo.getPassword();
        String comfirmPassword = userSimpleInfo.getConfirmPassword();
        Pattern p = Pattern.compile("^(13|15|18|14|17)\\d{9}$");
        Matcher m = p.matcher(mobile);
        //判断参数是否合法
        if (!m.matches() || StringUtils.isBlank(password) || StringUtils.isBlank(comfirmPassword) || !password.equals(comfirmPassword)) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //判断手机验证码是否合法
        String verifyCode = userSimpleInfo.getVerifyCode();
        String sVerifyCode = (String) session.getAttribute("verifyCode");
        if (StringUtils.isBlank(verifyCode) || StringUtils.isBlank(sVerifyCode) || !verifyCode.equals(sVerifyCode) || !mobile.equals(session.getAttribute("mobile"))) {
            throw new BusinessException(ResponseEntity.VERIFY_CODE_ERROR);
        }
        //判断验证码是否过期
        VerifyCode code = verifyCodeDao.selectByMoblie(userSimpleInfo.getMobile());
        code.getCreateTime();
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, -10);
        if (code != null && code.getCreateTime().before(calendar.getTime())) {
            throw new BusinessException(ResponseEntity.MOBILE_VERICODE_EXPIRE_ERROR);
        }
        session.removeAttribute("verifyCode");
        session.removeAttribute("mobile");
        //判断用户是否存在
        Integer count = userBaseInfoDao.selectUserCountByMobile(mobile);
        if (count == 0) {
            throw new BusinessException(ResponseEntity.USER_NOT_FOUND_ERROR);
        }
        //查询用户并修改用户密码
        List<UserBaseInfo> userBaseInfoList = userBaseInfoDao.selectUserBaseInfoByMobile(mobile);
        if (userBaseInfoList.size() > 1) {
            throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
        }
        UserBaseInfo userBaseInfo = userBaseInfoList.get(0);
        userBaseInfo.setuPassword(PasswordUtils.md5(password));
        userBaseInfoDao.updateUserBaseInfo(userBaseInfo);
    }

    @Override
    public void bindMobile(UserSimpleInfo userSimpleInfo, HttpSession session) {
        //判断手机是否合法
        String mobile = userSimpleInfo.getMobile();
        Pattern p = Pattern.compile("^(13|15|18|14|17)\\d{9}$");
        Matcher m = p.matcher(mobile);
        if (!m.matches() || !mobile.equals(session.getAttribute("mobile"))) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //判断参数是否合法
        String password = userSimpleInfo.getPassword();
        String comfirmPassword = userSimpleInfo.getConfirmPassword();
        if (StringUtils.isBlank(password) || StringUtils.isBlank(comfirmPassword) || !password.equals(comfirmPassword)) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //判断手机验证码是否合法
        String verifyCode = userSimpleInfo.getVerifyCode();
        String sVerifyCode = (String) session.getAttribute("verifyCode");
        if (StringUtils.isBlank(verifyCode) || StringUtils.isBlank(sVerifyCode) || !verifyCode.equals(sVerifyCode)) {
            throw new BusinessException(ResponseEntity.VERIFY_CODE_ERROR);
        }
        session.removeAttribute("verifyCode");
        //判断用户是否存在
        Integer count = userBaseInfoDao.selectUserCountByMobile(mobile);
        if (count > 0) {
            throw new BusinessException(ResponseEntity.MOBILE_BIND_ERROR);
        }
        UserBaseInfo userBaseInfo = userBaseInfoDao.selectUserBaseInfoByUUid((Long) session.getAttribute("uid"));
        userBaseInfo.setuPassword(PasswordUtils.md5(password));
        userBaseInfo.setuMobile(mobile);
    }

    @Override
    public void sendVerifyCode(UserSimpleInfo userSimpleInfo, HttpSession session) {
        //判断手机号是否合法
        String mobile = userSimpleInfo.getMobile();
        Pattern p = Pattern.compile("^(13|15|18|14|17)\\d{9}$");
        Matcher m = p.matcher(mobile);
        if (!m.matches()) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        //判断图形验证码是否等于session中的图形验证码
        String validateCode = (String) session.getAttribute("validateCode");
        if (StringUtils.isBlank(userSimpleInfo.getValidateCode()) || !(userSimpleInfo.getValidateCode().equalsIgnoreCase(validateCode))) {
            throw new BusinessException(ResponseEntity.VALIDATE_CODE_ERROR);
        }
        session.removeAttribute("validateCode");
        //判断用户今天是否发送短信是否超过十条
        Calendar cal = Calendar.getInstance();
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        Integer max = verifyCodeDao.selectHodiernalVerifyCode(userSimpleInfo.getMobile(), cal.getTime());
        if (max >= 10) {
            throw new BusinessException(ResponseEntity.MOBILE_VERICODE_MAX_LIMIT_ERROR);
        }
        //判断是否频繁发送验证码
        VerifyCode verifyCode = verifyCodeDao.selectByMoblie(userSimpleInfo.getMobile());
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, -1);
        if (verifyCode != null && !verifyCode.getCreateTime().before(calendar.getTime())) {
            throw new BusinessException(ResponseEntity.MOBILE_VERICODE_ERROR);
        }
        //如果是短信登录，判断用户是否存在
        if (userSimpleInfo.getAction() != null && userSimpleInfo.getAction() == 3) {
            Integer count = userBaseInfoDao.selectUserCountByMobile(mobile);
            if (count == 0) {
                throw new BusinessException(ResponseEntity.USER_NOT_FOUND_ERROR);
            }
        }
        //生成随机验证码
        Random random = new Random();
        int num = random.nextInt(899999) + 100000;
        final String vcVerifyCode = String.valueOf(num);
        logger.info("send verify_code " + vcVerifyCode + " to " + userSimpleInfo.getMobile());
        //发送验证码
        String message = "您好，您的验证码为：" + vcVerifyCode + "，有效期10分钟【人人实验】";
        boolean sendFlag = SMSUtils.sendMessage(mobile, message);
        if (sendFlag) {
            verifyCodeDao.insertVerifyCode(userSimpleInfo.getMobile(), vcVerifyCode);
            session.setAttribute("verifyCode", vcVerifyCode);
            session.setAttribute("mobile", mobile);
        } else {
            throw new BusinessException(ResponseEntity.MOBILE_VERICODE_SEND_ERROR);
        }
    }

    @Override
    public void wxLogin(String openId, String unionid) {
        Integer count = userBaseInfoDao.selectUserByUnionId(unionid, 1);
        if (count == 0) {
            userBaseInfoDao.insertUserInfoForWx(openId, unionid);
        }
    }

    @Override
    public UserBaseInfo searchUserBaseInfo(Long uuid) {
        UserBaseInfo userBaseInfo = userBaseInfoDao.selectUserDetailInfoByUUid(uuid);
        Integer uAuthentication = (Integer) JSON.parseArray(userBaseInfo.getuType().toString()).get(2);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        userBaseInfo.setCreateTimeStr(format.format(userBaseInfo.getCreateTime()));
        userBaseInfo.setuAuthentication(uAuthentication);
        return userBaseInfo;
    }

    @Override
    public PageInfo<UserBaseInfo> searchUserList(Integer pageNo, Integer pageSize, String keyword, String order, String type, Integer source, String beginTime, String endTime) {
        PageHelper.startPage(pageNo, pageSize);
        List<UserBaseInfo> userBaseInfoList = userBaseInfoDao.searchUserList(keyword, order, type, source, beginTime, endTime);
        for (UserBaseInfo userBaseInfo : userBaseInfoList) {
            Integer uAuthentication = (Integer) JSON.parseArray(userBaseInfo.getuType().toString()).get(0);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            userBaseInfo.setCreateTimeStr(format.format(userBaseInfo.getCreateTime()));
            userBaseInfo.setuAuthentication(uAuthentication);
        }
        return new PageInfo<>(userBaseInfoList);
    }

    @Override
    public void modifyUserState(Integer state, Long uuid) {
        if (state != null && uuid != null) {
            userBaseInfoDao.updateUserState(state, uuid);
        }
    }

    @Override
    public UserBaseInfo searchUserBaseInfoByMobile(String mobile) {
        //判断手机是否合法
        Pattern p = Pattern.compile("^(13|15|18|14|17)\\d{9}$");
        Matcher m = p.matcher(mobile);
        if (StringUtils.isBlank(mobile) || !m.matches()) {
            throw new BusinessException(ResponseEntity.USER_NOT_FOUND_ERROR);
        }
        UserBaseInfo userBaseInfo = userBaseInfoDao.selectUserDetailInfoByMobile(mobile);
        if (userBaseInfo == null) {
            throw new BusinessException(ResponseEntity.USER_NOT_FOUND_ERROR);
        }
        return userBaseInfo;
    }

    @Override
    public PageInfo<UserBaseInfo> getRoleList(HttpSession session, String keyword, String rName, Integer pageNo, Integer pageSize) {
        keyword = StringUtils.isBlank(keyword) ? null : keyword;
        rName = StringUtils.isBlank(rName) ? null : rName;
        if (("全部").equals(rName)) rName = null;
        PageHelper.startPage(pageNo, pageSize);
        //剔除权限高于用户的记录
        String u_permisssion = String.valueOf(session.getAttribute("u_permisssion"));
        List<UserBaseInfo> list = userBaseInfoDao.getRoleList(null, keyword, rName,u_permisssion);

        return new PageInfo<>(list);
    }

    @Override
    public UserBaseInfo getRoleByUuid(Long uUid) {
        return userBaseInfoDao.getRoleList(uUid, null, null, null).get(0);
    }

    @Override
    public int addManager(UserBaseInfo userBaseInfo) {
        List<UserBaseInfo> userBaseInfoList = userBaseInfoDao.selectUserBaseInfoByMobile(userBaseInfo.getuMobile());
        if (userBaseInfoList.size() == 1) {
            //添加管理员发现该用户存在   2.判断用户类型，是普通用户才可以修改，如果已经是管理员则修改失败
            UserBaseInfo info = userBaseInfoList.get(0);
            if (JSONArray.parseArray(info.getuType().toString()).getInteger(2) == 1) {
                throw new BusinessException(ResponseEntity.MANAGER_EXIST);
            }
            Long uUid = info.getuUid();
            userBaseInfo.setuUid(uUid);
            //判断role_map中该用户是否已经存在
            UserRole role = userRoleDao.selectUserRoleByUUID(uUid);
            if (role != null) {
                // 如果存在则更新角色
                userRoleDao.updateRole(uUid, userBaseInfo.getrRid());
                //更新部门表
                //判断工号不能重复
                if (userRoleDao.selectByUuidJobnum(uUid, userBaseInfo.getuJobNumber()) > 0) {
                    //工号重复
                    throw new BusinessException(ResponseEntity.REPEAT_U_JOB_NUMBER);
                }
                //更新
                userRoleDao.updateDepartment(userBaseInfo);
            } else {
                //  否则添加角色
                userBaseInfoDao.insertRoleMap(userBaseInfo);
                if (userRoleDao.selectByUuidJobnum(uUid, userBaseInfo.getuJobNumber()) > 0) {
                    //工号重复
                    throw new BusinessException(ResponseEntity.REPEAT_U_JOB_NUMBER);
                }
                userBaseInfoDao.insertDepartment(userBaseInfo);
            }
        } else {
            userBaseInfo.setuPassword(PasswordUtils.md5(userBaseInfo.getuPassword()));
            userBaseInfoDao.addManager(userBaseInfo);
            if (userRoleDao.selectByUuidJobnum(userBaseInfo.getuUid(), userBaseInfo.getuJobNumber()) > 0) {
                //工号重复
                throw new BusinessException(ResponseEntity.REPEAT_U_JOB_NUMBER);
            }
            userBaseInfoDao.insertRoleMap(userBaseInfo);
            userBaseInfoDao.insertDepartment(userBaseInfo);
        }
        return 1;
    }

    @Override
    public UserRole getRolePermission(String rName) {
        UserRole userRole = userRoleDao.getRolePermissionByRname(rName);
        return userRole;
    }

    @Override
    public int removeManager(Long uUid) {
        return userBaseInfoDao.deleteManager(uUid);
    }

    @Override
    public int disableManager(Long[] uUid) {
        return userBaseInfoDao.disableManager(uUid);
    }

    @Override
    public int enableManager(Long[] uUid) {
        return userBaseInfoDao.enableManager(uUid);
    }

    @Override
    public int updateManager(UserBaseInfo baseInfo) {
        if (baseInfo.getuPassword() != null)
            baseInfo.setuPassword(PasswordUtils.md5(baseInfo.getuPassword()));
        //更新完管理员信息 默认启用该用户
        userBaseInfoDao.enableManager(new Long[]{baseInfo.getuUid()});
        return userBaseInfoDao.updateManager(baseInfo);
    }

    @Override
    public int updateRolePermission(UserRole userRole) {
        int rst = userBaseInfoDao.updateRolePermission(userRole);
        if (rst > 0) {
            AuthenticationInterceptor.authenticationMap.clear();
        }
        return rst;
    }
}
