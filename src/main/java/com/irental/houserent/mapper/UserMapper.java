package com.irental.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.irental.houserent.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/*
 * 用户数据访问层
 * */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /*
     * Admin页面获取用户总数
     * */
    @Select("select count(id) as user_num from t_user;")
    String findAllUserNums();

    @Select("select count(id) as owner_num from t_user where role = 'owner';")
    String findOwnerNums();

    @Select("select count(id) as feedback_num from t_feedback;")
    String userFeedbackCount();

    @Select("select balance from t_user where id = #{user};")
    Double getUserBlance(Long user);

    @Update("update t_user set balance = #{balance} where user_name = #{user};")
    void updateUserBalance(Double balance, String user);
}
