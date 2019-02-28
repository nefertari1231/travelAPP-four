package com.example.four.VO;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.math.BigDecimal;
import java.util.Date;

public class ServerVO {
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

    /**用户昵称**/
    private String userNickname;//用户昵称

    /**用户头像**/
    @JsonIgnore
    private String userIcon;//   用户头像

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

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getUserIcon() {
        return userIcon;
    }

    public void setUserIcon(String userIcon) {
        this.userIcon = userIcon;
    }
}
