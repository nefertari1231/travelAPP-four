package com.example.four.service;

import com.example.four.VO.CityVO;
import com.example.four.entity.CityMenu;
import com.example.four.entity.Foods;
import com.example.four.entity.Hotspot;
import com.example.four.entity.Place;
import com.example.four.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityService {

    @Autowired
    private CityMapper cityMapper;

    @Autowired
    private HotspotMapper hotspotMapper;

    @Autowired
    private CityMenuMapper menuMapper;

    @Autowired
    private FoodsMapper foodsMapper;

    @Autowired
    private PlaceMapper placeMapper;

    /**
     * 查询出所有的省份与城市
     * @return {@link CityVO}
     */
    public List<CityVO> getAllCity(){
        return cityMapper.getAllCitys();
    }

    /**
     * 城市的热门景点
     * @param cityMenuId 城市 id
     * @return {@link Hotspot}
     */
    public List<Hotspot> getAllHotspot(Integer cityMenuId){
        return hotspotMapper.getAllHotspotsByCity(cityMenuId);
    }

    /**
     * 城市的美食
     * @param cityMenuId 城市 id
     * @return {@link Foods}
     */
    public List<Foods> getAllFoods(Integer cityMenuId){
        return foodsMapper.getAllFoodsByCity(cityMenuId);
    }

    /**
     * 去处
     * @param cityMenuId 城市 Id
     * @return {@link Place}
     */
    public List<Place> getAllPlace(Integer cityMenuId){
        return placeMapper.getAllPlaceByCity(cityMenuId);
    }


    /**
     * 删除 美食
     * @param foodsId
     */
    public void delFoodsById(Integer foodsId) {
        foodsMapper.deleteByPrimaryKey(foodsId);
    }

    /**
     * 修改美食
     * @param foods
     */
    public void updataFoodsById(Foods foods) {
        foodsMapper.updateByPrimaryKeySelective(foods);
    }

    /**
     * 删除城市
     * @param cityMenuId
     */
    public void delCityMenuById(Integer cityMenuId){
        menuMapper.deleteByPrimaryKey(cityMenuId);
    }

    /**
     * 修改城市
     * @param cityMenu
     */
    public void updateCityMenuById(CityMenu cityMenu){
        menuMapper.updateByPrimaryKeySelective(cityMenu);
    }

    /**
     * 新增城市
     * @param cityMenu
     */
    public void inserCityMenu(CityMenu cityMenu){
        menuMapper.insert(cityMenu);
    }

    /**
     * 新增美食
     * @param foods
     */
    public void insertFoods(Foods foods){
        foodsMapper.insert(foods);
    }

    /**
     * 新增城市
     * @param cityMenu
     */
    public void insertCity(CityMenu cityMenu){
        menuMapper.insert(cityMenu);
    }
}
