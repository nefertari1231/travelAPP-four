package com.example.four.Controller;

import com.alibaba.fastjson.JSON;
import com.example.four.service.ServerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ServerControllerTest {

    @Autowired
    private ServerService serverService;

    @Test
    public void getAllServerTest(){
        System.out.println(JSON.toJSONString(serverService.getAllServers()));
    }
}
