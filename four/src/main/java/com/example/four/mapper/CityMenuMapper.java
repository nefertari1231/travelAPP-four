package com.example.four.mapper;

import com.example.four.entity.CityMenu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityMenuMapper {
    int deleteByPrimaryKey(Integer citymenuId);

    int insert(CityMenu record);

    int insertSelective(CityMenu record);

    CityMenu selectByPrimaryKey(Integer citymenuId);

    int updateByPrimaryKeySelective(CityMenu record);

    int updateByPrimaryKey(CityMenu record);

    List<CityMenu> getAllCityMenu(Integer id);
}