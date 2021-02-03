package com.example.four.mapper;

import com.example.four.entity.Place;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlaceMapper {
    int deleteByPrimaryKey(Integer placeId);

    int insert(Place record);

    int insertSelective(Place record);

    Place selectByPrimaryKey(Integer placeId);

    int updateByPrimaryKeySelective(Place record);

    int updateByPrimaryKey(Place record);

    @Select(value = "SELECT * FROM `place` WHERE cityMenu_id = #{id}")
    List<Place> getAllPlaceByCity(@Param("id") Integer cityMenuId);
}