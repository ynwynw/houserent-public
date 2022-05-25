package com.irental.houserent;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.TimeZone;

@Slf4j
@SpringBootApplication
@EnableScheduling
@MapperScan("com.irental.houserent.mapper")
public class Application {
    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
        ApplicationContext context = SpringApplication.run(Application.class, args);
        String serverPort = context.getEnvironment().getProperty("server.port");
        log.info("House rental system started at http://localhost:" + serverPort);
    }

}
