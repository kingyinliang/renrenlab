package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.ManagerInfo;
import com.renrenlab.rlab.model.NewRoleInfo;
import com.renrenlab.rlab.model.UrlPermission;
import com.renrenlab.rlab.service.IPermission;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author guanjipeng
 * @date 2018/3/19
 * 后台权限管理模块
 */
@Controller
@RequestMapping("bg/manager")
public class PermissionController {
    @Autowired
    private IPermission permission;

    /**
     * 获取管理员列表页，可以根据工号，姓名，手机号查询
     *
     * @param session
     * @param keyword
     * @param roleId
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping("list")
    public String getManagerList(Model model, HttpSession session,
                                 @RequestParam(required = false) String keyword,
                                 @RequestParam(required = false) String roleId,
                                 @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                 @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        PageInfo<List<ManagerInfo>> managerInfos = permission.getManagerInfo(keyword, roleId, pageNo, pageSize);
        model.addAttribute("manageInfo", managerInfos);
        //返回所有角色
        List<NewRoleInfo> roleInfos = permission.getAllRoles();
        model.addAttribute("roleInfos", roleInfos);
        model.addAttribute("roleId", roleId);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        return "/bg/page/administrator/admin_list";
    }

    /**
     * 后台管理员添加页面
     *
     * @return
     */
    @RequestMapping("addPage")
    public String addManagerPage(Model model, @RequestParam(required = false) Long uUid) {
        Map<String, List<UrlPermission>> urlPermissions = permission.getAllPermission();
        model.addAttribute("query", urlPermissions.get("query"));
        model.addAttribute("modify", urlPermissions.get("modify"));
        model.addAttribute("audit", urlPermissions.get("audit"));
        model.addAttribute("del", urlPermissions.get("del"));
        //返回库里角色信息
        List<NewRoleInfo> roleInfos = permission.getAllRoles();
        model.addAttribute("roleInfos", roleInfos);
        if (uUid != null) {
            //详情页，返回管理员信息
            ManagerInfo info = permission.getManagerDetail(uUid);
            model.addAttribute("managerInfo", info);
            return "/bg/page/administrator/admin_is_detail";
        }
        return "/bg/page/administrator/admin_to_add";
    }

    /**
     * 根据roleIds 获取权限id
     *
     * @return
     */
    @RequestMapping("getPIds")
    @ResponseBody
    public Response getPIdsByRoleIds(@RequestBody Set<Long> roleIds) {
        return ResponseHelper.createSuccessResponse(permission.getPermissionByRoleIds(roleIds));
    }

    @RequestMapping("detailPage")
    public String detailManagerPage(Model model, @Param("uUid") Long uUid) {
        model.addAttribute("detail", permission.getManagerDetail(uUid));
        return "/bg/page/administrator/admin_is_detail";
    }

    /**
     * 添加管理员接口
     *
     * @param managerInfo
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Response addManager(@RequestBody ManagerInfo managerInfo) {
        if (permission.addManager(managerInfo)) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("添加管理员失败");
    }

    /**
     * 修改管理员信息
     *
     * @param managerInfo
     * @return
     */
    @RequestMapping(value = "modifyManager", method = RequestMethod.POST)
    @ResponseBody
    public Response modifyManager(@RequestBody ManagerInfo managerInfo) {
        if (permission.modifyManager(managerInfo)) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("修改管理员信息失败");
    }

    /**
     * 删除管理员
     *
     * @return
     */
    @RequestMapping(value = "delManager", method = RequestMethod.POST)
    @ResponseBody
    public Response delManager(@RequestBody Long uUid) {
        if (permission.delManager(uUid)) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("移除管理员失败");
    }

    /**
     * 权限管理页面,添加角色
     */
    @RequestMapping(value = "managementPage")
    public String getManagementPage(Model model) {
        //查询库中所有权限
        Map<String, List<UrlPermission>> urlPermissions = permission.getAllPermission();
        model.addAttribute("query", urlPermissions.get("query"));
        model.addAttribute("modify", urlPermissions.get("modify"));
        model.addAttribute("audit", urlPermissions.get("audit"));
        model.addAttribute("del", urlPermissions.get("del"));
        List<NewRoleInfo> roleInfos = permission.getAllRoles();
        model.addAttribute("roleInfos", roleInfos);
        return "/bg/page/administrator/admin_is_root";
    }

    /**
     * 添加角色
     *
     * @return
     */
    @RequestMapping(value = "addRole", method = RequestMethod.POST)
    @ResponseBody
    public Response addRole(@RequestBody NewRoleInfo roleInfo) {
        if (permission.addRole(roleInfo)) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("添加角色失败");
    }

    /**
     * 删除角色
     *
     * @return
     */
    @RequestMapping(value = "delRole", method = RequestMethod.POST)
    @ResponseBody
    public Response delRole(@RequestBody NewRoleInfo roleInfo) {
        if (permission.delRole(roleInfo.getRoleId())) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("删除角色失败");
    }


    /**
     * 修改角色权限
     *
     * @param roleId        角色id
     * @param permissionIds 权限id
     * @return
     */
    @RequestMapping(value = "modifyRolePermission", method = RequestMethod.POST)
    @ResponseBody
    public Response modifyRolePermission(@RequestBody NewRoleInfo roleInfo) {
        return ResponseHelper.createSuccessResponse(permission.modifyRolePermission(roleInfo.getRoleId(), roleInfo.getPermissionIds()));
    }
}
