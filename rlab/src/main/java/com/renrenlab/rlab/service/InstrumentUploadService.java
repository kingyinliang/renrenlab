package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.vo.InsturmentUploadHistoryInfo;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * Created by guowanting on 2017/7/20.
 */
public interface InstrumentUploadService {

    Map<String, Object> uploadInstruments(Long uId, Long orgId, MultipartFile file);

    PageInfo<InsturmentUploadHistoryInfo> searchHistory(Integer pageNo, Integer pageSize);
}
