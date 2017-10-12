package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InstrumentScope;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InstrumentScopeDao {

    int insert(InstrumentScope record);

    int insertSelective(InstrumentScope record);

    List<InstrumentScope> listAll();

    InstrumentScope selectById(Long scopeId);
}