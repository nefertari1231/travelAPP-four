package com.example.four.controller;

import com.example.four.VO.UserVO;
import com.example.four.entity.User;
import com.example.four.service.UserService;
import com.example.four.utils.JSONResult;
import com.example.four.utils.JwtUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/users", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/users", tags ="usersApi", description = "用户登录接口")
public class RegisterLoginController extends BaseController {

    @Autowired
    private UserService userService;

    @PostMapping(value = "/register")
    @ApiOperation(value = "注册", response = User.class, responseContainer = "list")
    public JSONResult register(@RequestBody User user) throws Exception {

        //判断用户名是否为空
        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
            return  JSONResult.errorMsg("用户名和密码不能为空");
        }

        //判断用户名是否存在
        boolean usernameIsExist = userService.queryUsernameIsExist(user.getUsername());

        //保存用户
        if(!usernameIsExist) {
            user.setUsername(user.getUsername());
            String BcPassword = BCrypt.hashpw(user.getPassword(),BCrypt.gensalt());
            user.setPassword(BcPassword);
            userService.saveUser(user);
        } else {
            return JSONResult.errorMsg("用户名已经存在，请换一个");
        }
        user.setPassword("");

        UserVO userVO = setUserRedisSessionToken(user);

        return JSONResult.ok(userVO);
    }

    public UserVO setUserRedisSessionToken(User userModel) {
//        String uniqueToken = UUID.randomUUID().toString();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("username", userModel.getUsername());
        map.put("password", userModel.getPassword());
        map.put("timestamp", new Date().getTime());
        String key = "79e7c69681b8270162386e6daa53d1dc";
        String uniqueToken = JwtUtils.createJWT(map,key);

        redisOperator.set(USER_REDIS_SESSION + ":" + userModel.getUserId(),uniqueToken,1000*60*30);
        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(userModel,userVO);
        userVO.setUserToken(uniqueToken);
        return userVO;
    }

    @PostMapping(value = "/login")
    @ApiOperation(value = "登录", response = User.class, responseContainer = "list")
    public JSONResult login(@RequestBody User user) throws Exception {
        String username = user.getUsername();
        String password = user.getPassword();

        //判断用户名是否为空
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return  JSONResult.errorMsg("用户名和密码不能为空");
        }

        //判断用户名是否存在
        User userResult = userService.queryUserForLogin(username, password);

        //返回
        if (userResult != null) {
            userResult.setPassword("");
            UserVO userVO = setUserRedisSessionToken(userResult);
            return JSONResult.ok(userVO);
        } else {
            return JSONResult.errorMsg("用户名密码不正确，请重试");
        }
    }

    @PostMapping(value = "/logout")
    @ApiImplicitParam(name="userId", value = "用户ID", required = true, dataType = "String", paramType = "query")
    @ApiOperation(value = "注销", response = User.class, responseContainer = "list")
    public JSONResult logout(String userId) throws Exception {
        redisOperator.del(USER_REDIS_SESSION + ":" + userId);
            return JSONResult.ok();
        }

}


