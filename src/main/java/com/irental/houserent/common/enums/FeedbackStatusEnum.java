package com.irental.houserent.common.enums;

/*
 * 反馈状态枚举
 * */
public enum FeedbackStatusEnum {

    /*
     * 状态：0未处理，1已处理
     * */

    NOT_HANDLE(0),

    HAS_HANDLE(1),
    ;

    private Integer value;

    FeedbackStatusEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
