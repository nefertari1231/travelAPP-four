package com.example.four.VO;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
public class UserVO {

    /**用户Id**/
    private String userId;

    /**用户redisToken**/
    private String userToken;

    /**用户名**/
    private String username;

    /**用户密码**/
    @JsonIgnore
    private String password;

    /**用户壁纸**/
    private String userBg;

    /**用户昵称**/
    private String userNickname;

    /**用户头像**/
    private String userIcon;

    /**用户性别**/
    private String userSex;

    /**用户地区**/
    private String userArea;

    /**用户描述**/
    private String userDescription;

    /**关注**/
    private Integer followCount;

    /**粉丝**/
    private Integer shareCount;

    /**分享**/
    private Integer fansCount;

}