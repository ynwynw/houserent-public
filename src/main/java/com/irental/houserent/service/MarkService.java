package com.irental.houserent.service;

import com.irental.houserent.common.base.BaseService;
import com.irental.houserent.entity.Mark;

import java.util.List;

/*
 * 收藏Service接口
 * */
public interface MarkService extends BaseService<Mark, Long> {

    /*
     * 根据用户ID和房屋ID查询该用户是否已经收藏过该房屋
     * */
    List<Mark> findByUserIdAndHouseId(Long userId, Long houseId);
}
