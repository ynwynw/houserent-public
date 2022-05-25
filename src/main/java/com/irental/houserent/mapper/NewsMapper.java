package com.irental.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.News;
import org.apache.ibatis.annotations.Mapper;

/*
 * 新闻资讯Mapper
 * */
@Mapper
public interface NewsMapper extends BaseMapper<News> {
}
