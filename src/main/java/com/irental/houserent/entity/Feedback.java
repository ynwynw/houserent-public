package com.irental.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.irental.houserent.common.base.BaseEntity;
import lombok.Data;

/*
 * 用户反馈实体
 * */
@Data
@TableName("t_feedback")
public class Feedback extends BaseEntity {
    /*反馈内容的标题*/
    private String title;

    /*反馈的内容*/
    private String content;

    /*用户ID*/
    private Long userId;

    /*处理状态 0待处理，1已处理*/
    private Integer status;

    /*回复内容*/
    private String reply;

    /*联系人姓名*/
    private String contactName;

    /*联系人邮箱*/
    private String contactEmail;
}
