package com.renrenlab.rlab.controller.front;

/**
 * Created by Administrator on 2017/8/25.
 */

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.UserUploadTmp;
import com.renrenlab.rlab.service.UploadTmpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Created by guanjipeng on 2017/7/18.
 */
@Controller
@RequestMapping(value = "/front/uploadTmp")
public class FrontUploadManageController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UploadTmpService uploadTmpService;

    /**
     * 根据用户ID查询上传记录
     *
     * @param model
     * @param session
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model model,
                         HttpSession session,
                         @RequestParam(required = false) Integer pageNo,
                         @RequestParam(required = false) Integer pageSize
    ) {
        PageInfo<UserUploadTmp> pageInfo = null;
        try {
            if (pageNo == null) pageNo = 1;
            if (pageSize == null) pageSize = 10;
            Long userId = (Long) session.getAttribute("uid");
            pageInfo = uploadTmpService.search(pageNo, pageSize, userId);
            model.addAttribute("list", pageInfo.getList());
            model.addAttribute("total", pageInfo.getTotal());
            model.addAttribute("pages", pageInfo.getPages());
            model.addAttribute("pageNo", pageNo);
            model.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return "/front/org/org_upload";
    }

    /**
     * @param model
     * @param session
     * @param userUploadTmp
     * @return
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> uploadIns(Model model,
                                 HttpSession session,
                                 @RequestBody UserUploadTmp userUploadTmp
    ) {
        Long userId = (Long) session.getAttribute("uid");
        if (userUploadTmp == null || userId == null) {
            throw new RuntimeException("上传仪器数据失败");
        }
        userUploadTmp.setuUid(userId);
        uploadTmpService.upload(userUploadTmp);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 根据文件id
     *
     * @param model
     * @param userUploadTmp
     * @return
     */
    @RequestMapping(value = "/modify", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> modify(Model model, HttpSession session, @RequestBody UserUploadTmp userUploadTmp) {
        uploadTmpService.update(userUploadTmp);
        return ResponseHelper.createSuccessResponse();
    }

}
