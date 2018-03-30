package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.vo.FrontProviderInfo;
import com.renrenlab.rlab.vo.Location;
import com.renrenlab.rlab.vo.OrgInfo;
import com.renrenlab.rlab.vo.ProviderInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * 机构表
 * Created by wanshou on 2017/5/15.
 */
@Repository
public interface OrgDao {

    /**
     * 查询机构基础信息
     *
     * @param oid
     * @return
     */
    OrgBaseInfo searchOrgBaseInfoByOid(Long oid);

    /**
     * 查询机构详细信息
     *
     * @param oid
     * @return
     */
    OrgInfo searchOrgInfoByOid(Long oid);

    /**
     * 根据机构名查询机构数量
     *
     * @param orgName
     * @return
     */
    List<OrgBaseInfo> searchOrgCountByOrgName(@Param("orgName") String orgName);

    /**
     * 分页查询机构列表
     *
     * @param keyword
     * @param orgCategoryId
     * @return
     */
    List<OrgInfo> searchOrgBaseInfoListByOrgName(@Param("keyword") String keyword, @Param("oci") Integer orgCategoryId, @Param("order") String order);

    /**
     * 分页查询机构列表
     *
     * @param keyword
     * @param orgCategoryId
     * @return
     */
    List<OrgInfo> searchOrgBaseInfoListByOrgNameByContacts(@Param("keyword") String keyword, @Param("oci") Integer orgCategoryId, @Param("order") String order);

    /**
     * 分页查询机构列表
     * @param orgCategoryId
     * @param order
     * @return
     */
    List<OrgInfo> searchOrgBaseInfoList(@Param("oci") Integer orgCategoryId, @Param("order") String order);

//    /**
//     * 查询排名前k的机构
//     * @param k
//     * @return
//     */
//    List<OrgInfo> searchOrgBaseInfoListTopK(@Param("k") Integer k);

    /**
     * 更新机构详细信息
     *
     * @param orgInfo
     * @return
     */
    int updateOrgInfo(OrgInfo orgInfo);

    /**
     * 添加机构
     *
     * @param orgInfo
     * @return
     */
    int insertOrgInfo(OrgInfo orgInfo);

    /**
     * 关闭机构
     *
     * @param orgOid
     * @param os
     * @return
     */
    int closeOrg(@Param("orgOid") long orgOid, @Param("os") int os);

    /**
     * 查询城市
     *
     * @param id
     * @return
     */
    List<Location> searchCityName(@Param("id") int id);

    /**
     * 查询直辖市
     *
     * @param id
     * @return
     */
    List<Location> searchMunicipalityName(@Param("id") int id);

    /**
     * 根据机构ID查询仪器数量
     *
     * @param orgId
     * @return
     */
    Integer searchInsCountByOrgId(@Param("orgId") long orgId);

    /**
     * 根据机构ID查询仪器信息
     *
     * @param oid
     * @return
     */
    List<HashMap<String, Long>> selectInsByOid(@Param("oid") Long oid);

    /**
     * 分页查询服务商认证列表
     * @param orgName
     * @param rankLow
     * @param rankHigh
     * @param bizName
     * @param isCommon
     * @param orgSource
     * @param orgIdentifications
     * @param startTime
     * @param uId
     * @param order      @return
     * */
    List<ProviderInfo> searchAuthInfoList(@Param("orgName") String orgName, @Param("rankLow") Integer rankLow, @Param("rankHigh") Integer rankHigh, @Param("bizName") String bizName, @Param("isCommon") Integer isCommon, @Param("orgSource") Integer orgSource, @Param("state") Integer state, @Param("startTime") String startTime, @Param("uId") Long uId, @Param("order") String order);

    /**
     * 根据用户ID查询指定服务商
     * @param uid
     * @return
     */
    List<FrontProviderInfo> selectFrontProviderInfoByUid(@Param("uid") Long uid);

    /**
     * 分页查询服务商未认证列表
     * @param orgName
     * @param bizName
     * @param isCommon
     *@param orgSource
     * @param orgIdentifications
     * @param startTime
     * @param uId
     * @param order      @return
     */
    List<ProviderInfo> searchNotAuthInfoList(@Param("orgName") String orgName, @Param("bizName") String bizName,@Param("isCommon") Integer isCommon, @Param("orgSource") Integer orgSource, @Param("orgIdentifications") List<Integer> orgIdentifications, @Param("startTime") String startTime, @Param("uId") Long uId, @Param("order") String order);

    /**
     * 撤销认证
     * @param oids
     * @param uId
     * @param reason
     * @return
     */
    int backoutProvider(@Param("oids") Long[] oids, @Param("uId") Long uId, @Param("reason") String reason);

    /**
     * 服务商新增时查询回显接口
     * @param key
     * @return
     */
    List<OrgBaseInfo> getProviderByName(String key);

    /**
     * 修改服务商状态
     * @param oid
     * @param uId
     * @param state
     *@param reason
     * @param auditUid   @return
     */
    int modifyState(@Param("oid") Long oid, @Param("uId") Long uId, @Param("state")Integer state, @Param("reason") String reason, @Param("auditUid") Long auditUid);
}
