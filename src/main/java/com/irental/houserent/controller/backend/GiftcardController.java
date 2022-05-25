package com.irental.houserent.controller.backend;

import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.common.enums.GiftcardStatusEnum;
import com.irental.houserent.entity.User;
import com.irental.houserent.service.GiftcardService;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Objects;

@Controller
@RequestMapping("/admin/giftcard")
public class GiftcardController extends BaseController {
    @Autowired
    private UserService userService;

    @Autowired
    private GiftcardService giftcardService;

    /*
     * 充值兑换余额到账户
     * */
    @RequestMapping("/redeem")
    @ResponseBody
    public JsonResult redeem(@RequestParam("series") String series) {
        if(series.equals("")){
            return JsonResult.error("请填写礼品卡代码或PIN！");
        }
        User user = userService.get(getLoginUserId());
        if (user == null) {
            return JsonResult.error("您还未登录！");
        }
        //判断序列号 是否存在、有效
        Double redeem_value = giftcardService.checkValidGiftcard(series, GiftcardStatusEnum.NORMAL.getValue());
        if (Objects.equals(redeem_value, null) || Objects.equals(redeem_value, "")) {
            return JsonResult.error("兑换码不存在或已被使用或已到期");
        }
        Date date = new Date();
        //进行兑换，将礼品卡设置为 status = -1已使用并且，将使用者设置为当前用户
        giftcardService.redeemGiftcard(series, GiftcardStatusEnum.USED.getValue(), date, user.getUserName());
        Double currentBalance = giftcardService.currentBalance(user.getUserName());

        String afterBalance = String.format("%.2f", redeem_value + currentBalance);
        giftcardService.addToUserBalance(afterBalance, user.getUserName());

        return JsonResult.success("兑换成功！礼品卡为您兑换了" + redeem_value + "元");
    }
}
