package com.renrenlab.rlab.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.common.util.InsUtil;
import com.renrenlab.rlab.common.util.SMSUtils;
import com.renrenlab.rlab.dao.RequirementDao;
import com.renrenlab.rlab.model.Requirement;
import com.renrenlab.rlab.service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/8/8.
 */
@Service
@Transactional
public class RequirementImpl implements RequirementService {

    @Autowired
    private RequirementDao requirementDao;

    @Override
    public PageInfo<Requirement> getList(String keyword, Integer state, String beginTime, String endTime, Integer pageNo, Integer pageSize, String sort) {
        if (pageNo == null) pageNo = 1;
        if (pageSize == null) pageSize = 10;
        PageHelper.startPage(pageNo, pageSize);
        List<Requirement> requirementList = requirementDao.selectByKeyword(keyword, state, beginTime, endTime, sort);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Requirement requirement : requirementList) {
            requirement.setBeginTime(format.format(requirement.getCreateTime()));
            requirement.setEndTime(format.format(requirement.getuReqEndTime()));
            requirement.setRemainTime(InsUtil.getRemainTime(requirement.getuReqEndTime()));
            if (Integer.valueOf(requirement.getRemainTime()) <= 0) {
                //需求已经过期 修改状态
                requirement.setuReqState(2);
                requirementDao.auditing(requirement);
            }
        }
        return new PageInfo<>(requirementList);
    }

    @Override
    public int delay(Long uReqId) {
        //只有过期时间在三天内才能延期
        Requirement requirement = requirementDao.selectByUreqId(uReqId);
        if (Integer.valueOf(InsUtil.getRemainTime(requirement.getuReqEndTime())) > 3) {
            return 0;
        }
        return requirementDao.delay(uReqId);
    }

    @Override
    public int auditing(Requirement requirement) {
        int result = 0;
        if (requirement.getuReqIds() != null) {
            for (Long id : requirement.getuReqIds()) {
                //修改审核状态之前 检查记录最后的更新时间是否是用户读取的更新记录时间
                Requirement requirement1 = requirementDao.selectByUreqId(id);
                if (requirement.getModifyTime() != null && requirement.getModifyTime() != requirement1.getModifyTime()) {
                    //说明之后用户修改了该需求 需要管理员刷新页面重新审核
                    throw new BusinessException(ResponseEntity.REQUIREMENT_HAS_CHANGE);
                }
                requirement.setuReqId(id);
                result = requirementDao.auditing(requirement);
                //审核通过(未解决)或者拒绝 发短信提醒
                if (result > 0 && (requirement.getuReqState() == 1 || requirement.getuReqState() == 4)) {
                    SMSUtils.sendMessage(requirement1.getuMobile(), Constant.Requirement.REQSTATEMODIFY);
                }
            }
        }
        return result;
    }

    @Override
    public int publish(Requirement requirement) {
        return requirementDao.publish(requirement);
    }

    @Override
    public int modify(Requirement requirement) {
        // if (!StringUtils.isEmpty(requirement.getIsReDepoly())) {
        //重新发布需求

        requirement.setuChkCount(requirementDao.selectByUreqId(requirement.getuReqId()).getuChkCount());
        requirementDao.deleteByUReqId(requirement.getuReqId());
//        requirement.setuReqId(null);
        return requirementDao.publish(requirement);
       /* } else {
            //修改需求之前 检查需求是否已经变更
            Requirement requirement1 = requirementDao.selectByUreqId(requirement.getuReqId());
            if (requirement1.getModifyTime().getTime() != requirement.getModifyTimes()) {
                //说明管理员用户修改了该需求 需要用户刷新页面重新审核
                throw new BusinessException(ResponseEntity.REQUIREMENT_HAS_CHANGE);
            }
            return requirementDao.modify(requirement);
        }*/
    }

    @Override
    public List<Requirement> getOutDate() {
        //检索即将过期的所有需求
        List<Requirement> requirements = requirementDao.getOutDate();
        if (requirements != null) {
            for (Requirement requirement : requirements) {
                //短信发送成功后 置状态uHasNotice为1 表示已经短信通知过了
                if (requirement.getuHasDelay() == 1) {
                    //已经延期一次
                    SMSUtils.sendMessage(requirement.getuMobile(), Constant.Requirement.WILLBEOUTDATE2);
                } else {
                    //没有延期过
                    SMSUtils.sendMessage(requirement.getuMobile(), Constant.Requirement.WILLBEOUTDATE);
                }
                requirement.setuReqReason(null);
                requirement.setuReqState(null);
                requirement.setuHasNotice(1);
                requirementDao.auditing(requirement);
            }
        }
        return null;
    }

    @Override
    public List<Requirement> getTop10(HttpServletRequest request) {
        List<Requirement> requirements = requirementDao.getTop10();
        Long uUid = (Long) request.getSession().getAttribute("uid");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Requirement requirement : requirements) {
            requirement.setModifyTimeStr(format.format(requirement.getModifyTime()));
            if (uUid == null) {
                //用户为登录 不返回手机号
                requirement.setuMobile(null);
            }
        }
        return requirements;
    }

    @Override
    public PageInfo<Requirement> getListByUid(Long uid, Integer state,
                                              Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Requirement> list = requirementDao.getListByUid(uid, state);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Requirement requirement : list) {
            requirement.setEndTime(format.format(requirement.getuReqEndTime()));
            requirement.setBeginTime(format.format(requirement.getCreateTime()));
            requirement.setRemainTime(InsUtil.getRemainTime(requirement.getuReqEndTime()));
            if (Integer.valueOf(requirement.getRemainTime()) <= 0) {
                //需求已经过期 修改状态
                requirement.setuReqState(2);
                requirementDao.auditing(requirement);
            }
        }
        return new PageInfo<>(list);
    }

    @Override
    public List<Map<String, Integer>> getCount(Long uUid) {
        return requirementDao.getCount(uUid);
    }

    @Override
    public Integer getAllCount(Long uUid) {
        return requirementDao.getAllCount(uUid);
    }

    @Override
    public Requirement getDetailById(Long uReqId) {
        return requirementDao.selectByUreqId(uReqId);
    }

    @Override
    public int addCount(Long uRedId) {
        return requirementDao.addCount(uRedId);
    }
}
