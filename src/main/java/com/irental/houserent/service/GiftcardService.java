package com.irental.houserent.service;

import com.irental.houserent.common.base.BaseService;
import com.irental.houserent.entity.Giftcard;

import java.util.Date;

/*
 * 用户服务接口
 * */
public interface GiftcardService extends BaseService<Giftcard, Long> {

    Double checkValidGiftcard(String series, Integer status);

    void redeemGiftcard(String series, Integer status, Date date, String user);

    Double currentBalance(String user);

    void addToUserBalance(String balance, String user);
}
