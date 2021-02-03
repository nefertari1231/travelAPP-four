package com.example.four.service;

import com.example.four.entity.User;
import com.example.four.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class UserService extends BaseService<UserMapper, User> implements UserDetailsService {

    @Autowired
    public UserMapper userMapper;

    private BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.getByUserName(username);
        if (user == null) {
            throw new UsernameNotFoundException("用户名不对");
        }
        return user;
    }

    /**
     * 根据用户名更新用户信息
     *
     * @param user 前端传入的含有用户名的用户对象
     * @return 返回更新结果，1为成功，0为失败
     */
    public int updateByUserName(User user) {
        if (user.getUsername() != null) {
            return userMapper.updateByUserName(user);
        } else {
            return 0;
        }
    }

    /**
     * 根据用户手机获取用户信息
     *
     * @param user 前端传入的用户信息
     * @return 返回查询到的用户对象
     */
    public User getByUserPhone(User user) {
        if (user.getPhone() != null) {
            return userMapper.getByUserPhone(user.getPhone());
        } else {
            return null;
        }
    }

    /**
     * 根据用户id获取用户
     *
     * @param userId 前端传入的用户id
     * @return 返回用户对象
     */
    public User getByUserId(Integer userId) {
        return userMapper.getByUserId(userId);
    }

    /**
     * 新增用户
     *
     * @param user 前端传来的对象
     * @return 返回新增结果，1为成功，0为失败
     */
    public int insert(User user) {
        return userMapper.insert(user);

    }

    public int updatePasswordByUserPhone(User user){
        if (user.getPassword()!=null && user.getPhone()!=null){
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            return userMapper.updatePasswordByUserPhone(user);
        }else{
            return 0;
        }
    }

    /**
     * 根据用户手机更新用户信息
     *
     * @param user 前端传入的包含用户手机号码的用户对象
     * @return 返回更新结果，1为成功，0为失败
     */
    public int updateByUserPhone(User user) {
        if (user.getPhone() != null) {
            return userMapper.updateByUserPhone(user);
        } else {
            return 0;
        }
    }

    /**
     * 根据用户手机号码删除用户
     *
     * @param telephone 前端传来的用户手机号码
     * @return 返回删除结果，1为成功，0为失败
     */
    public int deleteByUserPhone(String telephone) {
        return userMapper.deleteByUserPhone(telephone);
    }


    /**
     * 判断用户名是否存在
     *
     */
    public boolean queryUsernameIsExist(String username) {
        User result = userMapper.getByUserName(username);
        if (result != null) {
            String pwd = result.getPassword();
            return pwd == null ? false : true;
        }
        return false;
    }

    /**
     * 登录
     *
     */
    public int queryUserForLogin (String username, String password) {
        int LOGIN_SUCCESS =1;
        int PASSWORD_ERROR =2;
        int USERNAME_ERROR =3;
        User result = userMapper.getByUserName(username);
        if(result != null) {
            boolean PwdFlag = BCrypt.checkpw(password, result.getPassword());
            if (PwdFlag) {
                return LOGIN_SUCCESS;
            } else {
                return PASSWORD_ERROR;
            }
        }else {
            return USERNAME_ERROR;
        }
    }

    /**
     * 根据用户id更新用户信息
     *
     * @param user 前端传来的包含id 以及其他新信息的用户对象
     * @return 返回更新结果，1为成功，0为失败
     */
    public int updateByUserId(User user) {
        return userMapper.updateByUserId(user);

    }

    /**
     * 根据用户id 更新图片
     *
     * @param  user 前端传来的包含id 以及其他新信息的用户对象
     * @return 返回更新结果，1为成功，0为失败
     */
    public void updateUserInfo(User user) {
        Example userExample = new Example(User.class);
        Criteria criteria = userExample.createCriteria();
        criteria.andEqualTo("userId", user.getUserId());
        userMapper.updateByExampleSelective(user,userExample);
    }

    /**
     * 根据用户id查询用户
     *
     * @param  userId 前端传来的包含id 以及其他新信息的用户对象
     * @return 返回更新结果，1为成功，0为失败
     */

    public User queryUserInfo(Integer userId) {

        Example userExample = new Example(User.class);
        Criteria criteria = userExample.createCriteria();
        criteria.andEqualTo("userId", userId);
        User user = userMapper.selectOneByExample(userExample);
        return user;
    }

}
