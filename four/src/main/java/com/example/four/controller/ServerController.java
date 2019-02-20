package com.example.four.controller;

import com.example.four.entity.Server;
import com.example.four.service.ServerService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/servers", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/servers", tags ="serversApi", description = "服务接口")
public class ServerController {

    @Autowired
    private ServerService serverService;

    @PostMapping(value = "/saveServer")
    @ApiOperation(value = "保存服务", response = Server.class, responseContainer = "list")
    public JSONResult register(@RequestBody Server server) {

        //保存服务
        server.setServerName(server.getServerName());
        server.setServerDescription(server.getServerDescription());
        server.setServerIcon(server.getServerIcon());
        server.setServerPrice(server.getServerPrice());
        server.setServerPlace(server.getServerPlace());
        server.setServerRemark(server.getServerRemark());
        serverService.saveServer(server);

        return JSONResult.ok(server);
    }

}
