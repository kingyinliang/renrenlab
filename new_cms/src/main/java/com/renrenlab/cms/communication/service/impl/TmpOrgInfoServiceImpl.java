package com.renrenlab.cms.communication.service.impl;

import com.renrenlab.cms.communication.dao.TmpOrgInfoDao;
import com.renrenlab.cms.communication.model.TmpOrgInfo;
import com.renrenlab.cms.communication.service.ITmpOrgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户机构-临时处理
 *
 * Created by lihongxun on 2017/5/18.
 */
@Service
public class TmpOrgInfoServiceImpl implements ITmpOrgInfoService {

    @Autowired
    private TmpOrgInfoDao tmpOrgInfoDao;

    /**
     * 更新用户机构信息
     *
     * @param tmpOrgInfo
     * @return
     */
    @Override
    public int updateByUserIdSelective(TmpOrgInfo tmpOrgInfo) {
        return tmpOrgInfoDao.updateByUserIdSelective(tmpOrgInfo);
    }

    /**
     * 根据用户Id查询机构信息
     *
     * @param uId
     * @return
     */
    @Override
    public TmpOrgInfo selectByUserId(Long uId) {
        return tmpOrgInfoDao.selectByUserId(uId);
    }

    @Override
    public int insert(TmpOrgInfo tmpOrgInfo) {
        return tmpOrgInfoDao.insert(tmpOrgInfo);
    }
}
