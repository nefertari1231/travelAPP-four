package com.example.four.controller;

import com.example.four.entity.Share;
import com.example.four.service.ShareService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/share", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/share", tags ="shareApi", description = "分享接口")
public class ShareController {

    @Autowired
    private ShareService shareService;

    @PostMapping(value = "/saveShare")
    @ApiOperation(value = "保存分享", response = Share.class, responseContainer = "list")
    public JSONResult saveShare(@RequestBody Share share) {
        //保存分享
        share.setShareContent(share.getShareContent());
        shareService.saveShare(share);
        return JSONResult.ok(share);
    }
}
