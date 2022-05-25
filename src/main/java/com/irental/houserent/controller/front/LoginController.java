package com.irental.houserent.controller.front;

import com.irental.houserent.common.constant.Base;
import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.constant.ResultCode;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.common.enums.UserStatusEnum;
import com.irental.houserent.entity.User;
import com.irental.houserent.oauth.OAuthSessionManager;
import com.irental.houserent.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/*
 * 登录相关的控制器
 * */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;

    /*
     * 注册提交
     * */
    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult loginSubmit(User user, HttpSession session) {
        try {
            if (user == null) {
                return JsonResult.error("非法访问，请重试！");
            }
            String userName = user.getUserName();
            String password = user.getUserPass();
            User user1 = userService.findByUserName(user.getUserName());
            if (user1 == null) {
                return JsonResult.error("用户不存在，请重试。");
            }
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
            // 进行验证,然后返回对应信息
            subject.login(token);
            User currentUser = userService.findByUserName(userName);
            subject.getSession().setAttribute(Constant.SESSION_USER_KEY, currentUser);
        //判断密码是否正确
        if (!user.getUserPass().equals(user1.getUserPass())) {
            return JsonResult.error("密码错误，请重试。");
        }
        if (UserStatusEnum.DISABLE.getValue().equals(user1.getStatus())) {
            return JsonResult.error("账户已被锁定，请联系我们获取更多帮助。");
        }
        //session.setAttribute(Constant.SESSION_USER_KEY, user1);
        } catch (UnknownAccountException e) {
            JsonResult.error(ResultCode.USER_NOT_EXIST.code().toString(),ResultCode.USER_NOT_EXIST.message());
        } catch (LockedAccountException e) {
            JsonResult.error(ResultCode.USER_ACCOUNT_FORBIDDEN.code().toString(),ResultCode.USER_ACCOUNT_FORBIDDEN.message());
        } catch (AuthenticationException e) {
            JsonResult.error(ResultCode.USER_LOGIN_ERROR.code().toString(),ResultCode.USER_LOGIN_ERROR.message());
        } catch (Exception e) {
            JsonResult.error(ResultCode.ERROR.code().toString(),ResultCode.ERROR.message());
        }
        return JsonResult.success("登录成功！");
    }

    /*
     * 退出登录，返回首页
     * */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        Subject subject = SecurityUtils.getSubject();
        subject.getSession().removeAttribute(Constant.SESSION_USER_KEY);
        subject.logout();
        //session.removeAttribute(Constant.SESSION_USER_KEY);
        //session.invalidate();
        return "redirect:/";
    }
}
