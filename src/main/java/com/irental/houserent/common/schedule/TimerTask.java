package com.irental.houserent.common.schedule;

import com.irental.houserent.common.enums.HouseStatusEnum;
import com.irental.houserent.common.enums.OrderStatusEnum;
import com.irental.houserent.entity.House;
import com.irental.houserent.entity.Order;
import com.irental.houserent.service.HouseService;
import com.irental.houserent.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/*
 * 定时任务，每分钟定时扫描正在租赁中的房屋
 * 若到期，即结束。
 * */
@Component
@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
public class TimerTask {
    @Autowired
    private OrderService orderService;
    @Autowired
    private HouseService houseService;

    /*
     * 每分钟执行一次
     * */
    @Scheduled(cron = "0 */1 * * * ?")
    public void endOrderTimer() {
        List<Order> list = orderService.findOverDueOrderList();
        if (list == null || list.size() == 0) {
            return;
        }
        for (Order order : list) {
            //更新订单状态为已到期
            order.setStatus(OrderStatusEnum.FINISH.getValue());
            orderService.update(order);
            //更新房屋状态为未租出状态
            House house = houseService.get(order.getHouseId());
            if (house != null) {
                house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
                houseService.update(house);
            }
        }
        System.out.println("执行静态定时任务时间: " + LocalDateTime.now());
    }
}
