package com.irental.houserent.common.base;

import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.enums.UserRoleEnum;
import com.irental.houserent.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

//所有controller控制器的基类
@Controller
public class BaseController {
    @Autowired
    protected HttpServletRequest request;

    /*
     * 获取当前登录用户
     * */
    public User getLoginUser() {
        User user = (User) request.getSession().getAttribute(Constant.SESSION_USER_KEY);
        return user;
    }


    /*
     * 获取当前用户ID
     * */
    public Long getLoginUserId() {
        User user = getLoginUser();
        if (user == null) {
            return null;
        }
        return user.getId();
    }

    /*
     * 判断当前用户是管理员
     * */
    public Boolean loginUserIsAdmin() {
        User user = getLoginUser();
        if (user == null) {
            return false;
        }
        return UserRoleEnum.ADMIN.getValue().equalsIgnoreCase(user.getRole());
    }

    /*
     * 判断当前用户是租客
     * */
    public Boolean loginUserIsCustomer() {
        User user = getLoginUser();
        if (user == null) {
            return false;
        }
        return UserRoleEnum.CUSTOMER.getValue().equalsIgnoreCase(user.getRole());
    }

    /*
     * 判断当前用户是房东
     * */
    public Boolean loginUserIsOwner() {
        User user = getLoginUser();
        if (user == null) {
            return false;
        }
        return UserRoleEnum.OWNER.getValue().equalsIgnoreCase(user.getRole());
    }


    /*
     * 渲染404页面
     * */
    public String renderNotFound() {
        return "forward:/404";
    }

    /*
     * 渲染403页面 无权限
     * */
    public String renderNotAllowAccess() {
        return "forward:/403";
    }

    /*
     * 渲染500页面
     * */
    public String renderServerException() {
        return "forward:/500";
    }

    /*
     * 其他异常
     * */
    public String renderError() {
        return "forward:/error";
    }

}
