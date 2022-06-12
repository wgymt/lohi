package com.wgymt.lohi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com/wgymt/lohi/mapper")
@SpringBootApplication
public class LohiApplication {

    public static void main(String[] args) {
        SpringApplication.run(LohiApplication.class, args);
    }

}
