package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.JsonMapper;
import com.renrenlab.rlab.model.CommonBanner;
import com.renrenlab.rlab.service.InterfaceService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

/**
 * 后台界面管理Controller
 */
@Controller
@RequestMapping("/bg/interface")
public class BgInterfaceManageController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private InterfaceService interfaceService;

    /**
     * 查询轮播列表
     * @param model
     * @param position 0 咨讯 1 首页
     * @return
     */
    @RequestMapping(value = "/banner/search", method = RequestMethod.GET)
    public String toBannerList(Model model,
                               @RequestParam(required = false,defaultValue ="0") Integer position){
        List<CommonBanner> bannerList= interfaceService.searchBannerList(position);
        try {
            String jsonString = JsonMapper.getJsonString(bannerList);
            System.out.println(jsonString);
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("bannerList",bannerList);
        model.addAttribute("position",position);
        return "/bg/page/banner_manage";
    }

    /**
     * 新增轮播图
     * @param banner
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/banner/add",method = RequestMethod.POST)
    public Response addBanner(@RequestBody CommonBanner banner){
        if(banner==null|| StringUtils.isBlank(banner.getbPic())){
            return ResponseHelper.createErrorResponse("请上传图片");
        }
        int result = interfaceService.addBanner(banner);
        if(result>0){
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("添加轮播图失败");
    }

    /**
     * 编辑轮播图/删除/停用
     * @param banner
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/banner/update",method = RequestMethod.POST)
    public Response updateBanner(@RequestBody CommonBanner banner){
        if(banner==null|| StringUtils.isBlank(banner.getbPic())){
            return ResponseHelper.createErrorResponse("请上传图片");
        }
        int result = interfaceService.updateBanner(banner);
        if(result>0){
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("编辑轮播图失败");
    }

    /**
     * 删除/停用/启用
     * @param banner
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/banner/edit",method = RequestMethod.POST)
    public Response editBanner(@RequestBody CommonBanner banner){
        int result = interfaceService.updateBanner(banner);
        if(result>0){
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("操作轮播图失败");
    }
    /**
     * 编辑轮播图数据回显
     * @param bid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/banner/toUpdate",method = RequestMethod.POST)
    public Response toUpdateBanner(Long bid){
        CommonBanner banner = interfaceService.searchBanner(bid);
        return ResponseHelper.createSuccessResponse(banner);
    }


    /**
     * 排序轮播图
     * @param banners
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/banner/sort",method = RequestMethod.POST)
    public Response sortBanner(@RequestBody List<CommonBanner> banners){
        int result = interfaceService.sortBanner(banners);
        if(result>0){
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("添加轮播图失败");
    }




}
