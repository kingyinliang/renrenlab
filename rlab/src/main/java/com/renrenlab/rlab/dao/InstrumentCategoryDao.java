package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InstrumentCategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InstrumentCategoryDao {

    List<InstrumentCategory> selectByLevelAndCode(@Param("level") Integer level, @Param("code") String code);

    InstrumentCategory selectById(String categoryId);

    /**
     * 根据仪器所属分类
     *
     * @param insCategory
     * @return
     */
    InstrumentCategory selectCategory(@Param("insCategory") String insCategory, @Param("level") Long level);

    /**
     * 递归查询仪器分类,数据量太大了，不要直接查所有
     *
     * @return
     */
    @Deprecated
    List<InstrumentCategory> selectRecursive();
}