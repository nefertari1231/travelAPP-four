package com.example.four.entity;

import lombok.Data;

@Data
public class UserRole {

    private Integer roleId;//权限id
    private Integer userId;//用户id

    public UserRole() {
    }
}