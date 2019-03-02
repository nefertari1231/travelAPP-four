package com.example.four.controller;

import com.example.four.VO.GreatVO;
import com.example.four.entity.Great;
import com.example.four.service.GreatService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/great", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/great", tags ="greatApi", description = "点赞接口")
public class GreatController {

    @Autowired
    private GreatService greatService;

    @GetMapping(value = "/getGreat")
    @ApiOperation(value = "根据 userId 获取发布的服务中的全部点赞", response = GreatVO.class, responseReference = "list")
    public JSONResult getAllGreatByUser(Integer userId) {
        List<GreatVO> allGreats = greatService.getAllGreats(userId);
        return JSONResult.ok(allGreats);
    }

    @GetMapping(value = "/getGreatStatus")
    @ApiOperation(value = "判断用户是否点赞该服务", response = boolean.class,responseReference = "list")
    public JSONResult getGreatStatus(String serverId, Integer userId) {
        if(serverId == null || serverId.equals("")){
            return JSONResult.ok(false);
        }
        return JSONResult.ok(greatService.getGreatStatus(new Great(userId, serverId)));
    }

    @GetMapping(value = "/toGreat")
    @ApiOperation(value = "用户对服务进行点赞", response = Great.class, responseReference = "list")
    public JSONResult toGreat(String serverId, Integer userId) {
        Great great = new Great(userId, serverId);
        greatService.great(great);
        return JSONResult.ok(great);
    }
}
