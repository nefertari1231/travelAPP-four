package com.example.four.controller;

import com.example.four.entity.Order;
import com.example.four.entity.Server;
import com.example.four.service.OrderService;
import com.example.four.service.ServerService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/order", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/order", tags ="orderApi", description = "订单接口")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ServerService serverService;

    @PostMapping(value = "/saveOrder")
    @ApiOperation(value = "保存订单", response = Order.class, responseContainer = "list")
    public JSONResult register(@RequestBody Order order,String serverId) {

        Server server = new Server();
        server.setServerId(serverId);
        server.setServerStatus(1);
        serverService.updateServers(server);

        //保存订单
        order.setBuyerName(order.getBuyerName());
        order.setBuyerPhone(order.getBuyerPhone());
        order.setBuyerCount(order.getBuyerCount());
        order.setOrderAmount(order.getOrderAmount());
        order.setBuyerTalk(order.getBuyerTalk());
        order.setUserId(order.getUserId());
        order.setCreateTime(new Date());
        orderService.saveOrder(order);

        return JSONResult.ok(order);
    }

//    @PostMapping(value = "/saveOrderSn")
//    @ApiOperation(value = "保存订单编号", response = Order.class, responseContainer = "list")
//    public static String getOrderSn() {
//        Date date=new Date();
//        DateFormat format = new SimpleDateFormat("yyyyMMdd");
//        String time = format.format(date);
//        int hashCodeV = UUID.randomUUID().toString().hashCode();
//        if (hashCodeV < 0) {//有可能是负数
//            hashCodeV = -hashCodeV;
//        }
//        // 0 代表前面补充0
//        // 4 代表长度为4
//        // d 代表参数为正数型
//        String order_sn = time + String.format("%011d", hashCodeV)
//        return order_sn;
//    }

    @GetMapping(value = "/all")
    @ApiOperation(value = "根据userId 查询全部订单", response = Order.class, responseContainer = "list")
    public JSONResult getAllOrderByUser(Integer userId) {
        return JSONResult.ok(orderService.getAllOrders(userId));
    }

}
