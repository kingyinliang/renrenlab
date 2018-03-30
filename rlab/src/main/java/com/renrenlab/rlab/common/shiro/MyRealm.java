package com.renrenlab.rlab.common.shiro;

import com.renrenlab.rlab.dao.UserBaseInfoDao;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.service.IShiro;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * Created by guanjipeng on 2018/3/8.
 */
public class MyRealm extends AuthorizingRealm {
    @Autowired
    UserBaseInfoDao userBaseInfoDao;

    @Autowired
    IShiro shiro;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        //获取基于用户名和密码的令牌
        //实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
        //两个token的引用都是一样的,本例中是org.apache.shiro.authc.UsernamePasswordToken@33799a1e
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        System.out.println("验证当前Subject时获取到token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
        UserBaseInfo userBaseInfo = userBaseInfoDao.selectByMobileAndPassword(token.getUsername(), String.valueOf(token.getPassword()));

        if (null != userBaseInfo) {
            AuthenticationInfo authcInfo =
                    new SimpleAuthenticationInfo(userBaseInfo.getuUid(), userBaseInfo.getuPassword(), userBaseInfo.getuMobile());
            this.setSession("currentUser", userBaseInfo);
            return authcInfo;
        }

        //没有返回登录用户名对应的SimpleAuthenticationInfo对象时,就会在LoginController中抛出UnknownAccountException异常
        return null;
    }

    /**
     * 为当前登录的Subject授予角色和权限
     * 经测试:本例中该方法的调用时机为需授权资源被访问时
     * 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache
     * 个人感觉若使用了Spring3.1开始提供的ConcurrentMapCache支持,则可灵活决定是否启用AuthorizationCache
     * 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //从数据库中获取当前登录用户的详细信息
        Long uUid = (Long) principals.getPrimaryPrincipal();
        //为当前用户设置角色和权限
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        Set userRoleSet = shiro.getUserRoles(uUid);
        if (CollectionUtils.isNotEmpty(userRoleSet)) {
            simpleAuthorInfo.addRoles(userRoleSet);
            Set permissionSet = shiro.getUserPermissions(uUid);
            if (CollectionUtils.isNotEmpty(permissionSet)) {
                simpleAuthorInfo.addStringPermissions(permissionSet);
            }
        }
        return simpleAuthorInfo;
    }

    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     * <p>
     * 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
     */
    private void setSession(Object key, Object value) {
        Subject currentUser = SecurityUtils.getSubject();
        if (null != currentUser) {
            Session session = currentUser.getSession();
//            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
            if (null != session) {
                session.setAttribute(key, value);
            }
        }
    }
}
