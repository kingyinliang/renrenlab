package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InstrumentCoreParam;
import org.springframework.stereotype.Repository;

@Repository
public interface InstrumentCoreParamDao {
    int insert(InstrumentCoreParam record);

    int insertSelective(InstrumentCoreParam record);

    InstrumentCoreParam selectByCode(String code);
}