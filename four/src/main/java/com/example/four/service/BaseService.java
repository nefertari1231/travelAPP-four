package com.example.four.service;

import com.example.four.mapper.UserMapper;
import com.google.common.collect.ImmutableSet;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;

import java.util.Set;

public class BaseService<Mapp extends Mapper<M>, M>{

    private static final Set<String> EMPTY_STRING=ImmutableSet.of("null","undefined");

    @Autowired
    public UserMapper userMapper;

}

