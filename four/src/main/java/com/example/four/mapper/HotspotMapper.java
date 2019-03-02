package com.example.four.mapper;

import com.example.four.entity.Hotspot;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HotspotMapper {
    int deleteByPrimaryKey(Integer hotspotId);

    int insert(Hotspot record);

    int insertSelective(Hotspot record);

    Hotspot selectByPrimaryKey(Integer hotspotId);

    int updateByPrimaryKeySelective(Hotspot record);

    int updateByPrimaryKey(Hotspot record);

    @Select(value = "SELECT * FROM `hotspot` WHERE cityMenu_id = #{id}")
    List<Hotspot> getAllHotspotsByCity(@Param("id") Integer cityMenuId);
}