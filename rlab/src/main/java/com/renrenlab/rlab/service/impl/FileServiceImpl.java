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

    private static String bucket = "renrenlab";

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
            System.out.println("save multiFile: " + target.getAbsolutePath());
        }
    }

    /**
     * 上传仪器图片
     *
     * @param multiFile
     * @return
     * @throws IOException
     */
    @Override
    public String uploadImage(MultipartFile multiFile, String type) throws IOException {
        String diskUrl = "/tmp/elab/repository/";
        String ossUrl = "";
        switch (type) {
            case "image":
                ossUrl = "image/";
                break;
            case "orgimage":
                ossUrl = "orgimage/";
                break;
            case "identity":
                ossUrl = "identity/";
                break;
            case "avatar":
                ossUrl = "avatar/";
                break;
            case "other":
                ossUrl = "other/";
                break;
            default:
                ossUrl = "other/";
                break;
        }
        diskUrl += ossUrl;
        //1.生成图片名
        String saveName = getFileName(multiFile, true);
        saveName = saveName.replaceAll("\\\\", "/");
        //保存文件到磁盘
        File file = new File(diskUrl, saveName);
        saveFile(multiFile, file);
        //上传文件到阿里云
        return saveToOSS(ossUrl + saveName, file);
    }

    public String saveToOSS(String saveName, File file) {
        OSSClient ossClient = new OSSClient("http://oss-cn-shanghai.aliyuncs.com",
                "LTAIDEc0xPsAmL8X", "kfWbAeTgMjvkf1OCJDKjHZFRiHCpOY");
        ossClient.putObject(bucket, saveName, file);
        ossClient.shutdown();
        return "http://" + bucket + ".oss-cn-shanghai.aliyuncs.com/" + saveName;
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
