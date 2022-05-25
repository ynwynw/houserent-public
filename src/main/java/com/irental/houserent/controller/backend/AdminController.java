package com.irental.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.util.PageUtil;
import com.irental.houserent.entity.Feedback;
import com.irental.houserent.entity.User;
import com.irental.houserent.service.FeedbackService;
import com.irental.houserent.service.HouseService;
import com.irental.houserent.service.OrderService;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*
 * 个人信息管理控制器
 * */
@Controller
@RequestMapping("/admin/")
public class AdminController extends BaseController {
    @Autowired
    private UserService userService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private FeedbackService feedbackService;

    /*
     * 个人信息页面
     * */
    @RequestMapping("/control")
    public String index(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "3") Long pageSize, Model model) {
        /*后台控制面板的*/
        User user = getLoginUser();
        model.addAttribute("user", user);
        model.addAttribute("tab", "admin-control");

        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Feedback condition1 = new Feedback();
        Page<Feedback> feedbackPage = feedbackService.findAll(page, condition1);
        model.addAttribute("pageInfo", feedbackPage);
        model.addAttribute("pagePrefix", "/news?");

        String userCount = userService.findAllUserNums();
        String ownerCount = userService.findOwnerNums();
        String userFeedbackCount = userService.userFeedbackCount();
        String orderNum = orderService.orderNum();
        String houseCount = houseService.houseCount();

        model.addAttribute("userCount", userCount);
        model.addAttribute("ownerCount", ownerCount);
        model.addAttribute("houseCount", houseCount);
        model.addAttribute("userFeedbackCount", userFeedbackCount);
        model.addAttribute("orderNum", orderNum);
        return "admin/admin-control";
    }

}
