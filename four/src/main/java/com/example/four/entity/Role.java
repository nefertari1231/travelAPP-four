package com.example.four.entity;

import lombok.Data;

import java.util.List;

@Data
public class Role {
    private Integer roleId;//权限id
    private String roleName;//权限名称
    private String roleNameZH;
    private List<Permission> permissions;//权限列表

    public Role() {
    }
}