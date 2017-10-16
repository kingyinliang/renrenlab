package com.renrenlab.cms.communication.controller;

import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.communication.model.TmpAddrInfo;
import com.renrenlab.cms.communication.model.TmpOrgInfo;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.service.ITmpAddrInfoService;
import com.renrenlab.cms.communication.service.ITmpOrgInfoService;
import com.renrenlab.cms.communication.service.IUserBaseInfoService;
import com.renrenlab.cms.communication.vo.UserBriefInfo;
import com.renrenlab.cms.communication.vo.params.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * 用户信息相关操作
 *
 * Created by lihongxun on 2017/5/15.
 */
@Controller
@RequestMapping("/bg/api/user")
public class UserController {

    static final Logger _LOG = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private IUserBaseInfoService userBaseInfoService;
    @Autowired
    private ITmpAddrInfoService tmpAddrInfoService;
    @Autowired
    private ITmpOrgInfoService tmpOrgInfoService;

    /**
     * 根据用户Id更新用户信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> update(@RequestBody UserInfo user) {
        try {
            _LOG.info("invoke----------/bg/api/user/update");
            if (user.getuDetailAddress() != null) {
                // 更新用户基本信息
                UserBaseInfo uUser = new UserBaseInfo();
                uUser.setuUid(Long.parseLong(user.getuId()));
                uUser.setuName(user.getuName());
                uUser.setuMobile(user.getuPhone());
                userBaseInfoService.updateByUserIdSelective(uUser);

                // 插入或更新用户地址信息
                TmpAddrInfo tmpAddrInfo = new TmpAddrInfo();
                tmpAddrInfo.setuUid(Long.parseLong(user.getuId()));
                tmpAddrInfo.setuAddress(user.getuDetailAddress());
                if (null == tmpAddrInfoService.selectByUserId(uUser.getuUid())) {
                    tmpAddrInfoService.insert(tmpAddrInfo);
                } else {
                    tmpAddrInfo.setModifyTime(new Date());
                    tmpAddrInfoService.updateByUserIdSelective(tmpAddrInfo);
                }


                // 更新用户机构信息
                TmpOrgInfo tmpOrgInfo = new TmpOrgInfo();
                tmpOrgInfo.setuUid(Long.parseLong(user.getuId()));
                tmpOrgInfo.setuOrg(user.getuOrgName());
                if (null == tmpOrgInfoService.selectByUserId(uUser.getuUid())) {
                    tmpOrgInfoService.insert(tmpOrgInfo);
                } else {
                    tmpOrgInfo.setModifyTime(new Date());
                    tmpOrgInfoService.updateByUserIdSelective(tmpOrgInfo);
                }
            }

        } catch (Exception e) {
            _LOG.error("exception:", e);
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 根据用户Id获取用户信息
     *
     * @param uId
     * @return
     */
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getUserInfo(@RequestParam Long uId) {
        // 用户基本信息
        UserBaseInfo userBaseInfo;
        // 用户地址-临时处理
        TmpAddrInfo tmpAddrInfo;
        // 用户机构-临时处理
        TmpOrgInfo tmpOrgInfo;
        UserBriefInfo uBrief = null;
        try {
            _LOG.info("invoke----------/bg/api/user/info");

            // 用户基本信息
            userBaseInfo = userBaseInfoService.selectByUserId(uId);
            uBrief = new UserBriefInfo();
            uBrief.setuId(userBaseInfo.getuUid());
            uBrief.setuName(userBaseInfo.getuName());
            uBrief.setuNickName(userBaseInfo.getuNickname());
            uBrief.setuAvatar(userBaseInfo.getuAvatar());
            uBrief.setuPhone(userBaseInfo.getuMobile());

            // 用户地址-临时处理
            tmpAddrInfo = tmpAddrInfoService.selectByUserId(uId);
            if(null != tmpAddrInfo)
                uBrief.setuDetailAddress(tmpAddrInfo.getuAddress());

            // 用户机构-临时处理
            tmpOrgInfo = tmpOrgInfoService.selectByUserId(uId);
            if(null != tmpOrgInfo)
                uBrief.setuOrgName(tmpOrgInfo.getuOrg());
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }
        return ResponseHelper.createSuccessResponse(uBrief);
    }

}
