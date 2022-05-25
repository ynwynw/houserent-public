package com.irental.houserent.controller.backend;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.base.BaseController;
import com.irental.houserent.common.constant.Constant;
import com.irental.houserent.common.dto.JsonResult;
import com.irental.houserent.common.enums.HouseStatusEnum;
import com.irental.houserent.common.util.PageUtil;
import com.irental.houserent.entity.House;
import com.irental.houserent.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/*
 * 房屋控制器
 * */
@Controller("backendHouseController")
@RequestMapping("/admin/house")
public class HouseController extends BaseController {
    @Autowired
    private HouseService houseService;

    /*
     * 进入房屋管理页面
     * */
    @RequestMapping("")
    public String houseList(@RequestParam(value = "page", defaultValue = "1") Long pageNumber, @RequestParam(value = "size", defaultValue = "6") Long pageSize, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        House condition = new House();
        //如果登录用户是管理员，可以查询所有房屋；如果登录用户不是管理员，可以查询自己上传的房屋。
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        Page<House> housePage = houseService.findAll(page, condition);
        model.addAttribute("pageInfo", housePage);
        model.addAttribute("pagePrefix", "/admin/house?");
        model.addAttribute("isAdmin", loginUserIsAdmin());
        model.addAttribute("tab", "house-list");
        return "admin/house-list";
    }

    /*
     * 进入房屋发布页面
     * */
    @RequestMapping("/publish")
    public String publish(@RequestParam(value = "id", required = false) Long id, Model model) {
        House house = new House();
        //编辑功能，ID!=NULL
        if (id != null) {
            house = houseService.get(id);
            if (house == null) {
                return renderNotFound();
            }
            //如果无管理员权限编辑别人的房屋，跳转到403页面
            if (!loginUserIsAdmin() && Objects.equals(house.getUserId(), getLoginUserId())) {
                return renderNotAllowAccess();
            }
        }
        model.addAttribute("house", house);
        return "admin/house-publish";
    }

    /*
     * 发布房屋提交
     * */
    @RequestMapping("/publish/submit")
    @ResponseBody
    public JsonResult publishSubmit(House house, @RequestParam("key") String key, HttpSession session) {
        try {
            if (house.getId() == null) {  //如果为空，新增；
                house.setCreateTime(new Date());
                house.setUserId(getLoginUserId());
            } else {  //修改
                House queryHouse = houseService.get(house.getId());
                if (queryHouse == null) {
                    return JsonResult.error("发布失败，未找到此房屋");
                }
                //如果无管理员权限编辑别人的房屋，跳转到403页面
                if (!loginUserIsAdmin() && Objects.equals(house.getUserId(), getLoginUserId())) {
                    return JsonResult.error("发布失败，无法编辑他人房屋信息。");
                }
            }
            house.setStatus(HouseStatusEnum.NOT_CHECK.getValue());
            //获取轮播图
            String sessionKey = Constant.SESSION_IMG_PREFIX + key;
            List<String> imgList = (List<String>) session.getAttribute(sessionKey);
            if (imgList != null && imgList.size() > 0) {
                //设置轮播图，转换成JSON格式存储
                house.setSlideUrl(JSON.toJSONString(imgList));
                //将第一个图放到缩略图中
                house.setThumbnailUrl(imgList.get(0));
            }
            houseService.insertOrUpdate(house);
        } catch (Exception e) {
            return JsonResult.error("发布失败，请填写完整信息");
        }
        return JsonResult.success("发布成功", house.getId());
    }


    /*
     * 下架房屋提交
     * */
    @RequestMapping("/down")
    @ResponseBody
    public JsonResult downHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("下架失败，没有选择的房屋。");
            }
            //如果无管理员权限下架别人的房屋，跳转到403页面
            if (!loginUserIsAdmin() && Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("下架失败，无法下架他人房屋信息。");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("房屋正在租住中，不能下架");
            }
            house.setStatus(HouseStatusEnum.HAS_DOWN.getValue());
            houseService.update(house);
        } catch (Exception e) {
            return JsonResult.error("下架房屋失败，请重试。");
        }

        return JsonResult.success("下架成功！");
    }


    /*
     * 上架房屋提交
     * */
    @RequestMapping("/up")
    @ResponseBody
    public JsonResult upHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("上架失败，没有选择的房屋。");
            }
            //如果无管理员权限上架别人的房屋，跳转到403页面
            if (!loginUserIsAdmin() && Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("上架失败，无法上架他人房屋信息。");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("房屋正在租住中，不能进行上架操作。");
            }
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            return JsonResult.error("上架房屋失败，请重试。");
        }

        return JsonResult.success("上架成功！");
    }


    /*
     * 房屋审核通过
     * */
    @RequestMapping("/checkPass")
    @ResponseBody
    public JsonResult checkPassHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("审核失败，您未选中需要审核的房屋");
            }
            //仅限管理员有权限审核
            if (!loginUserIsAdmin()) {
                return JsonResult.error("您无权限审核房屋信息");
            }
            if (!Objects.equals(house.getStatus(), HouseStatusEnum.NOT_CHECK.getValue())) {
                return JsonResult.error("房屋状态不为待审核状态，无法审核。");
            }
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            return JsonResult.error("审核房屋信息失败，请重试。");
        }

        return JsonResult.success("审核成功！");
    }


    /*
     * 房屋审核拒绝
     * */
    @RequestMapping("/checkReject")
    @ResponseBody
    public JsonResult checkRejectHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("审核失败，您未选中需要审核的房屋。");
            }
            //仅限管理员有权限审核
            if (!loginUserIsAdmin()) {
                return JsonResult.error("您无权限审核房屋信息");
            }
            if (!Objects.equals(house.getStatus(), HouseStatusEnum.NOT_CHECK.getValue())) {
                return JsonResult.error("房屋状态不为待审核状态，无法审核。");
            }
            house.setStatus(HouseStatusEnum.CHECK_REJECT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            return JsonResult.error("审核房屋信息失败，请重试。");
        }

        return JsonResult.success("审核成功！");
    }


    /*
     * 删除房屋
     * */
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult deleteHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("删除失败，未找到房屋。");
            }
            //仅限管理员和房屋所有人有权限删除
            if (!loginUserIsAdmin() && Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("您无权限删除此房屋");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("房屋状态已租住，无法删除。");
            }
            houseService.delete(id);
        } catch (Exception e) {
            return JsonResult.error("删除房屋信息失败，请重试。");
        }

        return JsonResult.success("删除成功！");
    }

}
