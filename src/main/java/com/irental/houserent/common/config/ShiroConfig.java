package com.irental.houserent.common.config;



import com.irental.houserent.common.cache.RedisManager;
import com.irental.houserent.oauth.OAuthRealm;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.mgt.DefaultSessionManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    @Bean
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);

        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();  
       /* filterChainDefinitionMap.put("/", "anon");  

        filterChainDefinitionMap.put("/static/**", "anon"); 
        filterChainDefinitionMap.put("/blogFile/**", "anon");
        filterChainDefinitionMap.put("/login", "anon"); 
        filterChainDefinitionMap.put("/register", "anon"); 
        filterChainDefinitionMap.put("/**", "authc"); */

        //filterChainDefinitionMap.put("/**/create", "authc");
        //filterChainDefinitionMap.put("/**/update", "authc");
        //filterChainDefinitionMap.put("/**/delete", "authc");
        //filterChainDefinitionMap.put("/upload", "authc");
        //filterChainDefinitionMap.put("/users/currentUser", "authc");
         // 配置不会被拦截的链接 顺序判断
        filterChainDefinitionMap.put("/**", "anon");

        //没有登陆会被拦截 直接跳转到登录页面,配置shiro默认登录界面地址，前后端分离中登录界面跳转应由前端路由控制，后台仅返回json数据
        shiroFilterFactoryBean.setLoginUrl("/login");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    //加密密码和验证密码
    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        //md5加密
        //hashedCredentialsMatcher.setHashAlgorithmName("md5");
        //hashedCredentialsMatcher.setHashIterations(2);
        return hashedCredentialsMatcher;
    }

    /**
     * 将自定义的realm 注入到当前的 realm 中
     * 将HashedCredentialsMatcher 加密方式 构造注入 realm方法 中
     */
    @Bean
    public OAuthRealm oAuthRealm() {
        OAuthRealm myShiroRealm = new OAuthRealm();
        //myShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
        return myShiroRealm;
    }
    /* *  配置 安全管理器 securityManager
     *  securityManager需要realm
     *  将其注入
     **/
    @Bean
    public SecurityManager securityManager(OAuthRealm oAuthRealm, SessionManager sessionManager) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(oAuthRealm);
        securityManager.setSessionManager(sessionManager);
        // 自定义缓存实现 使用redis  
        //securityManager.setCacheManager(cacheManager());  
        return securityManager;
    }
/*
    @Bean
    public SessionManager sessionManager(OAuthSessionDAO authSessionDAO) {
        OAuthSessionManager oAuthSessionManager = new OAuthSessionManager();
        oAuthSessionManager.setSessionDAO(authSessionDAO);
        return oAuthSessionManager;
    }


    @Bean
    public OAuthSessionDAO authSessionDAO(RedisManager redisManager) {
        OAuthSessionDAO authSessionDAO = new OAuthSessionDAO();
        authSessionDAO.setRedisManager(redisManager);
        return authSessionDAO;
    }*/

    /**
     * session会话
     */
    @Bean("SessionManager")
    public DefaultWebSessionManager defaultWebSessionManager()
    {
        DefaultWebSessionManager defaultWebSessionManager = new DefaultWebSessionManager();

        //defaultWebSessionManager.setSessionDAO(abstractSessionDAO);

        // 没5秒检查一次session是否过期
        //defaultWebSessionManager.setSessionValidationInterval(1000);

        //设置session超时时间。一旦超时将其删除
        defaultWebSessionManager.setGlobalSessionTimeout(1800000);
        defaultWebSessionManager.setDeleteInvalidSessions(true);

        return defaultWebSessionManager;
    }
    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

}
