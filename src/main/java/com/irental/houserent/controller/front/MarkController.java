package com.irental.houserent.controller.front;

import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.entity.Mark;
import com.irental.houserent.entity.User;
import com.irental.houserent.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/*
 * 收藏控制器
 * */
@Controller
public class MarkController extends BaseController {
    @Autowired
    private MarkService markService;
    /*
     * 收藏提交
     * */

    @RequestMapping(value = "/mark/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submit(@RequestParam("houseId") Long houseId) {
        //判断用户是否已登录
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("请先登录");
        }
        //判断是否已经收藏过
        List<Mark> markList = markService.findByUserIdAndHouseId(loginUser.getId(), houseId);
        if (markList != null && markList.size() > 0) {
            return JsonResult.error("您已收藏过了。");
        }
        Mark mark = new Mark();
        mark.setCreateTime(new Date());
        mark.setUserId(loginUser.getId());
        mark.setHouseId(houseId);
        markService.insert(mark);
        return JsonResult.success("收藏成功！");
    }
}
