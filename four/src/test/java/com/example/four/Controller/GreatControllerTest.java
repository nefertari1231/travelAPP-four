package com.example.four.Controller;

import com.alibaba.fastjson.JSON;
import com.example.four.VO.GreatVO;
import com.example.four.entity.Great;
import com.example.four.service.GreatService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GreatControllerTest {

    @Autowired
    private GreatService greatServer;

    /**
     * 点赞测试
     */
    @Test
    public void greatTest() {
        greatServer.great(new Great(5,"190225K36DBA6GF8"));
    }

    /**
     * 用户所有收到的赞
     */
    @Test
    public void getAllGreatsByUser() {
        List<GreatVO> allGreats = greatServer.getAllGreats(5);
        System.out.println(JSON.toJSONString(allGreats));
    }
}
