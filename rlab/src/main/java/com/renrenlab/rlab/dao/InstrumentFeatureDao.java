package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InstrumentFeature;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InstrumentFeatureDao {
    int insert(InstrumentFeature record);

    int insertSelective(InstrumentFeature record);

    List<InstrumentFeature> listAll();

    InstrumentFeature selectById(Long featureId);
}