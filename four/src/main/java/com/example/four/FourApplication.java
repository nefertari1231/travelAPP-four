package com.example.four;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@SpringBootApplication
@tk.mybatis.spring.annotation.MapperScan(basePackages = "com.example.four.mapper")
public class FourApplication  extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(FourApplication.class, args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(FourApplication.class);
    }

}

