package com.example.four.Service;

import com.alibaba.fastjson.JSON;
import com.example.four.VO.CityVO;
import com.example.four.entity.CityMenu;
import com.example.four.mapper.CityMapper;
import com.example.four.mapper.CityMenuMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CityServiceTest {

    @Autowired
    private CityMapper cityMapper;

    @Autowired
    private CityMenuMapper menuMapper;

    @Test
    public void getAllCity() {
        List<CityVO> allCitys = cityMapper.getAllCitys();
        System.out.println(JSON.toJSONString(allCitys));
    }

    @Test
    public void getAllCityMenu() {
        List<CityMenu> allCityMenu = menuMapper.getAllCityMenu(1);
        System.out.println(JSON.toJSONString(allCityMenu));
    }
}
