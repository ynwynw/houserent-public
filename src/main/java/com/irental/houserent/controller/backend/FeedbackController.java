package com.irental.houserent.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.common.util.PageUtil;
import com.irental.houserent.entity.Feedback;
import com.irental.houserent.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Objects;

/*
 * 后端反馈控制器
 * */
@Controller("backFeedbackController")
public class FeedbackController extends BaseController {
    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping("/admin/feedback")
    public String feedback(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "6") Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Feedback condition = new Feedback();
        //如果不是管理员，只查询自己的反馈
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        Page<Feedback> feedbackPage = feedbackService.findAll(page, condition);
        model.addAttribute("pageInfo", feedbackPage);
        model.addAttribute("pagePrefix", "/news?");
        model.addAttribute("tab", "feedback-list");
        model.addAttribute("isAdmin", loginUserIsAdmin());
        return "admin/feedback-list";
    }


    @RequestMapping(value = "/admin/feedback/reply/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult replySubmit(Feedback feedback) {
        feedbackService.update(feedback);
        return JsonResult.success("保存成功");
    }


    /*
     * 删除反馈
     * */
    @RequestMapping("/admin/feedback/delete")
    @ResponseBody
    public JsonResult deleteFeedback(@RequestParam("id") Long id) {
        try {
            Feedback feedback = feedbackService.get(id);
            if (feedback == null) {
                return JsonResult.error("删除失败，未找到反馈。");
            }
            if (!loginUserIsAdmin() && !Objects.equals(feedback.getUserId(), getLoginUserId())) {
                return JsonResult.error("无权限");
            }
            feedbackService.delete(id);
        } catch (Exception e) {
            return JsonResult.error("删除反馈信息失败，请重试。");
        }

        return JsonResult.success("删除成功！");
    }


}
