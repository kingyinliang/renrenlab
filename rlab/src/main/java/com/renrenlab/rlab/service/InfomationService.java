package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.*;

import java.util.List;
import java.util.Map;

/**
 * Created by renrenlab on 17/12/6.
 */
public interface InfomationService {
    PageInfo<Infomation> infomationList(String keyword, String uname, String tag, Integer classify, String beginTime,
                                        String endTime, Integer pageNo, Integer pageSize, String order, Integer source);

    int addInfomation(Infomation infomation);

    int deleteInfomation(Long infoId);

    int modifyInfomation(Infomation infomation);

    int addInfomationTag(InfomationTag infomationTag);

    /**
     * 审核通过
     *
     * @return
     */
    int passInfomation(Long infoId, Integer state);

    /**
     * 获取标签
     *
     * @return
     */
    List<InfomationTag> getTags();

    /**
     * 热门推荐
     *
     * @return
     */
    PageInfo<Infomation> getArticles(String classifyName, Integer pageNo, Integer pageSize);

    PageInfo<Infomation> getArticles(String keyword, String classifyName, Integer pageNo, Integer pageSize);

    /**
     * 标签文章列表
     *
     * @return
     */
    PageInfo<Infomation> getTagArticles(String tagName, Integer pageNo, Integer pageSize);

    //    后台文章详情
    Infomation getBGArticleDetail(Long id);

    /**
     * 文章详情
     *
     * @return
     */
    Map<String, Object> getArticleDetail(Long id);

    /**
     * 文章详情
     */
    Map<String, Object> getWorksHome(int limit);

    /**
     * 招聘资讯列表
     */
    PageInfo<InfomationCareer> getCareers(Integer pageNo, Integer pageSize);

    /**
     * 招聘信息列表
     */
    PageInfo<InfomationRecruit> getRecruits(Integer pageNo, Integer pageSize);

    /**
     * 招聘简历列表
     */
    PageInfo<InfomationResume> getResumes(Integer pageNo, Integer pageSize);

    /**
     * 招聘资讯详情
     */
    InfomationCareer getCareer(Long id);

    /**
     * 招聘信息详情
     */
    InfomationRecruit getRecruit(Long id);

    /**
     * 招聘简历详情
     */
    InfomationResume getResume(Long id);

    /**
     * 获取热门推荐和人人实验
     */
    Map<String, Object> getHots();

    /**
     * 根据关键字 检索科技头条
     *
     * @param searchKey
     * @return
     */
    PageInfo<Infomation> searchByKey(Integer pageNo, Integer pageSize, String searchKey);
}
