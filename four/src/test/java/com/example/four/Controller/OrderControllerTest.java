package com.example.four.Controller;

import com.alibaba.fastjson.JSON;
import com.example.four.entity.Order;
import com.example.four.entity.Server;
import com.example.four.service.OrderService;
import com.example.four.service.ServerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderControllerTest {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ServerService serverService;

    @Test
    public void saveOrderTest() {
        Order order = new Order();
        order.setUserId(5);
        order.setBuyerName("买家姓名");
        order.setBuyerPhone("15673733303");
        order.setBuyerCount("4");
        order.setOrderAmount(BigDecimal.valueOf(400));
        order.setBuyerTalk("留言");
        order.setCreateTime(new Date());
        order.setUpdateTime(new Date());
        order.setOrderSn("sdgfu");
        orderService.saveOrder(order);
    }

    @Test
    public void updateState() {
        Server server = new Server();
        server.setServerId("190225K36DBA6GF8");
        server.setServerStatus(1);
        int i = serverService.updateServers(server);
        System.out.println(i);
    }

    @Test
    public void getAllOrders() {
        List<Order> allOrders = orderService.getAllOrders(5);
        System.out.println(JSON.toJSONString(allOrders));
    }
}
