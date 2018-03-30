package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.UserUploadTmp;
import com.renrenlab.rlab.service.UploadTmpService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by guanjipeng on 2017/7/18.
 */
@Controller
@RequestMapping(value = "/bg/uploadTmp")
public class UploadManageController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UploadTmpService uploadTmpService;

    /**
     * 服务商管理
     *
     * @param keyword   查询关键字 ，机构名称或者手机号
     * @param pageNo
     * @param pageSize
     * @param beginTime 起始时间
     * @param endTime   结束时间
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model model,
                         @RequestParam(required = false) String keyword,
                         @RequestParam(required = false) Integer pageNo,
                         @RequestParam(required = false) Integer pageSize,
                         @RequestParam(required = false) String order,
                         @RequestParam(required = false) String beginTime,
                         @RequestParam(required = false) String endTime) {
        PageInfo<UserUploadTmp> pageInfo = null;
        try {
            if (StringUtils.isBlank(keyword)) {
                keyword = null;
            } else {
                keyword = keyword.trim();
            }
            if (StringUtils.isBlank(order)) {
                order = "DESC";
            }
            if (StringUtils.isBlank(beginTime) && StringUtils.isBlank(endTime)) {
                beginTime = null;
                endTime = null;
            }
            if (pageNo == null) pageNo = 1;
            if (pageSize == null) pageSize = 10;

            pageInfo = uploadTmpService.search(keyword, order, pageNo, pageSize, beginTime, endTime);
            if (beginTime == null) beginTime = "2016-01-01";
            if (endTime == null) endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            model.addAttribute("list", pageInfo.getList());
            model.addAttribute("total", pageInfo.getTotal());
            model.addAttribute("pages", pageInfo.getPages());
            model.addAttribute("pageNo", pageNo);
            model.addAttribute("pageSize", pageSize);
            model.addAttribute("keyword", keyword);
            model.addAttribute("order", order);
            model.addAttribute("beginTime", beginTime);
            model.addAttribute("endTime", endTime);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return "/bg/page/facilitatorManage";
    }

    /**
     * 根据文件id 查询详情
     *
     * @param model
     * @param uploadId
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String searchDetail(Model model, @RequestParam Long uploadId) {
        try {
            UserUploadTmp userUploadTmp = uploadTmpService.searchDetail(uploadId);
            model.addAttribute(userUploadTmp);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return "/bg/page/uploadTmp";
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
    public Response<?> modify(Model model, @RequestBody UserUploadTmp userUploadTmp) {
        uploadTmpService.update(userUploadTmp);
        return ResponseHelper.createSuccessResponse();
    }

}
