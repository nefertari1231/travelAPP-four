package com.example.four.service;

import com.example.four.entity.User;
import com.example.four.mapper.UserMapper;
import com.example.four.utils.idworker.Sid;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class UserServiceImpl extends BaseService<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private Sid sid;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public boolean queryUsernameIsExist(String username) {
        User result = userMapper.queryUsername(username);
        return result == null ? false : true;
    }

    @Override
    public void updateUserInfo(User user) {

        Example userExample = new Example(User.class);
        Criteria criteria = userExample.createCriteria();
        criteria.andEqualTo("userId", user.getUserId());
        userMapper.updateByExampleSelective(user,userExample);

    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public User queryUserInfo(String userId) {

        Example userExample = new Example(User.class);
        Criteria criteria = userExample.createCriteria();
        criteria.andEqualTo("userId", userId);
        User user = userMapper.selectOneByExample(userExample);
        return user;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void saveUser(User user) {

        String userId = sid.nextShort();
        user.setUserId(userId);
        userMapper.save(user);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public User queryUserForLogin (String username, String password) {

        Example userExample = new Example(User.class);
        Criteria criteria = userExample.createCriteria();
        criteria.andEqualTo("username", username);
        User result = userMapper.selectOneByExample(userExample);
        boolean PwdFlag = BCrypt.checkpw(password, result.getPassword());
        if(PwdFlag) {
            return result;
        }
        return null;
    }
}
