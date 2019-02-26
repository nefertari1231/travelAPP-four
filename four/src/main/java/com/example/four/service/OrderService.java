package com.example.four.service;

import com.example.four.entity.Order;
import com.example.four.mapper.OrderMapper;
import com.example.four.utils.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService extends BaseService<OrderMapper, Order>{

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private Sid sid;

    public void saveOrder(Order order) {

        String orderId = sid.nextShort();

        order.setOrderId(orderId);

        orderMapper.inserOrder(order);

    }

    public List<Order> getAllOrders(Integer userId) {
        return orderMapper.getOrderByUserName(new Order(userId));
    }
}
