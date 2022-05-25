package com.irental.houserent.common.enums;

/*
 * 房屋状态枚举
 * */
public enum HouseStatusEnum {

    /*
     * 状态：0未租出/1已租出/-1下架/-2待审核/-3审核不通过
     * */

    NOT_RENT(0),

    HAS_RENT(1),

    HAS_DOWN(-1),

    NOT_CHECK(-2),

    CHECK_REJECT(-3);

    private Integer value;

    HouseStatusEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
