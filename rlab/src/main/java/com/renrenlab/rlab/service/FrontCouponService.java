package com.renrenlab.rlab.service;

import com.renrenlab.rlab.model.OrderCoupon;
import com.renrenlab.rlab.model.OrgCertifyTmp;
import com.renrenlab.rlab.model.OrgProjectTmp;

import java.util.List;
import java.util.Map;

/**
 * 个人中心创新券service
 * Created by guowanting on 2017/8/8.
 */
public interface FrontCouponService {

    /**
     * 人人创新券展示页面
     * @param uId
     * @return
     */
    Map<String,Object> getPage(Long uId);

    /**
     * 申请创新券认证
     * @param orgCertifyTmp
     * @param operate
     * @return
     */
    Map<String,Object> applyCertify(OrgCertifyTmp orgCertifyTmp, String operate);

    OrgCertifyTmp getCertify(Long uId);

    /**
     * 申请项目
     * @param orgProjectTmp
     * @param operate
     * @return
     */
    Map<String,Object> applyProject(OrgProjectTmp orgProjectTmp, String operate);

    /**
     * 获得大学生创新券
     * @param uId
     * @return
     */
    List<OrderCoupon> getCollegeCoupon(Long uId);

    /**
     * 对外插入的接口
     * @param data
     * @return
     */
    Map<String,Object> applyCouponForExternal(OrgCertifyTmp data);

    Map<String,Object> applyProjectForExternal(OrgProjectTmp data);

    Map<String,Object> searchForExternal(Map<String, Object> data);
}
