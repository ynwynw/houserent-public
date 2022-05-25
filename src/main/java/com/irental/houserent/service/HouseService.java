package com.irental.houserent.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.base.BaseService;
import com.irental.houserent.common.vo.HouseSearchVO;
import com.irental.houserent.entity.House;

import java.util.List;

/*
 * 房屋服务接口
 * */
public interface HouseService extends BaseService<House, Long> {
    /*
     * 根据用户ID和房产证号查询合租房屋
     * */
    List<House> findByUserIdAndCertificateNoAndRentType(Long userId, String certificateNo, String rentType);

    /*
     * 根据出租类型获取到最小的N条房屋信息
     * */
    List<House> findTopList(String rentType, Integer limit);

    /*
     * 根据用户所在的位置（城市）获取N条房屋信息
     * */
    List<House> findByLocation(String location, Integer limit);

    /*
     * 获取房屋的分页数据
     * */
    Page<House> getHousePage(HouseSearchVO houseSearchVO, Page<House> page);

    /*
     * 管理员面板获取上线房屋数量
     * */
    String houseCount();
}
