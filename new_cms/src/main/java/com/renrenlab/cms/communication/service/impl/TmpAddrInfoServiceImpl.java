package com.renrenlab.cms.communication.service.impl;

import com.renrenlab.cms.communication.dao.TmpAddrInfoDao;
import com.renrenlab.cms.communication.model.TmpAddrInfo;
import com.renrenlab.cms.communication.service.ITmpAddrInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户地址-临时处理
 *
 * Created by lihongxun on 2017/5/18.
 */
@Service
public class TmpAddrInfoServiceImpl implements ITmpAddrInfoService {

    @Autowired
    private TmpAddrInfoDao tmpAddrInfoDao;

    /**
     * 更新用户地址信息
     *
     * @param tmpAddrInfo
     * @return
     */
    @Override
    public int updateByUserIdSelective(TmpAddrInfo tmpAddrInfo) {
        return tmpAddrInfoDao.updateByUserIdSelective(tmpAddrInfo);
    }

    /**
     * 根据用户Id查询地址信息
     *
     * @param uId
     * @return
     */
    @Override
    public TmpAddrInfo selectByUserId(Long uId) {
        return tmpAddrInfoDao.selectByUserId(uId);
    }

    @Override
    public int insert(TmpAddrInfo tmpAddrInfo) {
        return tmpAddrInfoDao.insert(tmpAddrInfo);
    }
}
