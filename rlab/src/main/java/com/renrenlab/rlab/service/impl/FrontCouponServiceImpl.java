package com.renrenlab.rlab.service.impl;

import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.FrontCouponService;
import com.renrenlab.rlab.vo.OrgProjectTmpInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 个人中心创新券service实现类
 * Created by guowanting on 2017/8/8.
 */
@Service
public class FrontCouponServiceImpl implements FrontCouponService {

    @Autowired
    private OrgCertifyTmpDao orgCertifyTmpDao;

    @Autowired
    private OrgProjectTmpDao orgProjectTmpDao;

    @Autowired
    private UserCouponMapDao userCouponMapDao;

    @Autowired
    private OrderCouponDao orderCouponDao;

    @Autowired
    private UserBaseInfoDao userBaseInfoDao;


    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    /**
     * 人人创新券展示页面
     * @param uId
     * @return
     */
    @Override
    public Map<String, Object> getPage(Long uId) {
        logger.debug("进入getPage方法uId="+uId);
        Map<String, Object> map = new HashMap<>();
        //flag=3 缺省页 flag=0 待审核 flag=1 审核成功 flag=2 审核失败
        map.put("flag",3);
        OrgCertifyTmp orgCertifyTmp = orgCertifyTmpDao.selectByUId(uId);
        if(orgCertifyTmp==null){
            return map;
        }
        Integer flag = orgCertifyTmp.getOrgCerState();
        map.put("flag",flag);
        if(!flag.equals(1)){
            map.put("reason",orgCertifyTmp.getOrgCerRemark());
            return map;
        }
        List<OrgProjectTmp> projectTmpList = orgProjectTmpDao.selectBaseInfoByCerId(orgCertifyTmp.getOrgCerId());
        map.put("proList",projectTmpList);
        map.put("cerId",orgCertifyTmp.getOrgCerId());
        return map;
    }

    /**
     * 申请创新券认证
     * @param orgCertifyTmp
     * @param operate
     * @return
     */
    @Override
    public Map<String, Object> applyCertify(OrgCertifyTmp orgCertifyTmp, String operate) {
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map1 = new HashMap<>();
        map.put("code", "200");
        map.put("payload", "申请成功");
        map1.put("code", "250");
        map1.put("payload", "申请失败");
        UserBaseInfo userBaseInfo = userBaseInfoDao.selectUserBaseInfoByUUid(orgCertifyTmp.getuUid());
        String mobile =null;
        if(userBaseInfo!=null){
            mobile=userBaseInfo.getuMobile();
        }
        orgCertifyTmp.setuMobile(mobile);
        if("apply".equals(operate)){
            int i = orgCertifyTmpDao.insertSelective(orgCertifyTmp);
            if(i==1){
                return map;
            }
            return map1;
        }
        if("modify".equals(operate)){
            orgCertifyTmp.setModifyTime(new Date());
            orgCertifyTmp.setOrgCerState(0);
            int i = orgCertifyTmpDao.updateByUIdSelective(orgCertifyTmp);
            if(i==1){
                return map;
            }
            return map1;
        }
        map1.put("payload", "operate参数错误");
        return map1;
    }

    /**
     * 根据uId获取认证信息
     * @param uId
     * @return
     */
    @Override
    public OrgCertifyTmp getCertify(Long uId) {
        OrgCertifyTmp orgCertifyTmp = orgCertifyTmpDao.selectByUId(uId);
        return orgCertifyTmp;
    }

    /**
     * 申请项目/上传发票合同修改
     * @param orgProjectTmp
     * @param operate
     * @return
     */
    @Override
    public Map<String, Object> applyProject(OrgProjectTmp orgProjectTmp, String operate) {

        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map1 = new HashMap<>();
        map.put("code", "200");
        map.put("payload", "申请成功");
        map1.put("code", "250");
        map1.put("payload", "申请失败");
        if(operate==null){
            int i = orgProjectTmpDao.insertSelective(orgProjectTmp);
            if(i==1){
                return map;
            }
            return map1;
        }
        if("modify".equals(operate)){
            orgProjectTmp.setModifyTime(new Date());
            int i = orgProjectTmpDao.updateByProIdSelective(orgProjectTmp);
            if(i==1){
                return map;
            }
            return map1;
        }
        map1.put("payload", "operate参数错误");
        return map1;
    }

    /**
     * 大学生创新券
     * @param uId
     * @return
     */
    @Override
    public List<OrderCoupon> getCollegeCoupon(Long uId) {
        Map<String, Object> map = new HashMap<>();
        List<UserCouponMap> list = userCouponMapDao.selectByUId(uId);
        List<OrderCoupon> coupons = new ArrayList<>();
        for (UserCouponMap userCouponMap : list) {
            Long cid = userCouponMap.getoCid();
            OrderCoupon orderCoupon = orderCouponDao.selectByCId(cid);
            if (userCouponMap.getuCouponState() == 1 && orderCoupon != null) {//如果使用过设置为失效
                orderCoupon.setoCouponStat(1);
            }
            coupons.add(orderCoupon);
        }
        return coupons;
    }

    /**
     * 对外插入认证接口
     * @param data
     * @return
     */
    @Override
    public Map<String, Object> applyCouponForExternal(OrgCertifyTmp data) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", "200");
        map.put("payload", "申请成功");
        int i = orgCertifyTmpDao.insertSelective(data);
        if(i==1){
            map.put("id",data.getOrgCerId());
            return map;
        }
        map.put("code", "205");
        map.put("payload", "申请失败");
        return map;

    }

    /**
     * 对外插入项目接口
     * @param data
     * @return
     */
    @Override
    public Map<String, Object> applyProjectForExternal(OrgProjectTmp data) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", "200");
        map.put("payload", "申请成功");
        int i = orgProjectTmpDao.insertSelective(data);
        if(i==1){
            map.put("id",data.getOrgProId());
            return map;
        }
        map.put("code", "205");
        map.put("payload", "申请失败");
        return map;

    }

    /**
     * 对外查询接口
     * @param data
     * @return
     */
    @Override
    public Map<String, Object> searchForExternal(Map<String, Object> data) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", "205");
        if("pro".equals(data.get("type"))){
            OrgProjectTmpInfo orgProjectTmpInfo = orgProjectTmpDao.selectByProid((Long) data.get("id"));
            if(orgProjectTmpInfo==null){
                map.put("payload","id无效");
                return map;
            }
            map.put("code", "200");
            map.put("payload", "查询成功");
            map.put("state",orgProjectTmpInfo.getOrgProState());
            map.put("msg",orgProjectTmpInfo.getOrgProRemark());
            return map;
        }
        if("cer".equals(data.get("type"))){
            OrgCertifyTmp orgCertifyTmp = orgCertifyTmpDao.selectByCerId((Long) data.get("id"));
            if(orgCertifyTmp==null){
                map.put("payload","id无效");
                return map;
            }
            map.put("code", "200");
            map.put("payload", "查询成功");
            map.put("state",orgCertifyTmp.getOrgCerState());
            map.put("msg",orgCertifyTmp.getOrgCerRemark());
            return map;
        }
        map.put("payload", "type参数传递错误");
        return map;
    }

}
