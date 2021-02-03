package com.example.four.controller;

import com.example.four.entity.Collect;
import com.example.four.service.CollectService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/collect", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/collect", tags ="collectApi", description = "收藏接口")
public class CollectController {

    @Autowired
    private CollectService collectService;

    @PostMapping(value = "/saveCollect")
    @ApiOperation(value = "保存收藏", response = Collect.class, responseContainer = "list")
    public JSONResult saveCollect(@RequestBody Collect collect) {

        collectService.insertCollect(collect);
        return JSONResult.ok(collect);
    }

    @PostMapping(value = "/deleteCollect")
    @ApiOperation(value = "删除收藏", response = Collect.class, responseContainer = "list")
    public JSONResult deleteCollect(String collectName) {

        collectService.deleteByCollectName(collectName);
        return JSONResult.ok();
    }


}
