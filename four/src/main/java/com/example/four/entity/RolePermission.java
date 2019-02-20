package com.example.four.entity;

import lombok.Data;

/**
 * 权限和分栏关系表
 */
@Data
public class RolePermission {

    private Integer roleId;//权限id
    private Integer permissionId;//分栏id

    public RolePermission() {
    }
}
