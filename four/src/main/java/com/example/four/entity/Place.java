package com.example.four.entity;

import java.io.Serializable;

/**
 * place
 * @author 
 */
public class Place implements Serializable {
    private Integer placeId;

    private String placeName;

    private String placeImg;

    private Integer citymenuId;

    private String placeTag;

    private static final long serialVersionUID = 1L;

    public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getPlaceImg() {
        return placeImg;
    }

    public void setPlaceImg(String placeImg) {
        this.placeImg = placeImg;
    }

    public Integer getCitymenuId() {
        return citymenuId;
    }

    public void setCitymenuId(Integer citymenuId) {
        this.citymenuId = citymenuId;
    }

    public String getPlaceTag() {
        return placeTag;
    }

    public void setPlaceTag(String placeTag) {
        this.placeTag = placeTag;
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
        Place other = (Place) that;
        return (this.getPlaceId() == null ? other.getPlaceId() == null : this.getPlaceId().equals(other.getPlaceId()))
            && (this.getPlaceName() == null ? other.getPlaceName() == null : this.getPlaceName().equals(other.getPlaceName()))
            && (this.getPlaceImg() == null ? other.getPlaceImg() == null : this.getPlaceImg().equals(other.getPlaceImg()))
            && (this.getCitymenuId() == null ? other.getCitymenuId() == null : this.getCitymenuId().equals(other.getCitymenuId()))
            && (this.getPlaceTag() == null ? other.getPlaceTag() == null : this.getPlaceTag().equals(other.getPlaceTag()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getPlaceId() == null) ? 0 : getPlaceId().hashCode());
        result = prime * result + ((getPlaceName() == null) ? 0 : getPlaceName().hashCode());
        result = prime * result + ((getPlaceImg() == null) ? 0 : getPlaceImg().hashCode());
        result = prime * result + ((getCitymenuId() == null) ? 0 : getCitymenuId().hashCode());
        result = prime * result + ((getPlaceTag() == null) ? 0 : getPlaceTag().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", placeId=").append(placeId);
        sb.append(", placeName=").append(placeName);
        sb.append(", placeImg=").append(placeImg);
        sb.append(", citymenuId=").append(citymenuId);
        sb.append(", placeTag=").append(placeTag);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}