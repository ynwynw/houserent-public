package com.irental.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.irental.houserent.common.base.BaseEntity;
import lombok.Data;

/*
 * 用户信息实体
 * */
@Data
@TableName("t_user")
public class User extends BaseEntity {
    /*
     * 登录名
     * */
    private String userName;
    /*
     * 姓名
     * */
    private String userDisplayName;

    /*
     * 手机号
     * */
    private String phone;

    /*
     * 电子邮箱
     * */
    private String email;

    /*
     * 密码
     * */
    private String userPass;

    /*
     * 身份证
     * */
    private String idCard;

    /*
     * 头像
     * */
    private String userAvatar;

    /*
     * 个人描述
     * */
    private String userDesc;

    /*
     * 状态码 1正常，0禁用
     * */
    private Integer status;

    /*
     * 角色，管理员admin/房东owner/租客customer
     * */
    private String role;

    /*
     * 业余爱好
     * */
    private String hobby;

    /*
     * 职业
     * */
    private String job;
    /*
     * 性别
     * */
    private String sex;

    /*
     * 现金余额
     * */
    private Double balance;

}
