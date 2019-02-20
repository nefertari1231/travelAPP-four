package com.example.four.service;

import com.example.four.entity.UserRole;
import com.example.four.mapper.UserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户角色服务层
 */
@Service
public class UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    /**
     * 增加用户角色信息
     * @param userRole 前端传入的携带userRole所有属性对象
     * @return 返回结果，1为成功，0为失败
     */
    public int insert(UserRole userRole){
        return userRoleMapper.insert(userRole);
    }

    /**
     * 删除用户角色信息
     * @param userRole 前端传入的携带userRole所有属性对象
     * @return 返回删除结果，1为成功，0为失败
     */
    public int delete(UserRole userRole){
        return userRoleMapper.insert(userRole);
    }

    public int insertMany(List<UserRole> userRoles) {
        return userRoleMapper.insertMany(userRoles);
    }
}
