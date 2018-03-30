package com.renrenlab.rlab.service;

import com.renrenlab.rlab.model.KeywordInfo;

import java.util.List;

/**
 * Created by guanjipeng on 2017/12/20.
 */
public interface IComonService {
    /**
     * 保存搜索词到redis
     *
     * @param searchTerm
     */
    void saveSearchTerm(String searchTerm);

    /**
     * 检索搜索词
     *
     * @param day
     * @return
     */
    List<KeywordInfo> checkSearchTerm(int day);

    void saveSearchTermToDB();
}
