package com.example.four.service;

import com.example.four.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;

public class BaseService<Mapp extends Mapper<M>, M>{

    @Autowired
    public Mapp mapper;

    @Autowired
    public UserMapper userMapper;

}

