package com.example.four.entity;

import lombok.Data;

import java.util.List;

/**
 * 权限资源类
 */
@Data
public class Permission {

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public int getKeepActive() {
        return keepActive;
    }

    public void setKeepActive(int keepActive) {
        this.keepActive = keepActive;
    }

    public int getRequireAuth() {
        return requireAuth;
    }

    public void setRequireAuth(int requireAuth) {
        this.requireAuth = requireAuth;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public Permission getParentPermission() {
        return parentPermission;
    }

    public void setParentPermission(Permission parentPermission) {
        this.parentPermission = parentPermission;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    private Integer permissionId; //权限id
    private String name;//权限名称
    private String description;//权限描述
    private String url;//权限对应的url
    private String path;//权限路径
    private String component;//组件名称
    private String iconCls;//图标
    private int keepActive;//是否显示
    private int requireAuth;//是否需要权限
    private int parentId;//父级权限
    private Permission parentPermission;//父级权限对象
    private List<Role> roles;//含有该权限的role列表
    public Permission() {
    }

}
