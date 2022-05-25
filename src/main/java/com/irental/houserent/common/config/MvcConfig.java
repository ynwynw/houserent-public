package com.irental.houserent.common.config;

import com.irental.houserent.common.interceptor.AdminInterceptor;
import com.irental.houserent.common.interceptor.CustomerInterceptor;
import com.irental.houserent.common.interceptor.OwnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/*
 * 前端配置类
 * */
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {
    /*
     * 配置静态资源访问路径
     * */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/uploads/**").addResourceLocations("classpath:/static/uploads/");
        //Constant.UPLOADS_PATH

    }

    @Bean
    /*
     * 配置jsp的访问前后端
     * */
    public InternalResourceViewResolver setupViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    /*
     *
     * */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        System.out.println("1111111");
        registry.addInterceptor(new CustomerInterceptor()) //三个都可以的
                .addPathPatterns("/admin/profile")
                .addPathPatterns("/admin/home")
                .addPathPatterns("/admin/order")
                .addPathPatterns("/admin/mark")
                .addPathPatterns("/admin/password")
                .addPathPatterns("/admin/payment")
                .addPathPatterns("/admin/feedback");
        registry.addInterceptor(new OwnerInterceptor())
                .addPathPatterns("/admin/house");
        registry.addInterceptor(new AdminInterceptor()) //仅限管理员
                .addPathPatterns("/admin/news")
                .addPathPatterns("/admin/news/publish")
                .addPathPatterns("/admin/user")
                .addPathPatterns("/admin/control");


    }

}
