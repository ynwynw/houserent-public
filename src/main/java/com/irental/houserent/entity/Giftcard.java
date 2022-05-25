package com.irental.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.irental.houserent.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/*
 * 礼品卡实体
 * */
@Data
@TableName("t_giftcard")
public class Giftcard extends BaseEntity {
    /*
    * 礼品卡序列号
    * */
    private String series;

    /*
     * 状态，1未使用 -1已使用 0已过期
     * */
    private String status;

    /*
     * 价值金额
     * */
    private double value;

    /*
     * 生产时间
     * */
    private Date createDate;

    /*
     * 到期时间
     * */
    private Date endDate;

    /*
     * 使用时间
     * */
    private Date usedDate;

    /*
     * 使用者名字
     * */
    private String usedBy;

}
