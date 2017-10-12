package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InstrumentUploadTmp;
import org.springframework.stereotype.Repository;

@Repository
public interface InstrumentUploadTmpDao {
    int insert(InstrumentUploadTmp record);

    int insertSelective(InstrumentUploadTmp record);
}