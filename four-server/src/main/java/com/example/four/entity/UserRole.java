package com.example.four.entity;

import lombok.Data;

@Data
public class UserRole {

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    private Integer roleId;//权限id
    private Integer userId;//用户id

    public UserRole() {
    }
}