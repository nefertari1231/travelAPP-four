package com.example.four.utils;

/**
 * 验证码生成工具类，已经配置好了，不要改动！！！！！！
 */
public class VerificationCodeUtil {


    /**
     * 生成随机的六位数串
     * @return 返回随机六位数串
     */


    public static String randomCode() {
        Integer res = (int)((Math.random()*9+1)*100000);
        return res+"";
    }
}
