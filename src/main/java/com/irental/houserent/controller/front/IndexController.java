package com.irental.houserent.controller.front;


import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.enums.HouseRentTypeEnum;
import com.irental.houserent.service.HouseService;
import com.irental.houserent.service.OrderService;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.irental.houserent.common.util.getLocation.getlocation;

//前端首页控制器
@Controller
public class IndexController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /*
     * 前端首页*/
    @RequestMapping(value = "/")
    public String index(Model model) {
        //获取用户现在的位置（以省级为单位）
        String location = getlocation();
        //最新的整租
        model.addAttribute("recentWholeHouseList", houseService.findTopList(HouseRentTypeEnum.WHOLE.getValue(), Constant.INDEX_HOUSE_NUM));
        //最新的合租
        model.addAttribute("recentShareHouseList", houseService.findTopList(HouseRentTypeEnum.SHARE.getValue(), Constant.INDEX_HOUSE_NUM));
        //获取三条用户当前位置的民宿
        model.addAttribute("locationHouseList", houseService.findByLocation(location, Constant.INDEX_HOUSE_LOCATION_NUM));
        //增加地理位置信息
        model.addAttribute("userLocation", location);

        return "front/index";
    }


}
