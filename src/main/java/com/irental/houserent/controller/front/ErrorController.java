package com.irental.houserent.controller.front;

import com.irental.houserent.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 * 转向错误页面的控制器
 * */
@Controller
public class ErrorController extends BaseController {
    /*
     * 页面未找到 404 not found
     * */
    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String to404() {
        return "common/404";
    }

    /*
     * 页面未找到 403 没有权限
     * */
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String to403() {
        return "common/403";
    }

    /*
     * 页面未找到 500 服务器错误
     * */
    @RequestMapping(value = "/500", method = RequestMethod.GET)
    public String to500() {
        return "common/500";
    }

    /*
     * ERROR 通用错误
     * */
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error() {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (statusCode.equals("404")) {
            return "redirect:/404";
        } else if (statusCode.equals("500")) {
            return "redirect:/500";
        }
        return "common/error";
    }
}
