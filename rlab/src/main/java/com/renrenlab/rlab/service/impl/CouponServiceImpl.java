package com.renrenlab.rlab.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.SmsConstant;
import com.renrenlab.rlab.common.util.SMSUtils;
import com.renrenlab.rlab.dao.OrgCertifyTmpDao;
import com.renrenlab.rlab.dao.OrgProjectTmpDao;
import com.renrenlab.rlab.model.OrgCertifyTmp;
import com.renrenlab.rlab.model.OrgProjectTmp;
import com.renrenlab.rlab.service.CouponService;
import com.renrenlab.rlab.vo.OrgProjectTmpInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by guowanting on 2017/7/19.
 */
@Service
public class CouponServiceImpl implements CouponService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrgCertifyTmpDao orgCertifyTmpDao;

    @Autowired
    private OrgProjectTmpDao orgProjectTmpDao;


    /**
     * 查询创新券认证机构列表
     *
     * @param keyword
     * @param state
     * @param startTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @param order
     * @return
     */
    @Override
    public PageInfo<OrgCertifyTmp> searchCertifyList(String keyword, String state, String startTime, String endTime, Integer pageNo, Integer pageSize, String order) {
        logger.debug("invoke--searchCertifyList----");
        if (keyword != null) keyword = keyword.trim();

        PageHelper.startPage(pageNo, pageSize);
        List<OrgCertifyTmp> list = orgCertifyTmpDao.selectByKeyword(keyword, state, startTime, endTime, order);

        return new PageInfo<>(list);
    }

    /**
     * 查找创新券项目列表
     *
     * @param keyword
     * @param state
     * @param startTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @param order
     * @return
     */
    @Override
    public PageInfo<OrgProjectTmpInfo> searchProjectList(String keyword, String state, String startTime, String endTime, Integer pageNo, Integer pageSize, String order) {
        if (keyword != null) keyword = keyword.trim();
        if (pageNo == null) pageNo = 1;
        if (pageSize == null) pageSize = 10;

        List<OrgProjectTmpInfo> list = new ArrayList<>();
        PageHelper.startPage(pageNo, pageSize);
        list = orgProjectTmpDao.selectByKeyword(keyword, state, startTime, endTime, order);
        return new PageInfo<>(list);
    }

    /**
     * 认证详情页
     *
     * @param id
     * @return
     */
    @Override
    public OrgCertifyTmp searchCertifyOrg(Long id) {
        OrgCertifyTmp info = orgCertifyTmpDao.selectByCerId(id);
        return info;
    }

    /**
     * 项目详情页
     *
     * @param id
     * @return
     */
    @Override
    public OrgProjectTmpInfo searchOrgPro(Long id) {
        OrgProjectTmpInfo orgProjectTmpInfo = orgProjectTmpDao.selectByProid(id);
        return orgProjectTmpInfo;
    }

    /**
     * 审核
     *
     * @param reason 审核失败拒绝原因
     * @param state  0待审核1审核成功2审核失败3备案完成款项发放中4项目完成
     * @param flag   1为认证 2为项目
     * @param id
     * @param uId
     * @return
     */
    @Override
    public Map<String, Object> check(String reason, Integer state, Integer flag, Long id, Long uId) {

        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map1 = new HashMap<>();
        map.put("code", "200");
        map.put("payload", "审核成功");
        map1.put("code", "250");
        map1.put("payload", "参数传入错误");
        if (flag != 1 && flag != 2) {
            return map1;
        }
        if (flag == 1) {
            if (state != 1 && state != 2) {
                return map1;
            }
            //认证
            OrgCertifyTmp orgCertifyTmp = new OrgCertifyTmp();
            orgCertifyTmp.setOrgCerId(id);
            orgCertifyTmp.setOrgCerState(state);
            orgCertifyTmp.setOrgCerRemark(reason);
            orgCertifyTmp.setOrgCerChkUid(uId);
            orgCertifyTmp.setOrgCerChkTime(new Date());
            int i = orgCertifyTmpDao.updateByCIdSelective(orgCertifyTmp);
            if (i == 1) {
                //发短信
                OrgCertifyTmp orgCertifyTmpInfo = orgCertifyTmpDao.selectByCerId(id);
                if (state == 1) {
                    SMSUtils.sendMessage(orgCertifyTmpInfo.getuMobile(), SmsConstant.COUPON_PASS);
                } else {
                    SMSUtils.sendMessage(orgCertifyTmpInfo.getuMobile(), SmsConstant.COUPON_NOT_PASS);
                }
                return map;
            }
            map1.put("payload", "审核失败");
            return map1;
        }
        if (state != 1 && state != 2 && state != 3 && state != 4) {
            return map1;
        }
        OrgProjectTmp orgProjectTmp = new OrgProjectTmp();
        orgProjectTmp.setOrgProId(id);
        orgProjectTmp.setOrgProState(state);
        orgProjectTmp.setOrgProChkUid(uId);
        orgProjectTmp.setOrgProRemark(reason);
        orgProjectTmp.setOrgProChkTime(new Date());
        int i = orgProjectTmpDao.updateByProIdSelective(orgProjectTmp);
        if (i == 1) {
            //发短信
            OrgProjectTmpInfo orgProjectTmpInfo = orgProjectTmpDao.selectByProid(id);
            if (state == 1) {
                SMSUtils.sendMessage(orgProjectTmpInfo.getuMobile(), SmsConstant.PROJECT_PASS);
            } else {
                SMSUtils.sendMessage(orgProjectTmpInfo.getuMobile(), SmsConstant.PROJECT_NOT_PASS);
            }
            return map;
        }
        map1.put("payload", "审核失败");
        return map1;
    }
}
