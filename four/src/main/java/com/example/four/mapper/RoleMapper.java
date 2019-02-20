package com.example.four.mapper;

import com.example.four.entity.Role;
import com.example.four.utils.MyMapper;

public interface RoleMapper extends MyMapper<Role> {

    int getPermissions ();
}
