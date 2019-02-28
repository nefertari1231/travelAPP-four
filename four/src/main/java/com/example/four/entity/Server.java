package com.example.four.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.Column;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class Server {

    public String getServerId() {
        return serverId;
    }

    public void setServerId(String serverId) {
        this.serverId = serverId;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public BigDecimal getServerPrice() {
        return serverPrice;
    }

    public void setServerPrice(BigDecimal serverPrice) {
        this.serverPrice = serverPrice;
    }

    public String getServerPlace() {
        return serverPlace;
    }

    public void setServerPlace(String serverPlace) {
        this.serverPlace = serverPlace;
    }

    public String getServerDescription() {
        return serverDescription;
    }

    public void setServerDescription(String serverDescription) {
        this.serverDescription = serverDescription;
    }

    public String getServerIcon() {
        return serverIcon;
    }

    public void setServerIcon(String serverIcon) {
        this.serverIcon = serverIcon;
    }

    public String getServerRemark() {
        return serverRemark;
    }

    public void setServerRemark(String serverRemark) {
        this.serverRemark = serverRemark;
    }

    public Integer getServerStatus() {
        return serverStatus;
    }

    public void setServerStatus(Integer serverStatus) {
        this.serverStatus = serverStatus;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Server(Integer serverStatus) {
        this.serverStatus = serverStatus;
    }

    public Server() {
    }

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

    /**用户外键**/
    private Integer userId;

    /**创建时间**/
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;

    @Override
    public String toString() {
        return "Server{" +
                "serverId='" + serverId + '\'' +
                ", serverName='" + serverName + '\'' +
                ", serverPrice=" + serverPrice +
                ", serverPlace='" + serverPlace + '\'' +
                ", serverDescription='" + serverDescription + '\'' +
                ", serverIcon='" + serverIcon + '\'' +
                ", serverRemark='" + serverRemark + '\'' +
                ", serverStatus=" + serverStatus +
                ", userId=" + userId +
                ", createTime=" + createTime +
                '}';
    }
}
