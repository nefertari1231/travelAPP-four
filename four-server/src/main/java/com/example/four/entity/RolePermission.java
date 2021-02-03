package com.example.four.entity;

import lombok.Data;

/**
 * 权限和分栏关系表
 */
@Data
public class RolePermission {

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    private Integer roleId;//权限id
    private Integer permissionId;//分栏id

    public RolePermission() {
    }
}
