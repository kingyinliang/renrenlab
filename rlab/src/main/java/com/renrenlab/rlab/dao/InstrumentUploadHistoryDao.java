package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InstrumentUploadHistory;
import com.renrenlab.rlab.vo.InsturmentUploadHistoryInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InstrumentUploadHistoryDao {

    int deleteByPrimaryKey(Long id);

    int insert(InstrumentUploadHistory record);

    int insertSelective(InstrumentUploadHistory record);

    InstrumentUploadHistory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(InstrumentUploadHistory record);

    int updateByPrimaryKey(InstrumentUploadHistory record);

    List<InsturmentUploadHistoryInfo> listAll();
}