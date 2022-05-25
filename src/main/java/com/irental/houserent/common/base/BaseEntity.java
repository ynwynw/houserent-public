package com.irental.houserent.common.base;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/*
 * 所有实体类公共的属性
 * */
@Data
public class BaseEntity implements Serializable {
    /*
     * ID,主键，自增自动生成
     * */
    @TableId(type = IdType.AUTO)
    private Long id;
    /*
     * 创建时间
     * */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;


}
