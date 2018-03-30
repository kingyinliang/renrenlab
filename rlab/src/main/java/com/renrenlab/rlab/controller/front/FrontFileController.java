package com.renrenlab.rlab.controller.front;

import com.alibaba.fastjson.JSONObject;
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
@RequestMapping("/front/file")
public class FrontFileController {

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/ie/upload/{type}", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String ieUploadImage(
            @PathVariable String type,
            @RequestParam("file") MultipartFile file) throws Exception {
        String url = "";
        if (!StringUtils.isBlank(type)) {
            url = fileService.uploadImage(file, type);
        }
        long size = file.getSize();
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("payload", url);
        result.put("description", "请求成功");
        result.put("size", size);
        String jsonString = JsonMapper.getJsonString(result);
        return jsonString;
    }


    @RequestMapping(value = "/upload/richText", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
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
    //// 下载文件
    //@RequestMapping(value = "/ie/download")
    ////@ResponseBody
    //public ResponseEntity<byte[]> downloadFile(String key) throws OSSException, ClientException {
    //    String bucket = "renrenlab";
    //    OSSClient ossClient = new OSSClient("http://oss-cn-shanghai.aliyuncs.com", "LTAIDEc0xPsAmL8X", "kfWbAeTgMjvkf1OCJDKjHZFRiHCpOY");
    //    OSSObject object = ossClient.getObject(bucket, "image/2017/08/28/8f5a5fc1-bd8f-4249-bd18-998f34b7a4b5.jpg");
    //    InputStream objectContent = object.getObjectContent();
    //    ossClient.shutdown();
    //    return object;
    //}

}
