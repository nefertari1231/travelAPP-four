package com.example.four.controller;

import com.example.four.jopo.ErrorResponseEntity;
import com.example.four.jopo.Result;
import com.example.four.utils.DateUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value = "api/util", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@Api(value = "/util", tags = "UtilApi", description = "Util接口")
public class UtilController {
    private Logger logger = LoggerFactory.getLogger(UtilController.class);

    /**
     * 获取服务器时间
     * @return 返回服务器时间
     */
    @RequestMapping(value = "/getServerDateTime", method = RequestMethod.GET)
    @ApiOperation(
            value = "获取服务器的时间",
            response = Date.class
    )
    @ApiResponses(value = {
            @ApiResponse(code = 400, message = "获取服务器的时间失败",
                    response = ErrorResponseEntity.class)
    })
    public ResponseEntity getServerDateTime() {
        return ResponseEntity.ok(new Date());
    }

    /**
     * 获取服务器的时间
     * @return 返回服务器的时间
     */
    @RequestMapping(value = "/getServerTime", method = RequestMethod.GET)
    @ApiOperation(
            value = "获取服务器的时间",
            response = Result.class
    )
    @ApiResponses(value = {
            @ApiResponse(code = 400, message = "获取服务器的时间失败",
                    response = ErrorResponseEntity.class)
    })
    public ResponseEntity getServerTime() {
        Date dateTime=new Date();
        return ResponseEntity.ok(new Result("200",DateUtil.getDateTimeWithSignString(dateTime).substring(11,16)));
    }
}
