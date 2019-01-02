package com.example.four.entity;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class Server {

    /**服务ID**/
    private String serverId;

    /**服务名称**/
    private String serverName;

    /**服务价格**/
    private BigDecimal serverPrice;

    /**服务地点**/
    private String serverPlace;

    /**描述**/
    private String serverDescription;

    /**服务图**/
    private String serverIcon;

    /**备注**/
    private String serverRemark;

    /**服务状态**/
    private Integer serverStatus;

}
