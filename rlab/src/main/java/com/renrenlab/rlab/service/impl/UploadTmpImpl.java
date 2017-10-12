package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.dao.UserBaseInfoDao;
import com.renrenlab.rlab.dao.UserUploadTmpDao;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.model.UserUploadTmp;
import com.renrenlab.rlab.service.UploadTmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by guanjipeng on 2017/7/18.
 */
@Service
@Transactional
public class UploadTmpImpl implements UploadTmpService {

    @Autowired
    private UserUploadTmpDao userUploadTmpDao;

    @Autowired
    private UserBaseInfoDao userBaseInfoDao;


    @Override
    public PageInfo<UserUploadTmp> search(String keyword, String order, Integer pageNo, Integer pageSize, String beginTime, String endTime) {
        PageHelper.startPage(pageNo, pageSize);
        List<UserUploadTmp> userUploadTmpList = userUploadTmpDao.searchUserUploadTmpList(keyword, order, beginTime, endTime);
        for (UserUploadTmp userUploadTmp : userUploadTmpList){
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            userUploadTmp.setCreateTimeStr(format.format(userUploadTmp.getCreateTime()));
        }
        return new PageInfo<>(userUploadTmpList);
    }

    @Override
    public PageInfo<UserUploadTmp> search(Integer pageNo, Integer pageSize, Long userId) {
        if(userId == null || pageNo == null || pageSize == null)return null;
        PageHelper.startPage(pageNo, pageSize);
        List<UserUploadTmp> userUploadTmpList = userUploadTmpDao.searchUserUploadTmpListByUid(userId);
        for (UserUploadTmp userUploadTmp : userUploadTmpList){
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            userUploadTmp.setCreateTimeStr(format.format(userUploadTmp.getCreateTime()));
        }
        return new PageInfo<>(userUploadTmpList);
    }

    @Override
    public UserUploadTmp searchDetail(Long uploadId) {
        return null;
    }

    @Override
    public void upload(UserUploadTmp userUploadTmp) {
        int num = 0;
        if(userUploadTmp != null){
            UserBaseInfo userBaseInfo = userBaseInfoDao.selectUserBaseInfoByUUid(userUploadTmp.getuUid());
            if(userBaseInfo != null){
                userUploadTmp.setuMobile(userBaseInfo.getuMobile());
                for(int i = 0; i < userUploadTmp.getFileUrls().size(); i++){
                    userUploadTmp.setFileUrl(userUploadTmp.getFileUrls().get(i));
                    num += userUploadTmpDao.insertUserUploadTmp(userUploadTmp);
                }
            }
        }
        if(num == 0){
            throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
        }
    }

    @Override
    public void update(UserUploadTmp userUploadTmp) {
        if(userUploadTmp != null){
            int num = userUploadTmpDao.updateUserUploadTmp(userUploadTmp);
            if(num != 1){
                throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
            }
        }
    }
}
