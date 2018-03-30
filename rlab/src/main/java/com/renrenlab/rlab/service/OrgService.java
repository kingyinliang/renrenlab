package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.InsListInfo;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.model.OrgCertificateTmp;
import com.renrenlab.rlab.vo.*;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by wanshou on 2017/5/15.
 * 机构模块
 */
public interface OrgService {

    /**
     * 分页查询机构列表
     * @param keyword
     * @param orgCategoryId
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<OrgInfo> searchOrgList(String keyword, Integer wordType,Integer orgCategoryId, Integer pageNo, Integer pageSize, String order);

    /**
     * 查询机构基础信息
     * @param oid
     * @return
     */
    OrgBaseInfo searchOrgBaseInfoByOid(long oid);

    /**
     * 查询排名前三的机构
     * @param k
     * @return
     */
    List<OrgInfo> searchOrgBaseInfoListTopK(Integer k);

    /**
     * 查询机构详细信息
     * @param oid
     * @return
     */
    OrgInfo searchOrgInfoByOid(long oid);

    /**
     * 根据机构ID查询仪器列表
     * @param oid
     * @return
     */
    PageInfo<InsListInfo> searchInsByOid(Long oid, Integer pageNo, Integer pageSize);

    /**
     * 添加机构
     * @param org
     * @return
     */
    /**
     * 添加机构
     * @param org
     */
    OrgInfo addOrg(OrgInfo org);

    /**
     * 添加机构资质认证
     * @param orgCertificate
     */
    OrgCertificate addOrgCertificate(OrgCertificate orgCertificate);

    /**
     * 修改机构
     * @param org
     */
    void modifyOrg(OrgInfo org);

    /**
     * 关闭机构
     * @param oid
     * @return
     */
    int closeOrg(long oid, int os);

    /**
     * 查询机构所在城市
     * @param id
     * @return
     */
    List<Location> searchCityName(int id);

    /**
     * 查询机构所在城市
     * @param name
     * @return
     */
    void addOrgCertificateTmp(String name);

    /**
     * 查询所有资质名称
     * @return
     */
    List<OrgCertificateTmp> selectOrgCertificateTmp();

    /**
     * 分页查询服务商列表
     * @param uid
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<FrontProviderInfo> selectProviderInfoByUid(@Param("uid") Long uid, Integer pageNo, Integer pageSize);

    /**
     * 根据oid查询创建者信息
     * @param orgOid
     * @return
     */
    OrgManager searchOrgManagerInfo(Long orgOid);

    /**
     * web端搜索服务机构列表（索引表）
     * @param keyword
     * @param province
     * @param city
     * @param district
     * @param order 排序规则 0 默认（认证状态和距离） 1 距离排序 2 共享指数
     * @param pageNo
     * @param pageSize
     * @param session
     * @return
     */
    Map<String, Object> searchFrontOrgList(String keyword, String province, String city, String district, Integer order, Integer pageNo, Integer pageSize, HttpSession session);

    List<String> getDistrict(String province, String city);
}
