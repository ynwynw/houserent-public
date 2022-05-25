package com.irental.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.irental.houserent.common.base.BaseEntity;
import lombok.Data;

/*
 * 收藏实体
 * */
@Data
@TableName("t_mark")
public class Mark extends BaseEntity {
    /*
     * 收藏者ID
     * */
    private Long userId;

    /*
     * 房屋ID
     * */
    private Long houseId;

    /*
     * 房屋信息
     * */
    @TableField(exist = false)
    private House house;


}
