package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.TmpAddrInfo;

/**
 * 用户地址-临时处理
 *
 * Created by lihongxun on 2017/5/18.
 */
public interface ITmpAddrInfoService {

    int updateByUserIdSelective(TmpAddrInfo tmpAddrInfo);

    TmpAddrInfo selectByUserId(Long uId);

    int insert(TmpAddrInfo tmpAddrInfo);

}
