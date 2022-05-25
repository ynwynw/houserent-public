package com.irental.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.common.enums.HouseStatusEnum;
import com.irental.houserent.common.enums.OrderStatusEnum;
import com.irental.houserent.common.util.DateUtil;
import com.irental.houserent.common.util.PageUtil;
import com.irental.houserent.entity.House;
import com.irental.houserent.entity.Order;
import com.irental.houserent.service.FeedbackService;
import com.irental.houserent.service.HouseService;
import com.irental.houserent.service.OrderService;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

import static com.irental.houserent.common.util.GetDaysUtil.differentDaysByMillisecond;

/*
 * 后端订单控制器
 * */
@Controller("backendOrderController")
@RequestMapping("/admin/order")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private UserService userService;

    /*
     * 进入订单列表页面
     * */
    @RequestMapping("")
    public String allOrder(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "6") Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Order condition = new Order();
        //如果登录用户是租客，查询租客订单
        if (loginUserIsCustomer()) {
            condition.setCustomerUserId(getLoginUserId());
        }

        //如果登录用户是房东，查询房东订单
        if (loginUserIsOwner()) {
            condition.setOwnerUserId(getLoginUserId());
        }

        //如果登录用户是管理员，查询所有订单
        //condition.setHouseId(20L);
        Page<Order> orderPage = orderService.findAll(page, condition);
        for (Order order : orderPage.getRecords()) {
            //TODO 性能需要优化
            order.setHouse(houseService.get(order.getHouseId())); // 优化方案 id in ('1'.'2','3')
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
            order.setCustomerUser(userService.get(order.getCustomerUserId()));
        }
        model.addAttribute("pageInfo", orderPage);
        model.addAttribute("tab", "order-list");
        model.addAttribute("pagePrefix", "/admin/order?");
        return "admin/order-list";
    }

    /*
     * 取消订单
     * */
    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult cancelOrder(@RequestParam("orderId") Long orderId) {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }
        //登录用户不是该订单所属租客、管理员、该订单所属房东，不能取消订单。
        if (!loginUserIsAdmin() && !Objects.equals(getLoginUserId(), order.getCustomerUserId()) && Objects.equals(getLoginUserId(), order.getOwnerUserId())) {
            return JsonResult.error("没有权限");
        }

        order.setStatus(OrderStatusEnum.CUSTOMER_CANCEL.getValue());
        orderService.update(order);

        return JsonResult.success("取消成功");
    }


    /*
     * 申请退租
     * */
    @RequestMapping(value = "/end", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrder(@RequestParam("orderId") Long orderId) {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }
        //登录用户不是该订单所属租客、管理员、该订单所属房东，不能取消订单。
        if (!loginUserIsAdmin() && !Objects.equals(getLoginUserId(), order.getCustomerUserId()) && !Objects.equals(getLoginUserId(), order.getOwnerUserId())) {
            return JsonResult.error("没有权限");
        }
        order.setStatus(OrderStatusEnum.END_APPLY.getValue());
        orderService.update(order);

        return JsonResult.success("申请退租成功，请联系房东审核");
    }


    /*
     * 退租申请：通过
     * */
    @RequestMapping(value = "/endPass", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrderPass(@RequestParam("orderId") Long orderId) throws ParseException {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }
        //登录用户不是该订单所属租客、管理员、该订单所属房东，不能取消订单。
        if (!loginUserIsAdmin() && !Objects.equals(getLoginUserId(), order.getOwnerUserId())) {
            return JsonResult.error("没有权限");
        }
        order.setStatus(OrderStatusEnum.FINISH.getValue());
        Date date = new Date();
        int dayNum = DateUtil.daysBetween(order.getStartDate(), date);
        order.setDayNum(dayNum);
        order.setTotalAmount(order.getMonthRent() / 30 * dayNum);
        order.setEndDate(date);
        orderService.update(order);

        //将房屋的状态变更一下，未租出状态
        House house = houseService.get(order.getHouseId());
        if (house != null && Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            house.setLastOrderEndTime(date);
            houseService.update(house);
        }

        //若租客提前退租，将退还剩余天数的金额
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date endDayFormat = df.parse(df.format(order.getEndDate()));
        Date StartDayFormat = df.parse(df.format(order.getStartDate()));
        Integer livedDay = differentDaysByMillisecond(endDayFormat, StartDayFormat);
        System.out.println(livedDay);
        if (livedDay == 0) {
            Double ZeroDayChargeFee = (order.getMonthRent() / 30) * Constant.TODAY_ORDER_CANCEL_SERVICE_CHARGE;

            return JsonResult.success("由于您退租日期为当天，需要额外收取 " + Constant.TODAY_ORDER_CANCEL_SERVICE_CHARGE * 100 + "% 的房费（一天房价的百分比），共计 " + ZeroDayChargeFee + "元。");
        }
        return JsonResult.success("退租成功");
    }

    /*
     * 退租申请 拒绝
     * */
    @RequestMapping(value = "/endReject", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrderReject(@RequestParam("orderId") Long orderId) {
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }
        //登录用户不是该订单所属租客、管理员、该订单所属房东，不能取消订单。
        if (!loginUserIsAdmin() && !Objects.equals(getLoginUserId(), order.getOwnerUserId())) {
            return JsonResult.error("没有权限");
        }
        order.setStatus(OrderStatusEnum.END_APPLY_REJECT.getValue());
        orderService.update(order);
        return JsonResult.success("操作成功，退租申请已拒绝");
    }

}
