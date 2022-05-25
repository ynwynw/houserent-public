package com.irental.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.Mark;
import com.irental.houserent.mapper.MarkMapper;
import com.irental.houserent.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 * 实现类 收藏Service
 * */
@Service
public class MarkServiceImpl implements MarkService {
    @Autowired
    private MarkMapper markMapper;

    @Override
    public List<Mark> findByUserIdAndHouseId(Long userId, Long houseId) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("house_id", houseId);
        return markMapper.selectList(queryWrapper);
    }


    @Override
    public BaseMapper<Mark> getRepository() {
        return markMapper;
    }

    @Override
    public QueryWrapper<Mark> getQueryWrapper(Mark mark) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (mark != null) {
            if (mark.getUserId() != null) {
                queryWrapper.eq("user_id", mark.getUserId());
            }
            if (mark.getHouseId() != null) {
                queryWrapper.eq("houseId", mark.getHouseId());
            }
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<Mark> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }


}
