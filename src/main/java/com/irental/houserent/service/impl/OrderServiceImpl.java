package com.irental.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.common.enums.OrderStatusEnum;
import com.irental.houserent.entity.Order;
import com.irental.houserent.mapper.OrderMapper;
import com.irental.houserent.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 * 订单服务实现类
 * */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public BaseMapper<Order> getRepository() {
        return orderMapper;
    }

    @Override
    public QueryWrapper<Order> getQueryWrapper(Order order) {
        return null;
    }

    @Override
    public QueryWrapper<Order> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public Order getCurrentEffectiveOrder(Long houseId) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("house_id", houseId);
        queryWrapper.eq("status", OrderStatusEnum.NORMAL);
        return orderMapper.selectOne(queryWrapper);
    }

    @Override
    public List<Order> findOverDueOrderList() {
        return orderMapper.findOverDueOrderList();
    }

    @Override
    public String orderNum() {
        return orderMapper.orderNum();
    }
}
