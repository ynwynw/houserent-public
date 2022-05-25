package com.irental.houserent.controller.backend;

import com.alibaba.fastjson.JSON;
import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.entity.User;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/*
 * 个人信息管理控制器
 * */
@Controller
@RequestMapping("/admin/profile")
public class ProfileController extends BaseController {
    @Autowired
    private UserService userService;

    /*
     * 个人信息页面
     * */
    @RequestMapping("")
    public String profile(Model model) {
        User user = getLoginUser();
        model.addAttribute("user", user);
        model.addAttribute("tab", "my-profile");
        return "admin/my-profile";
    }

    /*
     * 个人信息保存提交
     * */
    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submitProfile(User user, HttpSession session, @RequestParam("key") String key) {
        user.setId(getLoginUserId());
        userService.update(user);
        //获取上传的用户头像
        String sessionKey = Constant.SESSION_IMG_PREFIX + key;
        List<String> imgList = (List<String>) session.getAttribute(sessionKey);
        if (imgList != null && imgList.size() > 0) {
            //设置头像，转换成JSON格式存储
            user.setUserAvatar(JSON.toJSONString(imgList));
            //将第一个图设置为头像
            user.setUserAvatar(imgList.get(0));
        }
        userService.insertOrUpdate(user);
        session.setAttribute(Constant.SESSION_USER_KEY, userService.get(getLoginUserId()));
        return JsonResult.success("保存成功");
    }

}
