package com.example.four.entity;

import com.example.four.exception.IllegalException;
import com.example.four.utils.ImgUtil;

import java.io.IOException;
import java.io.Serializable;

/**
 * foods
 * @author 
 */
public class Foods implements Serializable {
    private Integer foodsId;

    private String foodsName;

    private String foodsImg;

    private Integer citymenuId;

    private static final long serialVersionUID = 1L;

    public Integer getFoodsId() {
        return foodsId;
    }

    public void setFoodsId(Integer foodsId) {
        this.foodsId = foodsId;
    }

    public String getFoodsName() {
        return foodsName;
    }

    public void setFoodsName(String foodsName) {
        this.foodsName = foodsName;
    }

    public String getFoodsImg() {
        return foodsImg;
    }

    public void setFoodsImg(String foodsImg) {
        this.foodsImg = foodsImg;
    }

    public Integer getCitymenuId() {
        return citymenuId;
    }

    public void setCitymenuId(Integer citymenuId) {
        this.citymenuId = citymenuId;
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
        Foods other = (Foods) that;
        return (this.getFoodsId() == null ? other.getFoodsId() == null : this.getFoodsId().equals(other.getFoodsId()))
            && (this.getFoodsName() == null ? other.getFoodsName() == null : this.getFoodsName().equals(other.getFoodsName()))
            && (this.getFoodsImg() == null ? other.getFoodsImg() == null : this.getFoodsImg().equals(other.getFoodsImg()))
            && (this.getCitymenuId() == null ? other.getCitymenuId() == null : this.getCitymenuId().equals(other.getCitymenuId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getFoodsId() == null) ? 0 : getFoodsId().hashCode());
        result = prime * result + ((getFoodsName() == null) ? 0 : getFoodsName().hashCode());
        result = prime * result + ((getFoodsImg() == null) ? 0 : getFoodsImg().hashCode());
        result = prime * result + ((getCitymenuId() == null) ? 0 : getCitymenuId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", foodsId=").append(foodsId);
        sb.append(", foodsName=").append(foodsName);
        sb.append(", foodsImg=").append(foodsImg);
        sb.append(", citymenuId=").append(citymenuId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    public void uploadImg() throws IOException, IllegalException {
        String[] arrImg = {this.getFoodsImg()};
        String[] arrType = {"png"};
        String[] strings = ImgUtil.MultiBase64StringsToLocalImg(arrImg,arrType);
        for (String string : strings) {
            this.setFoodsImg(string);
        }
    }
}