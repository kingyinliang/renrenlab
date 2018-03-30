package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.Infomation;
import com.renrenlab.rlab.model.InfomationTag;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface InfomationDao {
    int deleteByPrimaryKey(Long id);

    int insertSelective(Infomation record);

    int updateByPrimaryKeySelective(Infomation record);

    List<Infomation> selectInfoList(@Param("title") String keyword,
                                    @Param("uname") String uname,
                                    @Param("tag") String tag,
                                    @Param("classify") Integer classify,
                                    @Param("beginTime") String beginTime,
                                    @Param("endTime") String endTime,
                                    @Param("order") String order,
                                    @Param("source") Integer source);

    int addInfomationTag(@Param("tag") String tag);

    List<InfomationTag> selectTagByName(@Param("tag") String tag);

    /**
     * 热门推荐
     *
     * @return
     */
    List<Infomation> getArticles(@Param("classifyName") String classifyName, @Param("limit") Integer limit);

    List<Infomation> getArticlesByKeyword(@Param("keyword") String keyword, @Param("classifyName") String classifyName, @Param("limit") Integer limit);

    List<Infomation> getTagArticles(@Param("tagName") String tagName);

    Infomation selectArticleById(@Param("id") Long id);

    List<Infomation> selectArticlesByTag(@Param("tags") List<String> tags, @Param("currentId") Long currentId);

    List<Infomation> selectHots();

    List<InfomationTag> selectTopTags();

    //    更改审核状态
    int changeState(@Param("id") Long id, @Param("state") Integer state);

}