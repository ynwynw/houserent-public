package com.irental.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;

/*
 * 订单mapper
 * */
@Mapper
public interface GiftcardMapper extends BaseMapper<Order> {
    @Select("select value from t_giftcard where series = #{series} and status = #{status} and end_date>now();")
    Double checkValidGiftcard(@Param("series") String series, @Param("status") Integer status);

    @Update("update t_giftcard set status = #{status} , used_date = #{date} , used_by = #{user} where series = #{series};")
    void redeemGiftcard(@Param("series") String series, @Param("status") Integer status, @Param("date") Date date, @Param("user") String user);

    @Select("select balance from t_user where user_name = #{user};")
    Double currentBalance(@Param("user") String user);

    @Update("update t_user set balance = #{balance} where user_name = #{user};")
    void addToUserBalance(@Param("balance") String balance, @Param("user") String user);
}
