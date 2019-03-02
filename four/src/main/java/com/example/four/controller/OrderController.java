package com.example.four.controller;

import com.example.four.VO.CommentVO;
import com.example.four.entity.Discuss;
import com.example.four.entity.Order;
import com.example.four.entity.Server;
import com.example.four.exception.IllegalException;
import com.example.four.service.DiscussService;
import com.example.four.service.OrderService;
import com.example.four.service.ServerService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;

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

    @Autowired
    private DiscussService discussService;

    @PostMapping(value = "/saveOrder")
    @ApiOperation(value = "保存订单", response = Order.class, responseContainer = "list")
    public JSONResult saveOrder(@RequestBody Order order) {

        Server server = new Server();
        server.setServerStatus(1);
        serverService.updateServers(server);

        //保存订单
        order.setCreateTime(new Date());
        orderService.saveOrder(order);

        return JSONResult.ok(order);
    }


    @GetMapping(value = "/comment")
    @ApiOperation(value = "查询全部的评论",response = Discuss.class, responseReference = "list")
    public JSONResult getAllComment(Integer userId) {
        return JSONResult.ok(discussService.getAllComment(userId));
    }

    @GetMapping(value = "/all")
    @ApiOperation(value = "根据userId 查询全部订单", response = Order.class, responseContainer = "list")
    public JSONResult getAllOrderByUser(Integer userId) {
        return JSONResult.ok(orderService.getAllOrders(userId));
    }

    @PostMapping(value = "/toComment")
    @ApiOperation(value = "发布评论")
    public JSONResult toComment(@RequestBody CommentVO commentVO) throws IOException, IllegalException {
        System.out.println(commentVO);
        String img = commentVO.uploadImg();
        Discuss discuss = new Discuss();
        discuss.setDiscussValue(commentVO.getValue());//评分
        discuss.setDiscussImg(img);//图片
        discuss.setOrderSn(commentVO.getOrderId());//订单号
        discuss.setDiscussContent(commentVO.getContent());//内容
        discussService.insertComment(discuss);
        System.out.println(img);
        return JSONResult.ok();
    }

}
