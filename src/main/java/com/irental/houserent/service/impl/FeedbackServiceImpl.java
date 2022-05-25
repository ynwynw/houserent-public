package com.irental.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.Feedback;
import com.irental.houserent.mapper.FeedbackMapper;
import com.irental.houserent.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/*
 * 用户反馈service 实现类
 * */
@Service
public class FeedbackServiceImpl implements FeedbackService {
    @Autowired
    private FeedbackMapper feedbackMapper;

    @Override
    public BaseMapper<Feedback> getRepository() {
        return feedbackMapper;
    }

    @Override
    public QueryWrapper<Feedback> getQueryWrapper(Feedback feedback) {
        QueryWrapper<Feedback> queryWrapper = new QueryWrapper<>();
        if (feedback != null && feedback.getUserId() != null) {
            queryWrapper.eq("user_id", feedback.getUserId());
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<Feedback> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }
}
