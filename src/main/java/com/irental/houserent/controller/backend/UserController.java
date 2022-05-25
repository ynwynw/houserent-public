package com.irental.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.constant.Base;
import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.common.enums.UserStatusEnum;
import com.irental.houserent.common.util.PageUtil;
import com.irental.houserent.entity.User;
import com.irental.houserent.service.UserService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Objects;

/*
 * 用户控制器
 * */
@Controller
@RequiresRoles(Base.ROLE_ADMIN)
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    /*
     * 用户列表
     * */
    @RequestMapping("/admin/user")
    public String user(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "6") Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        User condition = new User();
        Page<User> userPage = userService.findAll(page, condition);
        model.addAttribute("pageInfo", userPage);
        model.addAttribute("pagePrefix", "/admin/user?");
        model.addAttribute("tab", "user-list");
        return "admin/user-list";
    }

    /*
     * 禁用用户
     * */
    @RequestMapping("/admin/user/disable")
    @ResponseBody
    public JsonResult disable(@RequestParam("id") Long id) {
        try {
            User user = userService.get(id);
            if (user == null) {
                return JsonResult.error("用户不存在");
            }
            user.setStatus(UserStatusEnum.DISABLE.getValue());
            userService.update(user);
        } catch (Exception e) {
            return JsonResult.error("禁用用户失败");
        }

        return JsonResult.success("禁用用户成功");
    }


    /*
     * 启用用户
     * */
    @RequestMapping("/admin/user/enable")
    @ResponseBody
    public JsonResult enable(@RequestParam("id") Long id) {
        try {
            User user = userService.get(id);
            if (user == null) {
                return JsonResult.error("用户不存在");
            }
            user.setStatus(UserStatusEnum.ENABLE.getValue());
            userService.update(user);
        } catch (Exception e) {
            return JsonResult.error("启用用户失败");
        }

        return JsonResult.success("启用用户成功");
    }

    /*
     * 进入修改密码页面
     * */
    @RequestMapping("/admin/password")
    public String password(Model model) {
        model.addAttribute("tab", "password");
        return "admin/password";
    }

    /*
     * 更新密码
     * */
    @RequestMapping("/admin/password/submit")
    @ResponseBody
    public JsonResult passwordSubmit(@RequestParam("oldPassword") String oldPassword,
                                     @RequestParam("newPassword") String newPassword,
                                     @RequestParam("confirmPassword") String confirmPassword, HttpSession session) {
        if (!Objects.equals(newPassword, confirmPassword)) {
            return JsonResult.error("输入的两次密码不一致");
        }
        User user = userService.get(getLoginUserId());
        if (user == null || !Objects.equals(user.getUserPass(), oldPassword)) {
            return JsonResult.error("旧密码错误");
        }
        user.setUserPass(newPassword);
        userService.update(user);
        session.setAttribute(Constant.SESSION_USER_KEY, userService.get(getLoginUserId()));
        return JsonResult.success("密码修改成功");
    }
}
