package com.example.four.utils;

import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;
import org.json.JSONException;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * 短信发送工具类，一定不要动！！！
 */
@Component
public class SmsUtil {

    //短信应用SDK AppI
    private static int appid = 1400180960;

    //短信应用SDK AppKey
    private static String appkey = "b88bb8db67d839d92a231a2dc138a89b";

    //签名
    private static String smsSign = "异同行"; // NOTE: 这里的签名"腾讯云"只是一个示例，真实的签名需要在短信控制台中申请，另外签名参数使用的是`签名内容`，而不是`签名ID`

    public static Integer codeTemplate= 271702;


    /**
     *短信发送的静态工具方法
     * @param templateId 模板id，本类中的静态常量，分别对应不同的短信模板
     * @param phoneNumber 接收短信的手机号码
     * @param param 这个是在定义短信模板的时候{1}中的内容，在本项目中，可以是六位短信验证码、订单号
     */
    public static void sendSms(int templateId,String phoneNumber,String param){
        try {
            //数组具体的元素个数和模板中变量个数必须一致，
            // 例如事例中templateId:5678对应一个变量，参数数组中元素个数也必须是一个
            String[] params=new String[1];
            params[0]=param;

            SmsSingleSender ssender = new SmsSingleSender(appid, appkey);
            SmsSingleSenderResult result = ssender.sendWithParam("86", phoneNumber,
                    templateId, params, smsSign, "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
            System.out.println(result);
        } catch (HTTPException | IOException | JSONException e) {
            // HTTP响应码错误||网络IO错误||json解析错误
            e.printStackTrace();
        }
    }

}
