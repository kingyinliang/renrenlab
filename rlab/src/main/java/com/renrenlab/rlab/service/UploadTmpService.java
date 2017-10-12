package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.UserUploadTmp;

/**
 * Created by guanjipeng on 2017/7/18.
 */
public interface UploadTmpService {

    /**
     * 检索服务商上传的文件.
     *
     * @param keyword   机构名称或者手机号
     * @param pageNo
     * @param pageSize
     * @param beginTime 起始时间
     * @param endTime   结束时间
     * @return
     */
    PageInfo<UserUploadTmp> search(String keyword, String order, Integer pageNo, Integer pageSize, String beginTime, String endTime);

    /**
     * 根据用户ID查询用户上传临时表
     * @param pageNo
     * @param pageSize
     * @param userId
     * @return
     */
    PageInfo<UserUploadTmp> search(Integer pageNo, Integer pageSize, Long userId);

    /**
     * 根据文件uploadId查询上传文件记录详情
     *
     * @param uploadId
     * @return
     */
    UserUploadTmp searchDetail(Long uploadId);

    /**
     * 修改上传文件状态
     *
     * @param userUploadTmp
     * @return
     */
    void update(UserUploadTmp userUploadTmp);

    /**
     * 上传文档
     * @param userUploadTmp
     * @return
     */
    void upload(UserUploadTmp userUploadTmp);
}
