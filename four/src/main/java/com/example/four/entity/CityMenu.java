package com.example.four.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.example.four.exception.IllegalException;
import com.example.four.utils.ImgUtil;

import java.io.IOException;
import java.io.Serializable;

/**
 * city_menu
 * @author 
 */
public class CityMenu implements Serializable {
    private Integer citymenuId;

    private String citymenuName;

    private String citymenuImg;

    private String citymenuBigimg;

    private String citymenuIntro;

    private Integer cityId;

    private static final long serialVersionUID = 1L;

    public Integer getCitymenuId() {
        return citymenuId;
    }

    public void setCitymenuId(Integer citymenuId) {
        this.citymenuId = citymenuId;
    }

    @JSONField(name = "cityName")
    public String getCitymenuName() {
        return citymenuName;
    }

    public void setCitymenuName(String citymenuName) {
        this.citymenuName = citymenuName;
    }

    public String getCitymenuImg() {
        return citymenuImg;
    }

    public void setCitymenuImg(String citymenuImg) {
        this.citymenuImg = citymenuImg;
    }

    public String getCitymenuBigimg() {
        return citymenuBigimg;
    }

    public void setCitymenuBigimg(String citymenuBigimg) {
        this.citymenuBigimg = citymenuBigimg;
    }

    public String getCitymenuIntro() {
        return citymenuIntro;
    }

    public void setCitymenuIntro(String citymenuIntro) {
        this.citymenuIntro = citymenuIntro;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        CityMenu other = (CityMenu) that;
        return (this.getCitymenuId() == null ? other.getCitymenuId() == null : this.getCitymenuId().equals(other.getCitymenuId()))
            && (this.getCitymenuName() == null ? other.getCitymenuName() == null : this.getCitymenuName().equals(other.getCitymenuName()))
            && (this.getCitymenuImg() == null ? other.getCitymenuImg() == null : this.getCitymenuImg().equals(other.getCitymenuImg()))
            && (this.getCitymenuBigimg() == null ? other.getCitymenuBigimg() == null : this.getCitymenuBigimg().equals(other.getCitymenuBigimg()))
            && (this.getCitymenuIntro() == null ? other.getCitymenuIntro() == null : this.getCitymenuIntro().equals(other.getCitymenuIntro()))
            && (this.getCityId() == null ? other.getCityId() == null : this.getCityId().equals(other.getCityId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCitymenuId() == null) ? 0 : getCitymenuId().hashCode());
        result = prime * result + ((getCitymenuName() == null) ? 0 : getCitymenuName().hashCode());
        result = prime * result + ((getCitymenuImg() == null) ? 0 : getCitymenuImg().hashCode());
        result = prime * result + ((getCitymenuBigimg() == null) ? 0 : getCitymenuBigimg().hashCode());
        result = prime * result + ((getCitymenuIntro() == null) ? 0 : getCitymenuIntro().hashCode());
        result = prime * result + ((getCityId() == null) ? 0 : getCityId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", citymenuId=").append(citymenuId);
        sb.append(", citymenuName=").append(citymenuName);
        sb.append(", citymenuImg=").append(citymenuImg);
        sb.append(", citymenuBigimg=").append(citymenuBigimg);
        sb.append(", citymenuIntro=").append(citymenuIntro);
        sb.append(", cityId=").append(cityId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    public void uploadImg() throws IOException, IllegalException {
        String[] arrImg = {this.getCitymenuImg()};
        String[] arrType = {"png"};
        String[] strings = ImgUtil.MultiBase64StringsToLocalImg(arrImg,arrType);
        for (String string : strings) {
            this.setCitymenuImg(string);
        }
    }
}