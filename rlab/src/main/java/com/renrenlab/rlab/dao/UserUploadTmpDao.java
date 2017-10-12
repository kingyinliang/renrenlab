package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.UserUploadTmp;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
@Repository
public interface UserUploadTmpDao {

    /**
     * 分页查询信息
     * @param keyword
     * @param order
     * @param beginTime
     * @param endTime
     * @return
     */
    List<UserUploadTmp> searchUserUploadTmpList(@Param("keyword") String keyword, @Param("order") String order, @Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 分页查询信息
     * @param uid
     * @return
     */
    List<UserUploadTmp> searchUserUploadTmpListByUid(@Param("uid") Long uid);

    /**
     * 查询详情信息
     * @param uploadId
     * @return
     */
    UserUploadTmp searchUserUploadTmpByUploadId(@Param("uploadId") Long uploadId);

    /**
     * 用户上传仪器信息
     * @param userUploadTmp
     * @return
     */
    int insertUserUploadTmp(UserUploadTmp userUploadTmp);

    /**
     * 更新用户上传仪器信息
     * @param userUploadTmp
     * @return
     */
    int updateUserUploadTmp(UserUploadTmp userUploadTmp);

}
