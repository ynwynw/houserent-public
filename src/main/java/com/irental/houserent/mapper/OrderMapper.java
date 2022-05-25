package com.irental.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.Order;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/*
 * 订单mapper
 * */
public interface OrderMapper extends BaseMapper<Order> {
    /*
     * 查询到期的订单
     * */
    @Select("select * from t_order where status = 0 and end_date<now()")
    List<Order> findOverDueOrderList();

    @Select("select count(id) as order_num from t_order;")
    String orderNum();
}
