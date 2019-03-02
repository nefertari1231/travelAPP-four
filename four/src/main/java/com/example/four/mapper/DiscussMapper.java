package com.example.four.mapper;

import com.example.four.entity.Discuss;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiscussMapper {
    int deleteByPrimaryKey(Integer discussId);

    int insert(Discuss record);

    int insertSelective(Discuss record);

    Discuss selectByPrimaryKey(Integer discussId);

    int updateByPrimaryKeySelective(Discuss record);

    int updateByPrimaryKey(Discuss record);

    @Select(value = "SELECT * FROM `discuss` WHERE order_sn in (SELECT order_sn FROM `order` WHERE order_sn in (SELECT order_sn FROM `server` WHERE user_id = #{userId" +
            "" +
            "}))")
    List<Discuss> getAllByUser(@Param("userId") Integer userId);
}