package com.example.four.entity;

import java.io.Serializable;

/**
 * discuss
 * @author 
 */
public class Discuss implements Serializable {
    private Integer discussId;

    private String discussContent;

    private Integer discussValue;

    private String discussImg;

    private String orderSn;

    private static final long serialVersionUID = 1L;

    public Integer getDiscussId() {
        return discussId;
    }

    public void setDiscussId(Integer discussId) {
        this.discussId = discussId;
    }

    public String getDiscussContent() {
        return discussContent;
    }

    public void setDiscussContent(String discussContent) {
        this.discussContent = discussContent;
    }

    public Integer getDiscussValue() {
        return discussValue;
    }

    public void setDiscussValue(Integer discussValue) {
        this.discussValue = discussValue;
    }

    public String getDiscussImg() {
        return discussImg;
    }

    public void setDiscussImg(String discussImg) {
        this.discussImg = discussImg;
    }

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
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
        Discuss other = (Discuss) that;
        return (this.getDiscussId() == null ? other.getDiscussId() == null : this.getDiscussId().equals(other.getDiscussId()))
            && (this.getDiscussContent() == null ? other.getDiscussContent() == null : this.getDiscussContent().equals(other.getDiscussContent()))
            && (this.getDiscussValue() == null ? other.getDiscussValue() == null : this.getDiscussValue().equals(other.getDiscussValue()))
            && (this.getDiscussImg() == null ? other.getDiscussImg() == null : this.getDiscussImg().equals(other.getDiscussImg()))
            && (this.getOrderSn() == null ? other.getOrderSn() == null : this.getOrderSn().equals(other.getOrderSn()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getDiscussId() == null) ? 0 : getDiscussId().hashCode());
        result = prime * result + ((getDiscussContent() == null) ? 0 : getDiscussContent().hashCode());
        result = prime * result + ((getDiscussValue() == null) ? 0 : getDiscussValue().hashCode());
        result = prime * result + ((getDiscussImg() == null) ? 0 : getDiscussImg().hashCode());
        result = prime * result + ((getOrderSn() == null) ? 0 : getOrderSn().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", discussId=").append(discussId);
        sb.append(", discussContent=").append(discussContent);
        sb.append(", discussValue=").append(discussValue);
        sb.append(", discussImg=").append(discussImg);
        sb.append(", orderSn=").append(orderSn);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}