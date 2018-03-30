package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.InfomationService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.renrenlab.rlab.controller.front.FrontInformationController.HOTS;

/**
 * Created by renrenlab on 17/12/6.
 */
@Service
@Transactional
public class InfomationServiceImpl implements InfomationService {
    @Autowired
    InfomationDao infomationDao;

    @Autowired
    UserBaseInfoDao userBaseInfoDao;

    @Autowired
    InfomationCareerDao infomationCareerDao;

    @Autowired
    InfomationRecruitDao infomationRecruitDao;

    @Autowired
    InfomationResumeDao infomationResumeDao;

    /**
     * 后台资讯列表
     */
    @Override
    public PageInfo<Infomation> infomationList(String keyword, String uname, String tag, Integer classify, String beginTime, String endTime, Integer pageNo, Integer pageSize, String order, Integer source) {
        if (classify != null && 99 == classify) {
            classify = null;
        }

        PageHelper.startPage(pageNo, pageSize);
        List<Infomation> infomations = infomationDao.selectInfoList(keyword, uname, tag, classify, beginTime, endTime, order, source);
        for (Infomation infomation : infomations) {
//            infomation.setCreateTimeStr(CommonUtil.formatTime(infomation.getCreateTime()));
            infomation.settInfoTags(JSONObject.parseArray(infomation.gettInfoTags().toString()));
        }
        return new PageInfo<>(infomations);
    }

    /**
     * 后台添加资讯
     */
    @Override
    public int addInfomation(Infomation infomation) {
        if (infomation.gettInfoTitle() == null ||
                infomation.gettInfoSubTitle() == null ||
                infomation.gettInfoContent() == null) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }

        String uname = userBaseInfoDao.selectUserBaseInfoByUUid(infomation.gettUid()).getuName();
        infomation.settUname(uname);

        return infomationDao.insertSelective(infomation);
    }

    //    修改资讯
    @Override
    public int modifyInfomation(Infomation infomation) {
        if (infomation.gettInfoId() == null) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        int result = infomationDao.updateByPrimaryKeySelective(infomation);
        if (result != 1) {
            throw new BusinessException(ResponseEntity.PARAMETER_ERROR);
        }
        return result;
    }

    /**
     * 后台删除资讯
     */
    @Override
    public int deleteInfomation(Long infoId) {
        return infomationDao.deleteByPrimaryKey(infoId);
    }

    /**
     * 后台添加资讯标签
     */
    @Override
    public int addInfomationTag(InfomationTag infomationTag) {
        if (infomationDao.selectTagByName(infomationTag.gettTagName()).size() > 0) {
            return 0;
        }

        int result = infomationDao.addInfomationTag(infomationTag.gettTagName());
        return result;
    }

    /**
     * 审核通过
     */
    @Override
    public int passInfomation(Long infoId, Integer state) {
        Integer result = infomationDao.changeState(infoId, state);
        return result;
    }

    /**
     * 后台获取资讯标签
     */
    @Override
    public List<InfomationTag> getTags() {
        return infomationDao.selectTagByName(null);
    }

    /**
     * home
     *
     * @return
     */
    @Override
    public PageInfo<Infomation> getArticles(String classifyName, Integer pageNo, Integer pageSize) {
        return getArticles(null, classifyName, pageNo, pageSize);
    }

    /**
     * 根据关键词 科技头条
     *
     * @param keyword
     * @param classifyName
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public PageInfo<Infomation> getArticles(String keyword, String classifyName, Integer pageNo, Integer pageSize) {
        if (StringUtils.isBlank(classifyName)) {
            classifyName = null;
        }
        if (HOTS.equals(classifyName)) {
            pageNo = 1;
            pageSize = 10;
        }
        List<Infomation> articles = null;
        PageHelper.startPage(pageNo, pageSize);
        if (StringUtils.isNotBlank(keyword)) {
            articles = infomationDao.getArticlesByKeyword(keyword, classifyName, null);
        } else {
            articles = infomationDao.getArticles(classifyName, null);
        }

        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        articles.forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
            //处理标签
            article.settInfoTags(JSONObject.parseArray(article.gettInfoTags().toString()));
            //处理日期
            article.setCreateTimeStr(article.getCreateTime().format(formatter));
        });
        return new PageInfo<>(articles);
    }

    /**
     * 标签文章列表
     *
     * @return
     */
    @Override
    public PageInfo<Infomation> getTagArticles(String tagName, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Infomation> articles = infomationDao.getTagArticles(tagName);
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        articles.forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
            //处理标签
            article.settInfoTags(JSONObject.parseArray(article.gettInfoTags().toString()));

        });
        return new PageInfo<>(articles);
    }

    //    获取后台文章详情
    @Override
    public Infomation getBGArticleDetail(Long id) {
        Infomation detail = infomationDao.selectArticleById(id);
        detail.settInfoTags(JSONObject.parseArray(detail.gettInfoTags().toString()));
        if (detail == null) {
            throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
        }
        return detail;
    }

    /**
     * 文章详情和可能想看的文章
     *
     * @return
     */
    @Override
    public Map<String, Object> getArticleDetail(Long id) {
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        Map<String, Object> result = new HashMap<String, Object>();
        Infomation detail = infomationDao.selectArticleById(id);
        detail.setHours((int) Duration.between(detail.getCreateTime(), localDateTime).toHours());
        detail.settInfoTags(JSONObject.parseArray(detail.gettInfoTags().toString()));
        result.put("detail", detail);

        if (detail == null) {
            throw new BusinessException(ResponseEntity.GLOBAL_ERROR);
        }

        List<String> tags = JSONArray.parseArray(detail.gettInfoTags().toString(), String.class);

        List<Infomation> list = infomationDao.selectArticlesByTag(tags, id);
        list.forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
            //处理标签
            article.settInfoTags(JSONObject.parseArray(article.gettInfoTags().toString()));

        });
        result.put("list", list);

        return result;
    }

    //    职来职往首页
    @Override
    public Map<String, Object> getWorksHome(int limit) {
        Map<String, Object> result = new HashMap<>();
        List<InfomationCareer> careerList = infomationCareerDao.selectList(limit);
        result.put("careerList", careerList);
        List<InfomationRecruit> recruitList = infomationRecruitDao.selectList(limit);
        result.put("recruitList", recruitList);
        List<InfomationResume> resumeListe = infomationResumeDao.selectList(limit);
        result.put("resumeListe", resumeListe);
        return result;
    }

    /**
     * 招聘资讯列表
     */
    @Override
    public PageInfo<InfomationCareer> getCareers(Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<InfomationCareer> list = infomationCareerDao.selectList(0);
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        list.stream().forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
            article.setModifyTime(Date.from(article.getCreateTime().atZone(ZoneId.systemDefault()).toInstant()));
        });
        return new PageInfo<>(list);
    }

    /**
     * 招聘信息列表
     */
    @Override
    public PageInfo<InfomationRecruit> getRecruits(Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<InfomationRecruit> list = infomationRecruitDao.selectList(0);
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        list.stream().forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
            article.setModifyTime(Date.from(article.getCreateTime().atZone(ZoneId.systemDefault()).toInstant()));
        });
        return new PageInfo<>(list);
    }

    /**
     * 招聘简历列表
     */
    @Override
    public PageInfo<InfomationResume> getResumes(Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<InfomationResume> list = infomationResumeDao.selectList(0);
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        list.stream().forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
            article.setModifyTime(Date.from(article.getCreateTime().atZone(ZoneId.systemDefault()).toInstant()));
//            article.setCreateTime(article.getCreateTime().);
        });
        return new PageInfo<>(list);
    }

    /**
     * 招聘资讯详情
     */
    @Override
    public InfomationCareer getCareer(Long id) {
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        InfomationCareer infomationCareer = infomationCareerDao.selectByPrimaryKey(id);
        infomationCareer.setHours((int) Duration.between(infomationCareer.getCreateTime(), localDateTime).toHours());
        return infomationCareer;
    }

    /**
     * 招聘信息详情
     */
    @Override
    public InfomationRecruit getRecruit(Long id) {
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        InfomationRecruit infomationRecruit = infomationRecruitDao.selectByPrimaryKey(id);
        infomationRecruit.setHours((int) Duration.between(infomationRecruit.getCreateTime(), localDateTime).toHours());
        return infomationRecruit;
    }

    /**
     * 招聘简历详情
     */
    @Override
    public InfomationResume getResume(Long id) {
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        InfomationResume infomationResume = infomationResumeDao.selectByPrimaryKey(id);
        infomationResume.setHours((int) Duration.between(infomationResume.getCreateTime(), localDateTime).toHours());
        return infomationResume;
    }

    /**
     * 获取热门推荐和人人实验
     */
    @Override
    public Map<String, Object> getHots() {
        HashMap<String, Object> result = new HashMap<>();
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        List<Infomation> list = infomationDao.selectHots();
        list.forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
        });
        result.put("hotList", list);
        List<InfomationTag> topTags = infomationDao.selectTopTags();
        result.put("tagList", topTags);
        return result;
    }

    /**
     * 根据关键字 检索科技头条
     *
     * @param searchKey
     * @return
     */
    @Override
    public PageInfo<Infomation> searchByKey(Integer pageNo, Integer pageSize, String searchKey) {
        PageInfo<Infomation> infomations = this.getArticles(searchKey, null, pageNo, pageSize);
        return infomations;
    }
}
