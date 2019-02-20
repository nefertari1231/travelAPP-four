package com.example.four.mapper;

import com.example.four.entity.Permission;
import com.example.four.utils.MyMapper;

import java.util.List;

public interface PermissionMapper extends MyMapper<Permission> {

    List<Permission> getAllPermissions();
}
