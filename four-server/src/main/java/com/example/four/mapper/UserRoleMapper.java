package com.example.four.mapper;

import com.example.four.entity.UserRole;
import com.example.four.utils.MyMapper;

import java.util.List;

public interface UserRoleMapper extends MyMapper<UserRole> {

    int insert(UserRole userRole);

    int delete(UserRole userRole);

    int insertMany(List<UserRole> userRoles);
}
