package com.irental.houserent.service;

import com.irental.houserent.common.base.BaseService;
import com.irental.houserent.entity.User;

/*
 * 用户服务接口
 * */
public interface UserService extends BaseService<User, Long> {

    /*
     * 根据用户名查询用户
     * */
    User findByUserName(String userName);

    String findAllUserNums();

    String findOwnerNums();

    String userFeedbackCount();

    Double getUserBlance(Long user);

    void updateUserBalance(Double balance, String user);
}
