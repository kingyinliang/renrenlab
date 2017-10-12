package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InstrumentCategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InstrumentCategoryDao {

    int deleteByPrimaryKey(Long id);

    int insert(InstrumentCategory record);

    int insertSelective(InstrumentCategory record);

    InstrumentCategory selectByPrimaryKey(Long id);

    List<InstrumentCategory> selectByLevelAndCode(@Param("level") Integer level, @Param("code") String code);

    InstrumentCategory selectById(String categoryId);

    /**
     * 根据仪器所属分类
     *
     * @param insCategory
     * @return
     */
    InstrumentCategory selectCategory(@Param("insCategory") String insCategory, @Param("level") Long level);
}