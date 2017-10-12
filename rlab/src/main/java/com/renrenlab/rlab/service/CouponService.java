package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.OrgCertifyTmp;
import com.renrenlab.rlab.vo.OrgProjectTmpInfo;

import java.util.Map;

/**
 * Created by guowanting on 2017/7/19.
 */
public interface CouponService {

    /**
     * 查找创新券认证机构列表
     * @param keyword
     * @param state
     * @param startTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @param order
     * @return
     */
    PageInfo<OrgCertifyTmp> searchCertifyList(String keyword, String state, String startTime, String endTime, Integer pageNo, Integer pageSize, String order);

    /**
     * 查找创新券项目列表
     * @param keyword
     * @param state
     * @param startTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @param order
     * @return
     */
    PageInfo<OrgProjectTmpInfo> searchProjectList(String keyword, String state, String startTime, String endTime, Integer pageNo, Integer pageSize, String order);

    /**
     * 认证详情
     * @param id
     * @return
     */
    OrgCertifyTmp searchCertifyOrg(Long id);

    /**
     * 项目详情
     * @param id
     * @return
     */
    OrgProjectTmpInfo searchOrgPro(Long id);

    /**
     * 审核
     * @param reason 审核失败拒绝原因
     * @param state 1审核成功 2审核拒绝
     * @param flag 1为认证 2为项目
     * @param id
     * @param uId
     * @return
     */
    Map<String,Object> check(String reason, Integer state, Integer flag, Long id, Long uId);
}
