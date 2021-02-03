package com.example.four.mapper;

import com.example.four.entity.RolePermission;
import com.example.four.utils.MyMapper;

public interface RolePermissionMapper extends MyMapper<RolePermission> {

    int insert(RolePermission rolePermission);

    int delete(RolePermission rolePermission);
}
