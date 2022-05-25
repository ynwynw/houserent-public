package com.irental.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.irental.houserent.common.base.BaseEntity;
import lombok.Data;

/*
 * 新闻资讯实体
 * */
@Data
@TableName("t_news")
public class News extends BaseEntity {
    //标题
    private String title;

    //摘要
    private String summary;

    //内容
    private String content;

    //作者
    private String author;
}
