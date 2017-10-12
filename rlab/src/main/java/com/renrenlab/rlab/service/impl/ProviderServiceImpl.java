package com.renrenlab.rlab.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.dao.OrgDao;
import com.renrenlab.rlab.dao.OrgManagerDao;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.service.ProviderService;
import com.renrenlab.rlab.vo.OrgManager;
import com.renrenlab.rlab.vo.ProviderInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 服务商Serice实现类
 * Created by guowanting on 2017/9/20.
 */
@Service
public class ProviderServiceImpl implements ProviderService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrgDao orgDao;

    @Autowired
    private OrgManagerDao orgManagerDao;

    /**
     * 认证服务商列表页
     * @param orgName
     * @param rankLow
     * @param rankHigh
     * @param bizName
     * @param isCommon
     * @param orgSource
     * @param state
     * @param startTime
     * @param uId
     * @param pageNo
     * @param pageSize
     * @param order        @return
     * */
    @Override
    public PageInfo<ProviderInfo> searchAuthProviderList(String orgName, Integer rankLow, Integer rankHigh, String bizName, Integer isCommon, Integer orgSource, Integer state, String startTime, Long uId, Integer pageNo, Integer pageSize, String order) {

        PageHelper.startPage(pageNo, pageSize);
        List<ProviderInfo> providerAuthInfoList = null;

        providerAuthInfoList= orgDao.searchAuthInfoList(orgName,rankLow,rankHigh,bizName,isCommon,orgSource,state,startTime,uId,order);
        for (ProviderInfo providerInfo : providerAuthInfoList) {
            //查询机构创建者
          OrgManager orgManager = orgManagerDao.searchOrgCreatorByOrgId(providerInfo.getOrgOid());
          if(orgManager!=null && orgManager.getuMobile() !=null){
              providerInfo.setContact(orgManager.getuMobile());
          }
        }

        return new PageInfo<ProviderInfo>(providerAuthInfoList);
    }

    /**
     * 服务商未认证列表
     * @param orgName
     * @param bizName
     * @param isCommon
     *@param orgSource
     * @param orgIdentifications
     * @param startTime
     * @param uId
     * @param pageNo
     * @param pageSize
     * @param order        @return
     */
    @Override
    public PageInfo<ProviderInfo> searchNotAuthProviderList(String orgName, String bizName, Integer isCommon, Integer orgSource, List<Integer> orgIdentifications, String startTime, Long uId, Integer pageNo, Integer pageSize, String order) {
        PageHelper.startPage(pageNo, pageSize);
        List<ProviderInfo> providerNotAuthInfoList = null;
        providerNotAuthInfoList = orgDao.searchNotAuthInfoList(orgName,bizName,isCommon,orgSource,orgIdentifications,startTime,uId,order);
        return new PageInfo<ProviderInfo>(providerNotAuthInfoList);
    }

    /**
     * 撤销认证
     * @param oids
     * @param uId
     * @param reason
     * @return
     */
    @Override
    public int backout(Long[] oids, Long uId, String reason) {

        int result = orgDao.backoutProvider(oids,uId,reason);
        return result;
    }

    /**
     * 服务商新增时查询回显接口
     * @param key
     * @return
     */
    @Override
    public List<OrgBaseInfo> getProviderByName(String key) {
        List<OrgBaseInfo> providerInfos = orgDao.getProviderByName(key);
        return providerInfos;
    }

    /**
     * 服务商未认证审核
     * @param uId
     * @param oid
     * @param state
     * @param reason
     * @return
     */
    @Override
    public int audit(Long uId, Long oid, Integer state, String reason) {

        int result = orgDao.modifyState(oid,null,state,reason,uId);
        return result;
    }

    /**
     * 服务商私有池激活
     * @param oid
     * @param uId
     * @return
     */
    @Override
    public int activate(Long oid, Long uId) {
        int result = orgDao.modifyState(oid,uId,null,null,null);
        return result;
    }

}
