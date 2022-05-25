package com.irental.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.irental.houserent.common.vo.HouseSearchVO;
import com.irental.houserent.entity.House;
import com.irental.houserent.mapper.HouseMapper;
import com.irental.houserent.service.HouseService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 * 房屋服务接口实现
 * */
@Service
public class HouseServiceImpl implements HouseService {
    @Autowired
    private HouseMapper houseMapper;

    /*
     * mapper对象
     * */
    @Override
    public BaseMapper<House> getRepository() {
        return houseMapper;
    }

    @Override
    public QueryWrapper<House> getQueryWrapper(House house) {
        QueryWrapper<House> queryWrapper = new QueryWrapper<>();
        if (house != null && house.getUserId() != null) {
            queryWrapper.eq("user_id", house.getUserId());
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<House> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public List<House> findByUserIdAndCertificateNoAndRentType(Long userId, String certificateNo, String rentType) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("certificate_no", certificateNo);
        queryWrapper.eq("rent_type", rentType);
        return houseMapper.selectList(queryWrapper);
    }

    /*
     * rentType 租房类型
     * limit 限制多少条
     * */
    @Override
    public List<House> findTopList(String rentType, Integer limit) {
        return houseMapper.findTopList(rentType, limit);
    }

    @Override
    public List<House> findByLocation(String location, Integer limit) {
        return houseMapper.findByLocation(location, limit);
    }

    /*
     * 获取房屋分页数据
     * */
    @Override
    public Page<House> getHousePage(HouseSearchVO houseSearchVO, Page<House> page) {
        if (houseSearchVO == null) {
            houseSearchVO = new HouseSearchVO();
        } else {
            //价格范围
            String priceRange = houseSearchVO.getPriceRange();
            Integer minPrice = 0;
            Integer maxPrice = 20000;
            if (StringUtils.isNotEmpty(priceRange)) {
                String[] arr = priceRange.split(";");
                if (arr.length == 2) {
                    minPrice = Integer.valueOf(arr[0]);
                    maxPrice = Integer.valueOf(arr[1]);
                }
            }
            houseSearchVO.setMaxPrice(maxPrice);
            houseSearchVO.setMinPrice(minPrice);

            //面积范围
            String areaRange = houseSearchVO.getAreaRange();
            Integer minArea = 0;
            Integer maxArea = 20000;
            if (StringUtils.isNotEmpty(areaRange)) {
                String[] arr = areaRange.split(";");
                if (arr.length == 2) {
                    minArea = Integer.valueOf(arr[0]);
                    maxArea = Integer.valueOf(arr[1]);
                }
            }
            houseSearchVO.setMaxArea(maxArea);
            houseSearchVO.setMinArea(minArea);
        }
        List<House> list = houseMapper.searchHouse(houseSearchVO, page);
        page.setRecords(list);
        return page;
    }

    @Override
    public String houseCount() {
        return houseMapper.houseCount();
    }
}
