package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.service.UserBaseInfoService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/21.
 */
@Controller
@RequestMapping("/bg/user")
public class UserController {

    @Autowired
    private UserBaseInfoService userBaseInfoService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 获取用户认证信息
     *
     * @param model
     * @param uuid  用户ID
     * @return 用户认证信息页
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getUserDetail(Model model, @RequestParam Long uuid) {
        UserBaseInfo userBaseInfo = null;
        try {
            userBaseInfo = userBaseInfoService.searchUserBaseInfo(uuid);
            if (userBaseInfo.getIdentifyPic1() == null) {
                userBaseInfo.setIdentifyPic1("");
            } else {
                if (!userBaseInfo.getIdentifyPic1().startsWith("http")) {
                    userBaseInfo.setIdentifyPic1(Constant.IDENIMG + userBaseInfo.getIdentifyPic1());
                }
            }
            if (userBaseInfo.getIdentifyPic2() == null) {
                userBaseInfo.setIdentifyPic2("");
            } else {
                if (!userBaseInfo.getIdentifyPic2().startsWith("http")) {
                    userBaseInfo.setIdentifyPic2(Constant.IDENIMG + userBaseInfo.getIdentifyPic2());
                }
            }
            if (userBaseInfo.getIdentifyPic3() == null) {
                userBaseInfo.setIdentifyPic3("");
            } else {
                if (!userBaseInfo.getIdentifyPic3().startsWith("http")) {
                    userBaseInfo.setIdentifyPic3(Constant.IDENIMG + userBaseInfo.getIdentifyPic3());
                }
            }
            if (userBaseInfo.getuAvatar() == null) {
                userBaseInfo.setuAvatar("");
            } else {
                if (!userBaseInfo.getuAvatar().startsWith("http")) {
                    userBaseInfo.setuAvatar(Constant.IDENIMG + userBaseInfo.getuAvatar());
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        model.addAttribute("userBaseInfo", userBaseInfo);
        return "/bg/page/userDetails";
    }

    /**
     * 分页查询用户列表
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
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getUserList(Model model,
                              @RequestParam Integer pageNo,
                              @RequestParam Integer pageSize,
                              @RequestParam(required = false) String keyword,
                              @RequestParam(required = false) String order,
                              @RequestParam(required = false) String type,
                              @RequestParam(required = false) Integer source,
                              @RequestParam(required = false) String beginTime,
                              @RequestParam(required = false) String endTime) {
        PageInfo<UserBaseInfo> pageInfo = null;
        try {
            if (StringUtils.isBlank(keyword)) {
                keyword = null;
            } else {
                keyword = keyword.trim();
            }
            if (StringUtils.isBlank(type) || "99".equals(type)) {
                type = null;
            }
            if (source == null || 99 == source) {
                source = null;
            }
            if (StringUtils.isBlank(order)) {
                order = "DESC";
            }
            if (StringUtils.isBlank(beginTime) && StringUtils.isBlank(endTime)) {
//                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//                Calendar calendar = Calendar.getInstance();
//                calendar.set(Calendar.DATE, calendar.get(Calendar.DATE)-7);
//                String begin = format.format(calendar.getTime());
//                String end = format.format(new Date());
                beginTime = null;
                endTime = null;
            }
            pageInfo = userBaseInfoService.searchUserList(pageNo, pageSize, keyword, order, type, source, beginTime, endTime);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        if (beginTime == null) beginTime = "2016-01-01";
        if (endTime == null) endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        model.addAttribute("list", pageInfo.getList());
        model.addAttribute("total", pageInfo.getTotal());
        model.addAttribute("pages", pageInfo.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("keyword", keyword);
        model.addAttribute("order", order);
        model.addAttribute("type", type == null ? "99" : type);
        model.addAttribute("source", source == null ? "99" : source);
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        return "/bg/page/userManage";
    }

    /**
     * 修改用户状态
     *
     * @param state
     * @return
     */
    @RequestMapping(value = "/modify", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> modifyUserState(@RequestParam Integer state, @RequestParam Long uuid) {
        try {
            userBaseInfoService.modifyUserState(state, uuid);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 修改用户状态
     *
     * @param mobile
     * @return
     */
    @RequestMapping(value = "/find", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> modifyUserState(@RequestParam String mobile) {
        UserBaseInfo userBaseInfo = null;
        try {
            userBaseInfo = userBaseInfoService.searchUserBaseInfoByMobile(mobile);
        } catch (Exception e) {
            throw new BusinessException(ResponseEntity.USER_NOT_FOUND_ERROR);
        }
        return ResponseHelper.createSuccessResponse(userBaseInfo);
    }
}
