package com.example.four.VO;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
public class UserVO {

    private Integer userId;//用户id
    private String username;//用户名
    private String redisToken;
    private String phone;//手机
    @JsonIgnore
    private String password;//用户密码
    private String email;//用户Email邮箱
    private String userNickname;//用户昵称
    private String userBg;//  用户壁纸
    private String userIcon;//   用户头像
    private String userSex; //   用户性别
    private String userArea; //  用户地区
    private String userDescription; //  用户描述
    private Integer followCount;//  关注e
    private Integer shareCount;//  粉丝
    private Integer fansCount;//  分享
    private String userToken;// token

}