package com.example.four.VO;

import com.example.four.entity.City;
import com.example.four.entity.CityMenu;

import java.io.Serializable;
import java.util.List;

public class CityVO extends City implements Serializable {
    private List<CityMenu> cityMenus;

    public List<CityMenu> getCityMenus() {
        return cityMenus;
    }

    public void setCityMenus(List<CityMenu> cityMenus) {
        this.cityMenus = cityMenus;
    }
}
