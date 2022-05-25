package com.irental.houserent.common.enums;

/*
 * 房屋出租类型枚举
 * */
public enum HouseRentTypeEnum {
    /*
     * 整租
     * */
    WHOLE("whole"),
    /*
     * 房东
     * */
    SHARE("share"),
    ;

    private String value;

    HouseRentTypeEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }


}
