package com.example.four.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Data
public class User implements UserDetails {
    private Integer userId;//用户id
    @JsonIgnore
    private String username;//用户名
    @JsonIgnore
    private String phone;//手机
    private String password;//用户密码
    @JsonIgnore
    private String email;//用户Email邮箱
    private String userNickname;//用户昵称
    @JsonIgnore
    private String userBg;//  用户壁纸
    @JsonIgnore
    private String userIcon;//   用户头像
    private String userSex; //   用户性别
    private String userArea; //  用户地区
    private String userDescription; //  用户描述
    private Integer followCount;//  关注
    private Integer shareCount;//  粉丝
    private Integer fansCount;//  分享
    @JsonIgnore
    private String userStatus;//用户状态
    private String userToken;//用户的token
    @JsonIgnore
    private String userCode;//用于验证短信或邮箱
    @JsonIgnore
    private Date createTime;//用户注册时间
    @JsonIgnore
    private List<Role> roles;//用户拥有的权限

    public User() {
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> roleList = new ArrayList<>();
        for (Role role : roles) {
            roleList.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return roleList;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}