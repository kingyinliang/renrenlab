package com.renrenlab.rlab.service.impl;

import com.aliyun.oss.OSSClient;
import com.google.common.io.ByteSource;
import com.google.common.io.Files;
import com.renrenlab.rlab.service.FileService;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;

/**
 * Created by wanshou on 2017/5/22.
 * 文件管理
 */
@Service
@Transactional
public class FileServiceImpl implements FileService {

    /**
     * 上传仪器图片
     *
     * @param file
     * @return
     * @throws IOException
     */
    @Override
    public String uploadImage(MultipartFile file, String type) throws IOException {
        String diskUrl = "";
        String ossUrl = "";
        String bucket = "renrenlab";
        if("image".equals(type)){
            diskUrl = "/home/elab/repository/image/";
            ossUrl = "image/";
        }else if("orgimage".equals(type)){
            diskUrl = "/home/elab/repository/orgimage/";
            ossUrl = "orgimage/";
        }else if("identity".equals(type)){
            diskUrl = "/home/elab/repository/identity/";
            ossUrl = "identity/";
        }else if("avatar".equals(type)){
            diskUrl = "/home/elab/repository/avatar/";
            ossUrl = "avatar/";
        }else if("other".equals(type)){
            diskUrl = "/home/elab/repository/other/";
            ossUrl = "other/";
        }
        //1.生成图片名
        String saveName = getFileName(file, true);
        saveName = saveName.replaceAll("\\\\", "/");
        //保存文件到磁盘
        saveFile(file, new File(diskUrl, saveName));
        //上传文件到阿里云
        OSSClient ossClient = new OSSClient("http://oss-cn-shanghai.aliyuncs.com", "LTAIDEc0xPsAmL8X", "kfWbAeTgMjvkf1OCJDKjHZFRiHCpOY");
        ossClient.putObject(bucket, ossUrl + saveName, new File(diskUrl + saveName));
        ossClient.shutdown();
        return "http://"+bucket+".oss-cn-shanghai.aliyuncs.com/"+ossUrl +saveName;
    }


    /**
     * 保存文件到磁盘
     *
     * @param multipartFile
     * @param target
     * @throws IOException
     */
    private static final void saveFile(MultipartFile multipartFile, File target) throws IOException {
        if (target.getParentFile() != null && !target.getParentFile().exists()) {
            target.getParentFile().mkdirs();
        }
        final InputStream is = multipartFile.getInputStream();
        try {
            Files.copy(new ByteSource() {
                @Override
                public InputStream openStream() throws IOException {
                    return is;
                }
            }, target);
        } finally {
            is.close();
            System.out.println("save file: " + target.getAbsolutePath());
        }
    }

    /**
     * 获取上传后保存的文件名
     *
     * @param file       MultipartFile，要上传的文件
     * @param isUUIDName 是否动态生成唯一的名字
     * @return
     */
    private static final String getFileName(MultipartFile file, boolean isUUIDName) {
        String currentTime = DateFormatUtils.format(new Date(), "yyyy/MM/dd");
        String fileName = file.getOriginalFilename();
        if (isUUIDName) {
            int lastPoint = fileName.lastIndexOf(".");
            String suffix = lastPoint == -1 ? "" : fileName.substring(lastPoint);
            fileName = UUID.randomUUID().toString() + suffix;
        }
        return currentTime + File.separator + fileName;
    }
}
