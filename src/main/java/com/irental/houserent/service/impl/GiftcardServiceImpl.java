package com.irental.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.Giftcard;
import com.irental.houserent.mapper.GiftcardMapper;
import com.irental.houserent.service.GiftcardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

@Service
public class GiftcardServiceImpl implements GiftcardService {
    @Autowired
    private GiftcardMapper giftcardMapper;

    @Override
    public BaseMapper<Giftcard> getRepository() {
        return null;
    }

    @Override
    public QueryWrapper<Giftcard> getQueryWrapper(Giftcard giftcard) {
        return null;
    }

    @Override
    public QueryWrapper<Giftcard> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public Double checkValidGiftcard(String series, Integer status) {
        return giftcardMapper.checkValidGiftcard(series, status);
    }

    @Override
    public void redeemGiftcard(String series, Integer status, Date date, String user) {
        giftcardMapper.redeemGiftcard(series, status, date, user);
    }

    @Override
    public Double currentBalance(String user) {
        return giftcardMapper.currentBalance(user);
    }

    @Override
    public void addToUserBalance(String balance, String user) {
        giftcardMapper.addToUserBalance(balance, user);
    }
}
