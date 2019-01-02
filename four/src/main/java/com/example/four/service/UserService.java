package com.example.four.service;

import com.example.four.entity.User;

public interface UserService {

    /**判断用户名是否存在**/
    boolean queryUsernameIsExist(String username);

    /**保存用户**/
    void saveUser(User user);

    /**根据用户名和密码查询用户**/
    User queryUserForLogin(String username, String password);

    /**更新用户信息**/
    void updateUserInfo(User user);

    /**查询用户信息**/
    User queryUserInfo (String userId);

}
