package com.renrenlab.rlab.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by wanshou on 2017/5/22.
 * 文件管理
 */
public interface FileService {

    String uploadImage(MultipartFile file, String type) throws IOException;

}
