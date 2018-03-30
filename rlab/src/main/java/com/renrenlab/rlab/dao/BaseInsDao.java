package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.BaseInsInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseInsDao {


    List<BaseInsInfo> getList(@Param("keyword") String keyword,
                              @Param("insId") Long insId,
                              @Param("beginTime") String beginTime,
                              @Param("endTime") String endTime,
                              @Param("order") String order);

    List<BaseInsInfo> getListWithCate(@Param("keyword") String keyword,
                                      @Param("insId") Long insId,
                                      @Param("insCategory") String insCategory,
                                      @Param("insCategory2") String insCategory2,
                                      @Param("beginTime") String beginTime,
                                      @Param("endTime") String endTime,
                                      @Param("order") String order);


    BaseInsInfo getDetail(@Param("insId") Long insId);


    int updateBaseInfo(BaseInsInfo insInfo);

    /**
     * 插入
     * @param baseInsInfo
     * @return
     */
    Long insertSelective(BaseInsInfo baseInsInfo);

}