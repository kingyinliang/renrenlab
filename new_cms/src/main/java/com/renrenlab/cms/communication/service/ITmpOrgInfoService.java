package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.dao.TmpOrgInfoDao;
import com.renrenlab.cms.communication.model.TmpOrgInfo;

/**
 * 用户机构-临时处理
 *
 * Created by lihongxun on 2017/5/18.
 */
public interface ITmpOrgInfoService {

    int updateByUserIdSelective(TmpOrgInfo tmpOrgInfo);

    TmpOrgInfo selectByUserId(Long uId);

    int insert(TmpOrgInfo tmpOrgInfo);

}
