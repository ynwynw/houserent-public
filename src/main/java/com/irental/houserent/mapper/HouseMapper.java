package com.irental.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.vo.HouseSearchVO;
import com.irental.houserent.entity.House;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/*
 * 房屋数据访问层
 * */
@Mapper
public interface HouseMapper extends BaseMapper<House> {
    /*
     * 根据租房类型获取最新的N条房屋信息
     * 简单类可以直接通过注解方式来写
     * */
    @Select("select * from t_house where status = 0 and rent_type = #{rentType} order by create_time desc limit #{limit}")
    List<House> findTopList(@Param("rentType") String rentType, @Param("limit") Integer limit);

    /*
     * 搜索房屋
     * 一个参数的时候可以不写@Param，两个或两个以上必须要写@param
     * 复杂点的SQL，最好写在XML中，HouseMapper.xml
     * */
    List<House> searchHouse(@Param("houseSearchVO") HouseSearchVO houseSearchVO, @Param("page") Page page);

    /*
     * 根据所在城市进行搜索房屋
     * */
    @Select("select * from t_house where status = 0 and city = #{location} order by create_time desc limit #{limit}")
    List<House> findByLocation(@Param("location") String location, @Param("limit") Integer limit);

    /*
     * 管理员面板数据展示 - 上线房屋数量
     * */
    @Select("select count(id) from t_house where status = 0;")
    String houseCount();
}
