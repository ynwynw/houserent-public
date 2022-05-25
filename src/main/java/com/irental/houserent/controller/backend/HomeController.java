package com.irental.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.enums.OrderStatusEnum;
import com.irental.houserent.common.util.PageUtil;
import com.irental.houserent.entity.Order;
import com.irental.houserent.service.HouseService;
import com.irental.houserent.service.OrderService;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*
 * 租客“我的家”功能控制器
 * */
@Controller("backHomeController")
public class HomeController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /*
     * 租客房屋信息列表我的家
     * */
    @RequestMapping("/admin/home")
    public String home(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "6") Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Order condition = new Order();
        condition.setCustomerUserId(getLoginUserId());
        condition.setStatus(OrderStatusEnum.NORMAL.getValue());

        Page<Order> orderPage = orderService.findAll(page, condition);
        for (Order order : orderPage.getRecords()) {
            //TODO 性能需要优化
            order.setHouse(houseService.get(order.getHouseId())); // 优化方案 id in ('1'.'2','3')
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
        }
        model.addAttribute("pageInfo", orderPage);
        model.addAttribute("tab", "home");
        model.addAttribute("pagePrefix", "/admin/home?");
        return "admin/my-home";
    }


}
