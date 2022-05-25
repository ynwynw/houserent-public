package com.irental.houserent.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.irental.houserent.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;
import java.util.List;

/*
 * 房屋信息实体
 * */
@Data
@TableName("t_house")
public class House extends BaseEntity {

    /*
     * 房东用户ID
     * */
    private Long userId;

    /*
     * 出租类型
     * */
    private String rentType;

    /*
     * 房屋名称
     * */
    private String title;

    /*
     * 房屋详细描述
     * */
    private String content;

    /*
     * 城市名称
     * */
    private String city;

    /*
     * 登录名
     * */
    private String address;

    /*
     * 缩略图URL
     * */
    private String thumbnailUrl;

    /*
     * 轮播图URL
     * */
    private String slideUrl;

    /*
     * 月租金额
     * */
    private Double monthRent;

    /*
     * 状态：0未租出/1已租出/-1下架/-2待审核/-3审核不通过
     * */
    private Integer status;

    /*
     * 房产证号
     * */
    private String certificateNo;
    /*
     * 卫生间数量
     * */
    private Integer toiletNum;

    /*
     * 厨房数量
     * */
    private Integer kitchenNum;


    /*
     * 客厅数量
     * */
    private Integer livingRoomNum;

    /*
     * 卧室数量
     * */
    private Integer bedroomNum;

    /*
     * 是否有空调 1有 0无
     * */
    private String hasAirConditioner;

    /*
     * 面积
     * */
    private Double area;

    /*
     * 当前所有楼层数
     * */
    private Integer floor;

    /*
     * 房字最大楼层数
     * */
    private Integer maxFloor;

    /*
     * 是否有电梯 1有 0无
     * */
    private Integer hasElevator;

    /*
     * 建成年份
     * */
    private Integer buildYear;

    /*
     * 朝向
     * */
    private String direction;

    /*
     * 上次开始入住时间
     * */
    private Date lastOrderStartTime;

    /*
     * 上次结束入住时间
     * */
    private Date lastOrderEndTime;

    /*
     * 经纬度
     * */
    private String longitudeLatitude;

    /*
     * 联系人姓名
     * */
    private String contactName;

    /*
     * 联系人电话
     * */
    private String contactPhone;

    /*
     * 轮播图列表
     * */
    @TableField(exist = false)
    private List<String> slideImgList;

    /*
     * 合租房屋列表
     * */
    @TableField(exist = false)
    private List<House> shareHouseList;

    /*
     * 该房屋的订单
     * */
    @TableField(exist = false)
    private Order currentOrder;

    /*
     * 位置
     * */
    @TableField(exist = false)
    private String location;

}
