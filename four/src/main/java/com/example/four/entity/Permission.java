package com.example.four.entity;

import lombok.Data;

import java.util.List;

/**
 * 权限资源类
 */
@Data
public class Permission {

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
