package com.renrenlab.rlab.service;

import com.renrenlab.rlab.vo.KejsoPaperListInfo;
import com.renrenlab.rlab.vo.KejsoProListInfo;
import com.renrenlab.rlab.vo.KejsoRelatedInfo;
import com.renrenlab.rlab.vo.KejsoSearchInfo;

public interface IKejsoService {

	KejsoSearchInfo SearchMsgFromKejso(String query);

	KejsoPaperListInfo morePaper(String query, Integer pageNo,Integer pageSize);

	KejsoProListInfo morePro(String query, Integer pageNo, Integer pageSize);

	KejsoRelatedInfo moreRelatedInfo(String query, Integer pageNo, Integer pageSize);


}
