package com.example.four.entity;

import java.io.Serializable;

public class Great implements Serializable {

    /**点赞主键**/
    private Integer greatId;

    /**用户主键**/
    private Integer userId;

    /**服务主键**/
    private String serverId;

    public Great() {
    }

    public Great(String serverId) {
        this.serverId = serverId;
    }

    public Great(Integer userId, String serverId) {
        this.userId = userId;
        this.serverId = serverId;
    }

    public Integer getGreatId() {
        return greatId;
    }

    public void setGreatId(Integer greatId) {
        this.greatId = greatId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getServerId() {
        return serverId;
    }

    public void setServerId(String serverId) {
        this.serverId = serverId;
    }
}
