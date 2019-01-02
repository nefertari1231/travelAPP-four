package com.example.four.mapper;

import com.example.four.entity.User;
import com.example.four.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends MyMapper<User> {

    /**
     * @param username
     * @return
     */

    User queryUsername(String username);

    Integer save(User user);

}