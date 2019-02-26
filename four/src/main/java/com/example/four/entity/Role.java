package com.example.four.entity;

import lombok.Data;

import java.util.List;

@Data
public class Role {
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleNameZH() {
        return roleNameZH;
    }

    public void setRoleNameZH(String roleNameZH) {
        this.roleNameZH = roleNameZH;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    private Integer roleId;//权限id
    private String roleName;//权限名称
    private String roleNameZH;
    private List<Permission> permissions;//权限列表

    public Role() {
    }
}