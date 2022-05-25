package com.irental.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.irental.houserent.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/*
 * 订单实体
 * */
@Data
@TableName("t_order")
public class Order extends BaseEntity {
    //租客用户ID
    //@TableField(value = "customer_id")
    private Long customerUserId;

    //房东用户ID
    //@TableField(value = "owner_id")
    private Long ownerUserId;

    //房屋ID
    private Long houseId;

    //订单状态
    private Integer status;

    //月租金
    private Double monthRent;

    //出租天数
    private Integer dayNum;

    //总金额
    private Double totalAmount;

    //开始日期
    private Date startDate;

    //结束日期
    private Date endDate;

    //房屋信息
    @TableField(exist = false)
    private House house;

    //租客用户信息
    @TableField(exist = false)
    private User customerUser;

    //房东用户信息
    @TableField(exist = false)
    private User ownerUser;
}
