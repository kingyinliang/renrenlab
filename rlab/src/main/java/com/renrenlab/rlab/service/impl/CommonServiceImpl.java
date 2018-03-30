package com.renrenlab.rlab.service.impl;

import com.renrenlab.rlab.common.util.RedisUtil;
import com.renrenlab.rlab.dao.KeywordInfoDao;
import com.renrenlab.rlab.model.KeywordInfo;
import com.renrenlab.rlab.service.IComonService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/12/20.
 */
@Service
public class CommonServiceImpl implements IComonService {
    private static final String KEYWORD_MAP_NAME = "renrenlab_keyword_map_name";
    @Autowired
    KeywordInfoDao keywordInfoDao;

    /**
     * 保存搜索词到redis
     *
     * @param searchTerm
     */
    @Override
    public void saveSearchTerm(String searchTerm) {
        if (StringUtils.isBlank(searchTerm)) {
            return;
        }
        //保存搜索词到redis,定时任务同步到数据库(不用担心根据名字从redis中拿到的map为空，返回结果是个空集合)
        String value = RedisUtil.getInstance().getMapValueByKey(KEYWORD_MAP_NAME, searchTerm).get(0);
        if (StringUtils.isNotBlank(value)) {
            int count = Integer.parseInt(value) + 1;
            RedisUtil.getInstance().setMapValueByKey(KEYWORD_MAP_NAME, searchTerm, String.valueOf(count));
        } else {
            RedisUtil.getInstance().setMapValueByKey(KEYWORD_MAP_NAME, searchTerm, String.valueOf(1));
        }
    }

    /**
     * 检索搜索词
     *
     * @return
     */
    @Override
    public List<KeywordInfo> checkSearchTerm(int day) {
        LocalDate now = LocalDate.now().minusDays(1);
        //默认查前10个热词
        return keywordInfoDao.selectKeywordInfos(now.minusDays(day).toString(), now.toString(), 20);
    }

    /**
     * 保存检索词到数据库
     */
    @Override
    public void saveSearchTermToDB() {
        //从redis中取出map
        Map<String, String> resultMap = RedisUtil.getInstance().getMap(KEYWORD_MAP_NAME);
        if (resultMap == null || resultMap.size() == 0) {
            return;
        }
        List<KeywordInfo> infos = new ArrayList<>();
        resultMap.forEach((key, value) -> {
            KeywordInfo keywordInfo = new KeywordInfo();
            keywordInfo.setKeyword(key);
            keywordInfo.setkCount(Integer.valueOf(value));
            infos.add(keywordInfo);
        });
        int result = keywordInfoDao.insertSelective(infos);
        if (result > 0) {
            //说明入库成功，清空redis
            RedisUtil.getInstance().delKey(KEYWORD_MAP_NAME);
        }
    }
}
