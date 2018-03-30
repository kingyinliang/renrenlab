package com.renrenlab.rlab.common.ueditor.qikemi.packages.baidu.ueditor.upload;

import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.model.PutObjectResult;
import com.renrenlab.rlab.common.ueditor.qikemi.packages.alibaba.aliyun.oss.ObjectService;
import com.renrenlab.rlab.common.ueditor.qikemi.packages.alibaba.aliyun.oss.properties.OSSClientProperties;
import com.renrenlab.rlab.common.ueditor.qikemi.packages.utils.SystemUtil;
import org.apache.log4j.Logger;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * 同步上传文件到阿里云OSS<br>
 *
 * @author XieXianbin me@xiexianbin.cn
 */
public class SynUploader extends Thread {

    private static Logger logger = Logger.getLogger(SynUploader.class);

    public boolean upload(JSONObject stateJson, OSSClient client,
                          HttpServletRequest request) {
//		Bucket bucket = BucketService.create(client,
//				OSSClientProperties.bucketName);
        // get the key, which the upload file path

        try {
            String key = stateJson.getString("url").replaceFirst("/", "");
            FileInputStream fileInputStream = new FileInputStream(new File(
                    SystemUtil.getProjectRootPath() + key));
            PutObjectResult result = ObjectService.putObject(client,
                    OSSClientProperties.bucketName, key, fileInputStream);
            logger.debug("upload file to aliyun OSS object server success. ETag: "
                    + result.getETag());
            return true;
        } catch (FileNotFoundException e) {
            logger.error("upload file to aliyun OSS object server occur FileNotFoundException.");
        } catch (NumberFormatException e) {
            logger.error("upload file to aliyun OSS object server occur NumberFormatException.");
        } catch (Exception e) {
            logger.error("upload file to aliyun OSS object server occur IOException.");
        }
        return false;
    }

}
