package com.irental.houserent.common.constant;

import org.springframework.util.ClassUtils;

import java.io.IOException;

/*
 * 常量类
 *
 * */
public class Constant {
    /*
     * 用户Session的key
     * */
    public static final String SESSION_USER_KEY = "user";
    public static final String SESSION_USER_KEY_ID = "session_id";

    /*相对路径*/
    public static final String UPLOADS_ABSOLUTEPATH = "/uploads/";


    /*
     * 上传目录
     * */

    public static final String UPLOADS_PATH = ClassUtils.getDefaultClassLoader().getResource("static").getPath().replaceFirst("/", "") + UPLOADS_ABSOLUTEPATH;


    /*
     * 图片session的前缀
     * */
    public static final String SESSION_IMG_PREFIX = "SESSION_IMG_";

    /*
     * 最小租住天数
     * */
    public static final Integer MIN_RENT_DAYS = 1;

    /*
     * 首页显示房屋数量
     */
    public static final Integer INDEX_HOUSE_NUM = 6;

    /*
     * 首页显示房屋数量 - 定位版
     * */
    public static final Integer INDEX_HOUSE_LOCATION_NUM = 3;

    /*
     * 当天订单退租服务费收取小数（0.00 - 1.00）
     * */
    public static final Double TODAY_ORDER_CANCEL_SERVICE_CHARGE = 0.5;

    public Constant() throws IOException {
    }
}
