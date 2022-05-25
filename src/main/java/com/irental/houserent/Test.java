package com.irental.houserent;

import org.springframework.util.ClassUtils;

public class Test {
    public static void main(String[] args) {
        System.out.println(ClassUtils.getDefaultClassLoader().getResource("static").getPath().replaceFirst("/", "") + "static/uploads/");
    }
}
