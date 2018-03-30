package com.renrenlab.rlab.service;

import com.alibaba.fastjson.JSONArray;
import com.renrenlab.rlab.vo.KejsoEchartsInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by guowanting on 2017/7/4.
 */
public interface ISuperSearchService {

    /**
     * 查询所有
     * @param query
     * @return
     */
    Map<String, Object> searchAll(String query);
    /**
     * 可能感兴趣的领域2.0接口
     * @param query
     * @return
     */
    List<?> searchInterestWords(String query);
    /**
     * 关联领域2.0接口（echarts）
     * @param query
     * @return
     */
    KejsoEchartsInfo searchRelatedField(String query);
    /**
     * 相关咨询2.0接口
     * @param query
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<?> searchRelatedNews(String query, Integer pageNum, Integer pageSize);
    /**
     * 相关论文、项目信息2.0
     * which指定论文或项目
     * @param query
     * @param which
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<?> searchRelatedInfo(String query, String which, Integer pageNum, Integer pageSize);
    /**
     * 人物、机构排名2.0接口
     * @param query
     * @return
     */
    List<?> searchRankInfo(String query);

    /**
     * web搜索页调用高级搜索感兴趣领域接口
     * @param keyword
     * @return
     */
    JSONArray relatedInterest(String keyword);
}
