package com.irental.houserent.common.enums;

/*
 * 礼品卡状态枚举
 * */
public enum GiftcardStatusEnum {
    /*
     * 正常 可以使用的礼品卡
     * */
    NORMAL(1),
    /*
     * 已使用过的礼品卡
     * */
    USED(-1),
    /*
     * 已过期的礼品卡
     * */
    EXPIRED(0),
    ;

    private Integer value;

    GiftcardStatusEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }


}
