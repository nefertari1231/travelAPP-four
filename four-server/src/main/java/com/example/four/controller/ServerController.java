package com.example.four.controller;

import com.example.four.VO.CityVO;
import com.example.four.entity.*;
import com.example.four.exception.IllegalException;
import com.example.four.service.CityService;
import com.example.four.service.ServerService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/servers", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/servers", tags ="serversApi", description = "服务接口")
public class ServerController {

    @Autowired
    private ServerService serverService;

    @Autowired
    private CityService cityService;

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
        server.setUserId(server.getUserId());
        server.setServerStatus(0);//设置服务状态
        server.setCreateTime(new Date());
        serverService.saveServer(server);

        return JSONResult.ok(server);
    }

    @GetMapping(value = "/all")
    @ApiOperation(value = "获取全部服务", response = Server.class, responseReference = "list")
    public JSONResult getAllServers() {
        return JSONResult.ok(serverService.getAllServers());
    }

    @GetMapping(value = "/city")
    @ApiOperation(value = "获取全部周边玩的国家和城市", response = CityVO.class ,responseReference = "list")
    public JSONResult getAllCity() {
        return JSONResult.ok(cityService.getAllCity());
    }

    @GetMapping(value = "/hotspot")
    @ApiOperation(value = "根据 cityMenuId 查询出热门景点", response = Hotspot.class, responseReference = "list")
    public JSONResult getHotspotByCity(Integer cityMenuId) {
        return JSONResult.ok(cityService.getAllHotspot(cityMenuId));
    }

    @GetMapping(value = "/foods")
    @ApiOperation(value = "根据 cityMenuId 查询出美食", response = Foods.class, responseReference = "list")
    public JSONResult getFoodsByCity(Integer cityMenuId) {
        return JSONResult.ok(cityService.getAllFoods(cityMenuId));
    }

    @GetMapping(value = "/place")
    @ApiOperation(value = "根据 cityMenuId 查询出去处", response = Place.class, responseReference = "list")
    public JSONResult getPlaceByCity(Integer cityMenuId) {
        return JSONResult.ok(cityService.getAllPlace(cityMenuId));
    }


    @DeleteMapping(value = "/foods")
    @ApiOperation(value = "删除食品")
    public JSONResult delFoodsById(Integer foodsId) {
        cityService.delFoodsById(foodsId);
        return JSONResult.ok();
    }

    @PutMapping(value = "/foods")
    @ApiOperation(value = "修改美食内容")
    public JSONResult updateFoodsById(@RequestBody Foods foods){
        cityService.updataFoodsById(foods);
        return JSONResult.ok();
    }

    @PostMapping(value = "/foods")
    @ApiOperation(value = "新增美食")
    public JSONResult insertFoods(@RequestBody Foods foods) throws IOException, IllegalException {
        foods.uploadImg();
        cityService.insertFoods(foods);
        return JSONResult.ok();
    }

    @PostMapping(value = "/city")
    @ApiOperation(value = "新增城市")
    public JSONResult insertCity(@RequestBody CityMenu cityMenu) throws IOException, IllegalException {
        cityMenu.uploadImg();
        cityService.insertCity(cityMenu);
        return JSONResult.ok();
    }



}
