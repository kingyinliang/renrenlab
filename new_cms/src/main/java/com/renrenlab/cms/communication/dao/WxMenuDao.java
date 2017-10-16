package com.renrenlab.cms.communication.dao;

import java.util.List;

import com.renrenlab.cms.communication.model.WxMenu;
import org.springframework.stereotype.Repository;

@Repository
public interface WxMenuDao {
    int deleteByPrimaryKey(Long id);

    int insert(WxMenu record);

    int insertSelective(WxMenu record);

    WxMenu selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(WxMenu record);

    int updateByPrimaryKey(WxMenu record);
    
    WxMenu selectByWmMenuKey(String wmMenuKey);

	List<WxMenu> listAll();

}