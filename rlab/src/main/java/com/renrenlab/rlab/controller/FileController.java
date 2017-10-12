package com.renrenlab.rlab.controller;

import com.alibaba.fastjson.JSONObject;
import com.renrenlab.rlab.common.interceptor.Authentication;
import com.renrenlab.rlab.common.interceptor.Permisssion;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.JsonMapper;
import com.renrenlab.rlab.service.FileService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wanshou on 2017/5/22.
 */
@Controller
@RequestMapping("/bg/file")
public class FileController {

    @Autowired
    private FileService fileService;

    @Authentication(permisssion = Permisssion.P1, description = "00000010")
    @RequestMapping(value = "/upload/{type}", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> uploadImage(
            @PathVariable String type,
            @RequestParam("file") MultipartFile file) throws Exception {
        String url = "";
        if(!StringUtils.isBlank(type)){
            url = fileService.uploadImage(file, type);
        }
        return ResponseHelper.createSuccessResponse(url);
    }

    @Authentication(permisssion = Permisssion.P1, description = "00000010")
    @RequestMapping(value = "/upload/richText", method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String uploadImageForRichText(@RequestParam("file") MultipartFile file) throws Exception {
        String url = fileService.uploadImage(file, "other");
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "人人实验");
        Map<String, Object> pic = new HashMap<>();
        pic.put("src", url);
        pic.put("title", "人人实验");
        result.put("data", pic);
        //  String jsonString = JsonMapper.getJsonString(result);
        return JSONObject.toJSONString(result);
    }

}
