package com.example.four.entity;

import java.io.Serializable;

/**
 * hotspot
 * @author 
 */
public class Hotspot implements Serializable {
    private Integer hotspotId;

    private String hotspotName;

    private String hotspotImg;

    private Integer citymenuId;

    private static final long serialVersionUID = 1L;

    public Integer getHotspotId() {
        return hotspotId;
    }

    public void setHotspotId(Integer hotspotId) {
        this.hotspotId = hotspotId;
    }

    public String getHotspotName() {
        return hotspotName;
    }

    public void setHotspotName(String hotspotName) {
        this.hotspotName = hotspotName;
    }

    public String getHotspotImg() {
        return hotspotImg;
    }

    public void setHotspotImg(String hotspotImg) {
        this.hotspotImg = hotspotImg;
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
        Hotspot other = (Hotspot) that;
        return (this.getHotspotId() == null ? other.getHotspotId() == null : this.getHotspotId().equals(other.getHotspotId()))
            && (this.getHotspotName() == null ? other.getHotspotName() == null : this.getHotspotName().equals(other.getHotspotName()))
            && (this.getHotspotImg() == null ? other.getHotspotImg() == null : this.getHotspotImg().equals(other.getHotspotImg()))
            && (this.getCitymenuId() == null ? other.getCitymenuId() == null : this.getCitymenuId().equals(other.getCitymenuId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getHotspotId() == null) ? 0 : getHotspotId().hashCode());
        result = prime * result + ((getHotspotName() == null) ? 0 : getHotspotName().hashCode());
        result = prime * result + ((getHotspotImg() == null) ? 0 : getHotspotImg().hashCode());
        result = prime * result + ((getCitymenuId() == null) ? 0 : getCitymenuId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", hotspotId=").append(hotspotId);
        sb.append(", hotspotName=").append(hotspotName);
        sb.append(", hotspotImg=").append(hotspotImg);
        sb.append(", citymenuId=").append(citymenuId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}