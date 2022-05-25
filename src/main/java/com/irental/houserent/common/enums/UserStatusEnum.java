package com.irental.houserent.common.enums;

/*
 * 用户状态枚举
 * */
public enum UserStatusEnum {
    /*
     * 正常
     * */
    ENABLE(1),
    /*
     * 禁用
     * */
    DISABLE(0),

    ;

    private Integer value;

    UserStatusEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }


}
