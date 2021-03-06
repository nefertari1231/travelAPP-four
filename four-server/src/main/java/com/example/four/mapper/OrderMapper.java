package com.example.four.mapper;

import com.example.four.entity.Order;
import com.example.four.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper extends MyMapper<Order> {
    void insertOrder(Order order);

    List<Order> getOrderByUserId(Integer userId);
}
