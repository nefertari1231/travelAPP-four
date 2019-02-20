package com.example.four.controller;

import com.example.four.VO.UserVO;
import com.example.four.entity.User;
import com.example.four.jopo.ErrorResponseEntity;
import com.example.four.security.JwtAuthenticationRequest;
import com.example.four.security.JwtTokenUtil;
import com.example.four.service.JwtAuthenticationResponse;
import com.example.four.service.UserService;
import com.example.four.utils.JSONResult;
import com.example.four.utils.SmsUtil;
import com.example.four.utils.VerificationCodeUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;
import java.util.UUID;

@RestController
@Api(value = "/auth", tags = "AuthApi", description = "用户身份验证接口")
@RequestMapping("/auth")
@CrossOrigin
public class AuthenticationRestController extends BaseController{

    @Value("${jwt.header}")
    private String tokenHeader;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UserService userService;

    private Logger logger=LoggerFactory.getLogger(this.getClass());



    /**
     * 发送未注册手机验证码
     *
     * @param telephone 手机号码
     * @return 返回验证码发送结果，1为成功，0为失败
     */
    @PostMapping("/sendCode")
    public JSONResult sendCode(String telephone) {

        //判断用户名是否存在
        boolean usernameIsExist = userService.queryUsernameIsExist(telephone);

        if(!usernameIsExist) {
            return getCode(telephone);
        } else {
            return JSONResult.errorMsg("用户名已经存在，请换一个");
        }

    }

    /**
     * 发送已经注册手机验证码
     *
     * @param telephone 手机号码
     * @return 返回验证码发送结果，1为成功，0为失败
     */
    @PostMapping("/sendCoded")
    public JSONResult sendCoded (String telephone) {

        //判断用户名是否存在
        boolean usernameIsExist = userService.queryUsernameIsExist(telephone);

        if(usernameIsExist) {
            return getCode(telephone);
        } else {
            return JSONResult.errorMsg("用户名不存在,请先注册");
        }

    }

    /**
     * 获得验证码
     */
    private JSONResult getCode(String telephone) {
        String randomCode = VerificationCodeUtil.randomCode();  //验证码
        User user = new User();
        user.setPhone(telephone);
        user.setUsername(telephone);
        user.setUserCode(randomCode);
        User userResult = userService.getByUserPhone(user);//检验用户是否存在
        int codeResult;
        if (userResult == null) {//不存在则插入用户(手机号+ User_code=验证码)
            codeResult = userService.insert(user);
        } else {
            codeResult = userService.updateByUserPhone(user);//存在则更新User_code
        }
        if (codeResult == 1) {//如果新增用户或用户码更新成功则 发送验证码
            SmsUtil.sendSms(SmsUtil.codeTemplate, telephone, randomCode);
            System.out.println(randomCode);
            //该线程设置验证码超过1分钟之后失效
            new Thread(() -> {
                try {
                    Thread.sleep(60000);
                    User userSetNull = new User();
                    userSetNull.setPhone(telephone);
                    userSetNull.setUserCode("");//超过十分钟则将对应手机号的User_code设为空
                    userService.updateByUserPhone(userSetNull);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }).start();
            logger.info("向" + telephone + "发送注册验证码");
            return JSONResult.ok(1);
        } else {
            return JSONResult.ok(0);
        }
    }

    /**
     * 手机注册
     *
     * @param telephone 手机号码
     * @param code      手机收到的验证码
     * @param password  前端传入的密码
     * @return 注册结果
     */
    @PostMapping("/register")
    public JSONResult register(String telephone, String code, String password, HttpSession httpSession) {
        //判断用户名是否为空
        if (StringUtils.isBlank(telephone)) {
            return  JSONResult.errorMsg("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            return  JSONResult.errorMsg("密码不能为空");
        }
        if (StringUtils.isBlank(code)) {
            return  JSONResult.errorMsg("验证码不能为空");
        }

        User user = new User();
        user.setPhone(telephone);
        User resultUser = userService.getByUserPhone(user);
        if (resultUser.getUserCode().equals(code)) {
            resultUser.setPassword(password);
            int updateResult = userService.updatePasswordByUserPhone(resultUser);
            if (updateResult == 1) {
                logger.info("用户" + telephone + "注册成功");
                httpSession.setAttribute(telephone,telephone);
                return JSONResult.ok(resultUser);
            } else {
                userService.deleteByUserPhone(telephone);
                return JSONResult.ok(0);
            }
        } else {
            return JSONResult.errorMsg("验证错误");
        }
    }

    /**
     * 用手机密码登录
     *
     * @param telephone 前端传入的用户手机号码
     * @param password  前端传入的用户输入的密码
     * @return 返回Token结果
     */
    @PostMapping("/login")
    public JSONResult login ( String telephone, String password, HttpSession httpSession) {
        int LOGIN_SUCCESS =1;
        int PASSWORD_ERROR =2;
        //判断用户名是否为空
        if (StringUtils.isBlank(telephone) || StringUtils.isBlank(password)) {
            return JSONResult.errorMsg("用户名和密码不能为空");
        }

        //判断用户名密码是否存在
        int passwordIsExist  = userService.queryUserForLogin(telephone,password);

        if (passwordIsExist == LOGIN_SUCCESS) {
            JwtAuthenticationRequest authenticationRequest = new JwtAuthenticationRequest(telephone, password);
            authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());
            final UserDetails userDetails = userService.loadUserByUsername(authenticationRequest.getUsername());
            final String token = jwtTokenUtil.generateToken(userDetails);
            User userResult = (User) userDetails;
            if (userResult.getUserToken() == null || userResult.getUserToken().equals("")) {
                userResult.setUserToken(token);
                userService.updateByUserName(userResult);
                logger.info("JwtToken" + userResult.getUserToken());
            }
            httpSession.setAttribute(telephone, telephone);
            String uniqueToken = UUID.randomUUID().toString();
            redisOperator.set(USER_REDIS_SESSION + ":" + userResult.getUserId(),uniqueToken, 1000 * 60);
            UserVO userVO = new UserVO();
            BeanUtils.copyProperties(userResult,userVO);
            userVO.setRedisToken(uniqueToken);
            System.out.println(userVO);
            return JSONResult.ok(userVO);
        } else if (passwordIsExist == PASSWORD_ERROR){
            return JSONResult.errorMsg("密码不正确");
        } else {
            return JSONResult.errorMsg("该用户没有注册，请先注册");
        }
    }

    /**
     * 用手机号码修改密码
     *
     * @param telephone   手机号码
     * @param code        验证码
     * @param newPassword 新密码
     * @return 返回修改结果
     */
    @PostMapping("/changeUserPassword")
    public JSONResult changeUserPassword(String telephone,  String code, String newPassword, HttpSession httpSession) {

        User user = new User();
        user.setPhone(telephone);
        User resultUser = userService.getByUserPhone(user);
        if (resultUser.getUserCode().equals(code)) {
            resultUser.setPassword(newPassword);
            int updateResult = userService.updatePasswordByUserPhone(resultUser);
            if (updateResult == 1) {
                logger.info("用户" + telephone + "修改密码成功");
                httpSession.setAttribute(telephone,telephone);
                return JSONResult.ok(resultUser);
            } else {
                userService.deleteByUserPhone(telephone);
                return JSONResult.ok(0);
            }
        } else {
            return JSONResult.errorMsg("验证错误");
        }
    }

    /**
     * 注销
     */
    @GetMapping("/logout")
    public ResponseEntity logout(Integer userId, HttpSession httpSession){
        User user = userService.getByUserId(userId);
        if (user != null){
            user.setUserToken(null);
            int logoutResult = userService.updateByUserId(user);
            redisOperator.del(USER_REDIS_SESSION + ":" + userId);
            if(httpSession != null){
                httpSession.removeAttribute(user.getUsername());
                httpSession.invalidate();
            }
            logger.info("用户"+userId+"注销成功");
            return ResponseEntity.ok(logoutResult==1?1:0);
        }else {
            return ResponseEntity.ok(0);
        }
    }

    @GetMapping(value = "${jwt.route.authentication.refresh}")
    @ApiOperation(
            value = "refreshToken",
            response = JwtAuthenticationResponse.class
    )
    @ApiResponses(value = {
            @ApiResponse(code = 400, message = "更新token失败",
                    response = ErrorResponseEntity.class)
    })
    public ResponseEntity<?> refreshAndGetAuthenticationToken(HttpServletRequest request) {
        String authToken = request.getHeader(tokenHeader);
        final String token = authToken.substring(7);
        String username = jwtTokenUtil.getUsernameFromToken(token);
        User user = (User) userService.loadUserByUsername(username);

        if (jwtTokenUtil.canTokenBeRefreshed(token, user.getCreateTime())) {
            String refreshedToken = jwtTokenUtil.refreshToken(token);
            return ResponseEntity.ok(new JwtAuthenticationResponse(refreshedToken));
        } else {
            return ResponseEntity.badRequest().body(null);
        }
    }

    @ExceptionHandler({AuthenticationException.class})
    public ResponseEntity<String> handleAuthenticationException(AuthenticationException e) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
    }

    /**
     * Authenticates the user. If something is wrong, an {@link AuthenticationException} will be thrown
     */
    private void authenticate(String username, String password) {
        Objects.requireNonNull(username);
        Objects.requireNonNull(password);

        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (DisabledException e) {
            throw new AuthenticationException("User is disabled!", e);
        } catch (BadCredentialsException e) {
            throw new AuthenticationException("Bad credentials!", e);
        }
    }
}
