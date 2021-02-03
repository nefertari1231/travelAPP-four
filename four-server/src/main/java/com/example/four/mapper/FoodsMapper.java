package com.example.four.mapper;

import com.example.four.entity.Foods;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FoodsMapper {
    int deleteByPrimaryKey(Integer foodsId);

    int insert(Foods record);

    int insertSelective(Foods record);

    Foods selectByPrimaryKey(Integer foodsId);

    int updateByPrimaryKeySelective(Foods record);

    int updateByPrimaryKey(Foods record);

    @Select(value = "SELECT * FROM `foods` WHERE cityMenu_id = #{id}")
    List<Foods> getAllFoodsByCity(@Param("id") Integer cityMenuId);
}