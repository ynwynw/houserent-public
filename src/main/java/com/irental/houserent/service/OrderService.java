package com.irental.houserent.service;

import com.irental.houserent.common.base.BaseService;
import com.irental.houserent.entity.Order;

import java.util.List;

/*
 * 订单服务接口
 * */
public interface OrderService extends BaseService<Order, Long> {
    /*
     * 查询当前有效订单
     * */
    Order getCurrentEffectiveOrder(Long houseId);

    /*
     * 查询到期的订单
     * */
    List<Order> findOverDueOrderList();

    String orderNum();
}
