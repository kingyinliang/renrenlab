package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.vo.ProviderInfo;

import java.util.List;

/**
 * 服务商Serice
 * Created by guowanting on 2017/9/20.
 */
public interface ProviderService {

    /**
     * 查询认证服务商列表页
     * @param orgName
     * @param rankLow
     * @param rankHigh
     * @param bizName
     * @param isCommon
     * @param orgSource
     * @param orgIdentifications
     * @param startTime
     * @param uId
     * @param pageNo
     * @param pageSize
     * @param order        @return
     * */
    PageInfo<ProviderInfo> searchAuthProviderList(String orgName, Integer rankLow, Integer rankHigh, String bizName, Integer isCommon, Integer orgSource, Integer orgIdentifications, String startTime, Long uId, Integer pageNo, Integer pageSize, String order);

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
    PageInfo<ProviderInfo> searchNotAuthProviderList(String orgName, String bizName, Integer isCommon, Integer orgSource, List<Integer> orgIdentifications, String startTime, Long uId, Integer pageNo, Integer pageSize, String order);

    /**
     * 撤销认证
     * @param oids
     * @param uId
     * @param reason
     * @return
     */
    int backout(Long[] oids, Long uId, String reason);

    /**
     * 服务商新增时查询回显接口
     * @param key
     * @return
     */
    List<OrgBaseInfo> getProviderByName(String key);

    /**
     * 服务商未认证审核
     * @param uId
     * @param oid
     * @param state
     * @param reason
     * @return
     */
    int audit(Long uId, Long oid, Integer state, String reason);

    /**
     * 服务商私有池激活
     * @param oid
     * @param uId
     * @return
     */
    int activate(Long oid, Long uId);
}
