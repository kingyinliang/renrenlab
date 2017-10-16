package com.renrenlab.cms.communication.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.cms.common.constant.Constant;
import com.renrenlab.cms.communication.dao.*;
import com.renrenlab.cms.communication.model.*;
import com.renrenlab.cms.communication.service.IUserCouponService;
import com.renrenlab.cms.communication.vo.CouponInfo;
import com.renrenlab.cms.communication.vo.UserCouponInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserCouponServiceImpl implements IUserCouponService {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private JedisPool jedisPool;
    @Autowired
    private UserCouponMapDao userCouponMapDao;
    @Autowired
    private OrderCouponDao couponDao;
    @Autowired
    private UserBaseInfoDao userBaseInfoDao;
    @Autowired
    private UserWxDao userWxDao;
    @Autowired
    private UserTagMapDao userTagMapDao;

    /**
     * 处理用户标签优惠券关系 返回0：用户没有此标签，返回1：用户拥有此标签
     */
    @Override
    public int handlerRelation(String openid, Long uid) {
        log.info("handlerRelation");
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            String tid = jedis.get("tag_" + openid);
            if (tid == null) {
                return 0;
            }
            log.info("绑定手机成功，有标签，自动发放优惠券");
            UserTagMap userTagMap = userTagMapDao.selectByUIdAndTId(uid, Long.valueOf(tid));
            if (userTagMap == null) {
                userTagMap = new UserTagMap();
                userTagMap.settTid(Long.valueOf(tid));
                userTagMap.setuUid(uid);
                userTagMapDao.insertSelective(userTagMap);
                log.info("处理用户与优惠券关系");
            }
            SendCoupon(uid);
            return 1;
        } catch (JedisConnectionException e) {
            log.error("redis连接异常", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return 0;
    }

    /**
     * 发放优惠券 0:正常 1：获取创新券列表失败
     */
    @Override
    public int SendCoupon(Long uid) {
        List<Long> couponIds = Constant.COUPON_IDS;
        // 得到优惠券列表，目前是全部优惠券
        List<OrderCoupon> cList = couponDao.selectAllByCoIds(couponIds);
        if (cList == null || cList.size() == 0) {
            return 1;
        }
        // 目前先用的优惠券常量
        UserCouponMap uc = new UserCouponMap();
        // 遍历，查找是否存在，存在跳过，不存在插入
        for (Long coId : couponIds) {
            List<UserCouponMap> userCoupon = userCouponMapDao.selectByUIdAndCoId(uid, coId);
            if (userCoupon == null || userCoupon.size() == 0) {
                uc.setoCid(coId);
                uc.setuUid(uid);
                userCouponMapDao.insertSelective(uc);
            }
        }
        return 0;
    }

    /**
     * 查询优惠券列表
     */
    @Override
    public List<CouponInfo> selectCouponList(String openId) {
        List<CouponInfo> list = new ArrayList<CouponInfo>();
        // 判断是不是我们的用户
        UserWx wxUser = userWxDao.selectByOpenId(openId);
        // 提示暂无优惠券
        if (wxUser == null || wxUser.getuUid() == null) {
            return list;
        }
        Long uId = wxUser.getuUid();
        // 查询用户优惠券关联表
        List<UserCouponMap> userCoupons = userCouponMapDao.selectByUId(uId);
        if (userCoupons == null || userCoupons.size() == 0) {
            return list;
        }
        CouponInfo cVo = null;
        for (UserCouponMap userCoupon : userCoupons) {
            Long coId = userCoupon.getoCid();
            OrderCoupon coupon = couponDao.selectByCoId(coId);
            // 转换vo
            cVo = new CouponInfo();
            cVo.setCoId(coId);
            cVo.setCouponName(coupon.getoCouponName());
            cVo.setcState(coupon.getoCouponStat());
            // 已使用状态覆盖其他状态
            // TODO 优惠券过期处理，目前是已禁用算过期
            if (userCoupon.getuCouponState() == 1) {
                cVo.setcState(2);
            }
            list.add(cVo);
            log.info(cVo.toString());
        }
        return list;
    }

    /**
     * 更新优惠券的状态
     */
    @Override
    public void updateCouponStatus(UserCouponMap userCoupon) {
        OrderCoupon coupon;
        if (userCoupon.getuCouponState() == Constant.COUPON_USED)
            // 创新券已使用
            userCouponMapDao.updateStatusByUidAndCoId(userCoupon);
        if (userCoupon.getuCouponState() == Constant.COUPON_OVERTIME) {
            // 创新券已过期
            coupon = new OrderCoupon();
            coupon.setoCid(userCoupon.getoCid());
            // TODO 过期状态处理，现在把过期当禁用了
            coupon.setoCouponStat(1);
            couponDao.updateByCoId(coupon);
        }
    }

    /**
     * 搜索得到用户优惠券
     */
    @Override
    public Map<String, Object> searchCouponInfo(String searchMsg, Long coId, Integer pageNo, Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        // 用户创新券信息
        List<UserCouponInfo> rList = new ArrayList<>();
        List<UserCouponMap> list = new ArrayList<>();
        // 分页信息
        PageInfo<UserCouponMap> pageInfo;
        // 用户信息
        UserBaseInfo user;
        List<UserBaseInfo> uList;
        List<Long> uIds;
        // 创新券信息
        OrderCoupon coupon;

        if (!"".equals(searchMsg)) {
            uList = userBaseInfoDao.selectByuPhoneOruName(searchMsg);
            if (uList.size() == 0 && uList.isEmpty()) {
                map.put("rlist", rList);
                map.put("pages", 0);
                return map;
            }
            uIds = new ArrayList<>();
            for (UserBaseInfo u : uList) {
                uIds.add(u.getuUid());
            }
            // 用户关联的创新券
            if (coId == 0) {
                PageHelper.startPage(pageNo, pageSize);
                list = userCouponMapDao.selectByuIds(uIds);
                pageInfo = new PageInfo<UserCouponMap>(list);
            } else {
                PageHelper.startPage(pageNo, pageSize);
                list = userCouponMapDao.selectByuIdsAndcoId(uIds, coId);
                pageInfo = new PageInfo<UserCouponMap>(list);
            }
        } else {
            // 默认显示 -> 从用户创新券关联表中查询 -> 查询用户及创新券信息
            if (coId == 0) {
                PageHelper.startPage(pageNo, pageSize);
                list = userCouponMapDao.selectAll();
                pageInfo = new PageInfo<UserCouponMap>(list);
            } else {
                PageHelper.startPage(pageNo, pageSize);
                list = userCouponMapDao.selectBycoId(coId);
                pageInfo = new PageInfo<UserCouponMap>(list);
            }
        }

        if (pageInfo.getPages() == 0) {
            map.put("rlist", rList);
            map.put("pages", 0);
            return map;
        }

        for (UserCouponMap uc : pageInfo.getList()) {
            coupon = couponDao.selectByCoId(uc.getoCid());
            user = userBaseInfoDao.selectByUId(uc.getuUid());
            UserCouponInfo info = new UserCouponInfo();
            info.setCoId(coupon.getoCid());
            info.setcName(coupon.getoCouponName());
            // 用户创新券关联表ucstate 0 未使用 1 已使用 、创新券表 costate 0 未过期 1 已过期
            if (coupon.getoCouponStat() == 1) {
                info.setcState(Constant.COUPON_OVERTIME);
            } else if (coupon.getoCouponStat() != 1 && uc.getuCouponState() == 1) {
                info.setcState(Constant.COUPON_USED);
            } else {
                info.setcState(Constant.COUPON_NOT_USED);
            }
            info.setuId(user.getuUid());
            info.setuName(user.getuNickname());
            info.setuPhone(user.getuMobile());
            rList.add(info);
        }

        map.put("rlist", rList);
        map.put("pages", pageInfo.getPages());
        return map;
    }

}
