package com.example.four.mapper;

import com.example.four.entity.User;
import com.example.four.utils.MyMapper;

import java.util.List;

public interface UserMapper extends MyMapper<User> {

    /**
     * 获取所有用户
     * @return 所有用户的列表
     */
    List<User> getAllUsers();

    /**
     * 登录的时候验证用户名||手机||邮箱&&密码
     * @param user 用户对象
     * @return 返回查找到的对象
     */
    User login(User user);
    //返回user

    /**
     * 根据用户手机号码获取用户
     * @param phone 前端传入的手机号码
     * @return 返回查询到的用户对象
     */
    User getByUserPhone(String phone);

    /**
     * 根据用户id获取用户
     * @param userId 前端传入的用户id
     * @return 返回查询到的用户对象
     */
    User getByUserId(Integer userId);

    /**d
     *根据用户名获取用户
     * @param username 前端传入的用户名
     * @return 返回查询到的用户对象
     */
    User getByUserName(String username);


    User getByUserToken(String userToken);
    /**
     *根据用户邮箱获取用户
     * @param email 前端传入的用户邮箱
     * @return 返回查询到的用户对象
     */
    User getByUserEmail(String email);

    /**
     * 动态插入用户
     * @param user 用户对象
     * @return 返回插入结果，1为成功，0为失败
     */
    int insert(User user);


    /**
     *根据用户id更新用户信息
     * @param user 传入携带新信息的用户，并且必须要有user_id
     * @return 返回更新结果，1为成功，0为失败
     */
    int updateByUserId(User user);

    /**
     * 根据用户名更新用户，这就要求用户名不能重复
     * @param user 前端传入的含有用户名的用户对象
     * @return 返回更新结果
     */
    int updateByUserName(User user);

    /**
     *根据用户手机更新用户信息
     * @param user 前端传入的包含用户手机号码的用户对象
     * @return 返回更新结果
     */
    int updateByUserPhone(User user);

    /**
     * 根据用户邮箱更新用户信息
     * @param user 前端传入的包含用户邮箱的用户对象
     * @return 返回更新结果
     */
    int updateByUserEmail(User user);

    int updatePasswordByUserPhone(User user);
    /**
     *根据用户id删除用户
     * @param userId 用户id
     * @return 返回删除结果，1为成功，0为失败
     */
    int deleteByUserId(Integer userId);

    /**
     * 根据用户手机删除用户
     * @param phone 手机号码
     * @return 返回删除结果，1为成功，0为失败
     */
    int deleteByUserPhone(String phone);

    List<User> getLike(String like);

    int checkUsername (String username);

}