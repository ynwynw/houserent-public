package com.irental.houserent.common.config;


import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*
 * 分页配置
 * */
@Configuration
public class MyBatisPlusConfig {
    /*
     * mybatisplus分页插件
     * */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
}
