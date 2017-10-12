package com.renrenlab.rlab.controller;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.common.interceptor.Authentication;
import com.renrenlab.rlab.common.interceptor.Permisssion;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.model.UserRole;
import com.renrenlab.rlab.service.UserBaseInfoService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
    @Authentication(permisssion = Permisssion.P0)
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
    @Authentication(permisssion = Permisssion.P0)
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
    @Authentication(permisssion = Permisssion.P1, description = "00000010")
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
    @Authentication(permisssion = Permisssion.P1, description = "00000010")
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

    /**
     * 角色管理列表
     *
     * @param modelMap
     * @param keyword
     * @param rName
     * @return
     */
    @Authentication(permisssion = Permisssion.P0)
    @RequestMapping("role_manage")
    public String roleManage(ModelMap modelMap,
                             HttpSession session,
                             @RequestParam(required = false) String keyword,
                             @RequestParam(required = false) String rName,
                             @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                             @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        PageInfo<UserBaseInfo> users = userBaseInfoService.getRoleList(session, keyword, rName, pageNo, pageSize);
        modelMap.put("users", users);
        modelMap.put("keyword", keyword);
        modelMap.put("rName", rName);
        return "bg/page/admin_list";
    }

    @Authentication(permisssion = Permisssion.P0)
    @RequestMapping("role_add")
    public String roleManage() {
        return "bg/page/admin_to_add";
    }

    @Authentication(permisssion = Permisssion.P1)
    @RequestMapping(value = "role_add", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> addManager(@RequestBody UserBaseInfo userBaseInfo) {
        int result = userBaseInfoService.addManager(userBaseInfo);
        if (result > 0) return ResponseHelper.createSuccessResponse();
        return ResponseHelper.createErrorResponse("管理员添加失败");
    }

    @Authentication(permisssion = Permisssion.P0)
    @RequestMapping("role_detail")
    public String roleDetail(ModelMap modelMap, @RequestParam Long uUid) {
        UserBaseInfo baseInfo = userBaseInfoService.getRoleByUuid(uUid);
        modelMap.put("detail", baseInfo);
        return "bg/page/admin_is_detail";
    }


    @Authentication(permisssion = Permisssion.P0)
    @RequestMapping("get_role_permission")
    @ResponseBody
    public Response getRolePermission(@RequestParam String rName) {
        UserRole userRole = userBaseInfoService.getRolePermission(rName);
        return ResponseHelper.createSuccessResponse(userRole);
    }

    @Authentication(permisssion = Permisssion.P0)
    @RequestMapping("remove_manager")
    @ResponseBody
    public Response removeManager(@RequestParam Long uUid, HttpSession session) {
        checkRemovePermission(session);
        int result = userBaseInfoService.removeManager(uUid);
        if (result > 0) return ResponseHelper.createSuccessResponse();
        return ResponseHelper.createErrorResponse("移除管理员失败");
    }

    @Authentication(permisssion = Permisssion.P2)
    @RequestMapping("disable_manager")
    @ResponseBody
    public Response disableManager(@RequestParam Long[] uUid) {
        int result = userBaseInfoService.disableManager(uUid);
        if (result > 0) return ResponseHelper.createSuccessResponse();
        return ResponseHelper.createErrorResponse("停用管理员失败");
    }

    @RequestMapping("enable_manager")
    @ResponseBody
    public Response enableManager(@RequestParam Long[] uUid) {
        int result = userBaseInfoService.enableManager(uUid);
        if (result > 0) return ResponseHelper.createSuccessResponse();
        return ResponseHelper.createErrorResponse("启用用管理员失败");
    }

    @Authentication(permisssion = Permisssion.P2)
    @RequestMapping(value = "modify_role", method = RequestMethod.POST)
    @ResponseBody
    public Response modifyRole(@RequestBody UserBaseInfo baseInfo) {
        int result = userBaseInfoService.updateManager(baseInfo);
        if (result > 0) return ResponseHelper.createSuccessResponse();
        return ResponseHelper.createErrorResponse("修改管理员信息失败");
    }

    @Authentication(permisssion = Permisssion.P2)
    @RequestMapping(value = "modify_permission", method = RequestMethod.POST)
    @ResponseBody
    public Response modifyPermission(@RequestBody UserRole userRole) {
        int result = userBaseInfoService.updateRolePermission(userRole);
        if (result > 0) return ResponseHelper.createSuccessResponse();
        return ResponseHelper.createErrorResponse("修改角色权限失败");
    }

    @Authentication(permisssion = Permisssion.P2)
    @RequestMapping("rooter_manage")
    public String rooterManage() {
        return "bg/page/admin_is_root";
    }

    private void checkRemovePermission(HttpSession session) {
        char[] permissionArray = new char[0];
        try {
            permissionArray = (char[]) session.getAttribute("u_permisssion_array");
            if (permissionArray.length < 5)
                throw new Exception();
        } catch (Exception e) {
            logger.error("remove_manager接口出错", e);
            return;
        }
        if (permissionArray[4] != '1') {
            throw new BusinessException(ResponseEntity.PERMISSSION_ERROR);
        }
    }
}
