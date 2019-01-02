package com.example.four.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class User {

    /**用户Id**/
    @ApiModelProperty(hidden = true)
    private String userId;

    /**用户名**/
    private String username;

    /**用户密码**/
    private String password;

    /**用户壁纸**/
    @ApiModelProperty(hidden = true)
    private String userBg;

    /**用户昵称**/
    @ApiModelProperty(hidden = true)
    private String userNickname;

    /**用户头像**/
    @ApiModelProperty(hidden = true)
    private String userIcon;

    /**用户性别**/
    @ApiModelProperty(hidden = true)
    private String userSex;

    /**用户地区**/
    @ApiModelProperty(hidden = true)
    private String userArea;

    /**用户描述**/
    @ApiModelProperty(hidden = true)
    private String userDescription;

    /**关注**/
    @ApiModelProperty(hidden = true)
    private Integer followCount;

    /**粉丝**/
    @ApiModelProperty(hidden = true)
    private Integer shareCount;

    /**分享**/
    @ApiModelProperty(hidden = true)
    private Integer fansCount;

}