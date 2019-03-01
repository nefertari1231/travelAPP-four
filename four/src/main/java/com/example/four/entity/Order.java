package com.example.four.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * order
 * @author 
 */
@Data
@Table(name = "order")
public class Order implements Serializable {
    /**
     * 订单id
     */
    private Integer orderId;

    /**
     * 买家电话
     */
    private String buyerPhone;

    /**
     * 购买数量
     */
    private String buyerCount;

    /**
     * 订单总金额
     */
    private BigDecimal orderAmount;

    /**
     * 留言
     */
    private String buyerTalk;

    /**
     * 买家名字
     */
    private String buyerName;

    /**
     * 订单编号
     */
    private String orderSn;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 用户外键
     */
    private Integer userId;


    /**
     * 服务编号
     */
    private String serverId;

}