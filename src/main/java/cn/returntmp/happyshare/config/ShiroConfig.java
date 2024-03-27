package cn.returntmp.happyshare.config;

import cn.returntmp.happyshare.auth.BaseHashedCredentialsMatcher;
import cn.returntmp.happyshare.auth.JwtFilter;
import cn.returntmp.happyshare.auth.JwtRealm;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author ronger
 */
@Configuration
public class ShiroConfig {

    @Bean
    public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //添加自定义的过滤器
        LinkedHashMap<String, Filter> linkedHashMap = new LinkedHashMap<>();
        linkedHashMap.put("jwt", new JwtFilter());
        shiroFilterFactoryBean.setFilters(linkedHashMap);

        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        // 配置不需要经过认证的 URL 路径，这些路径使用 "anon"（匿名访问）过滤器
        filterChainDefinitionMap.put("/actuator/**", "anon");
        filterChainDefinitionMap.put("/api/v1/console/**", "anon");
        filterChainDefinitionMap.put("/api/v1/article/detail/**", "anon");
        filterChainDefinitionMap.put("/api/v1/topic/**", "anon");
        filterChainDefinitionMap.put("/api/v1/user/**", "anon");
        filterChainDefinitionMap.put("/api/v1/article/*/comments", "anon");
        filterChainDefinitionMap.put("/api/v1/rule/currency/**", "anon");
        filterChainDefinitionMap.put("/api/v1/lucene/**", "anon");
        filterChainDefinitionMap.put("/api/v1/open-data/**", "anon");
        filterChainDefinitionMap.put("/api/v1/auth/login/**", "anon");
        filterChainDefinitionMap.put("/api/v1/auth/logout/**", "anon");
        filterChainDefinitionMap.put("/api/v1/auth/refresh-token/**", "anon");
        filterChainDefinitionMap.put("/api/v1/sse/**", "anon");
        // 配置除了上述路径之外的所有路径都需要经过 JWT 认证，使用自定义的 JwtFilter 过滤器
        filterChainDefinitionMap.put("/**", "jwt");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);

        return shiroFilterFactoryBean;
    }

    /**
     * 配置 Realm 安全领域
     *
     * @return
     */
    @Bean
    public JwtRealm baseShiroRealm() {
        JwtRealm shiroRealm = new JwtRealm();
        shiroRealm.setCredentialsMatcher(new BaseHashedCredentialsMatcher());
        return shiroRealm;
    }

    /***
     * 配置安全管理器，管理所有的 Realm
     * */
    @Bean
    public SecurityManager securityManager() {
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        defaultWebSecurityManager.setRealm(baseShiroRealm());
        defaultWebSecurityManager.setRememberMeManager(null);
        return defaultWebSecurityManager;
    }

    /**
     * 开启shiro aop注解支持.
     * 使用代理方式;所以需要开启代码支持;
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    /**
     * Shiro生命周期处理器
     */
    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    @DependsOn({"lifecycleBeanPostProcessor"})
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }
}
