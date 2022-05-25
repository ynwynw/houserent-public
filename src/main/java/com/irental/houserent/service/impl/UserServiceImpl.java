package com.irental.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.User;
import com.irental.houserent.mapper.UserMapper;
import com.irental.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/*
 * 用户服务接口实现
 * */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /*
     * mapper对象
     * */
    @Override
    public BaseMapper<User> getRepository() {
        return userMapper;
    }

    @Override
    public QueryWrapper<User> getQueryWrapper(User user) {
        return null;
    }

    @Override
    public QueryWrapper<User> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public User findByUserName(String userName) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_name", userName);
        return userMapper.selectOne(queryWrapper);
    }

    @Override
    public String findAllUserNums() {
        return userMapper.findAllUserNums();
    }

    @Override
    public String findOwnerNums() {
        return userMapper.findOwnerNums();
    }

    @Override
    public String userFeedbackCount() {
        return userMapper.userFeedbackCount();
    }

    @Override
    public Double getUserBlance(Long user) {
        return userMapper.getUserBlance(user);
    }

    @Override
    public void updateUserBalance(Double balance, String user) {
        userMapper.updateUserBalance(balance, user);
    }


}
