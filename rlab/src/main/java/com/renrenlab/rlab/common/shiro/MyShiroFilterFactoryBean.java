package com.renrenlab.rlab.common.shiro;

import com.renrenlab.rlab.service.IShiro;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

public class MyShiroFilterFactoryBean extends ShiroFilterFactoryBean {

    @Autowired
    IShiro shiro;

    /**
     * 从数据库动态读取需要拦截的url
     */
    @Override
    public void setFilterChainDefinitions(String definitions) {
        //加入权限集合
        super.setFilterChainDefinitionMap(shiro.getFilterMap());
    }
}
