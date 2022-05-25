package com.irental.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.News;
import com.irental.houserent.mapper.NewsMapper;
import com.irental.houserent.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/*
 * 实现新闻
 * */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsMapper newsMapper;

    @Override
    public BaseMapper<News> getRepository() {
        return newsMapper;
    }

    @Override
    public QueryWrapper<News> getQueryWrapper(News news) {
        QueryWrapper<News> queryWrapper = new QueryWrapper<>();
        return queryWrapper;
    }

    @Override
    public QueryWrapper<News> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }
}
