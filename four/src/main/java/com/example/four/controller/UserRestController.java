package com.example.four.controller;

import com.example.four.VO.UserVO;
import com.example.four.entity.User;
import com.example.four.service.UserService;
import com.example.four.utils.JSONResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RequestMapping(value ="api/users", produces = {APPLICATION_JSON_UTF8_VALUE})
@RestController
@CrossOrigin
@Api(value = "api/users", tags ="usersApi", description = "用户相关业务接口")
public class UserRestController  {
    @Value("${jwt.header}")
    private String tokenHeader;

    @Autowired
    private UserService userService;

    private Logger logger=LoggerFactory.getLogger(this.getClass());

    @PutMapping(value = "/update")
    @ApiOperation(value = "用户更新", response = User.class, responseContainer = "list")
    public JSONResult updateUserInfo (@RequestBody User user) {

        userService.updateByUserId(user);

        return JSONResult.ok();
    }

    @PostMapping(value = "/uploadUserIcon")
    @ApiOperation(value = "用户上传头像", response = User.class, responseContainer = "list")
    @ApiImplicitParam(name="userId", value = "用户ID", required = true, dataType = "String", paramType = "query")
    public JSONResult uploadUserIcon (Integer userId, @RequestParam("file") MultipartFile file) throws Exception {
//        StringUtils.isBlank(userId)
        if (userId == null) {
            return JSONResult.errorMsg("用户Id不能为空...");
        }

        //头像保存命名空间
        String fileSpace = "D:/item/user_detail";

        //保存到数据库的相对路径
        String uploadPathDB = "/" + userId + "/Icon";

        SavePic savePic = new SavePic(file, fileSpace, uploadPathDB).invoke();
        if (savePic.is()) return JSONResult.errorMsg("上传出错...");
        uploadPathDB = savePic.getUploadPathDB();

        User user = new User();
        user.setUserId(userId);
        user.setUserIcon(uploadPathDB);
        userService.updateUserInfo(user);

        return JSONResult.ok(uploadPathDB);
    }

    @PostMapping(value = "/uploadUserBg")
    @ApiOperation(value = "用户上传壁纸", response = User.class, responseContainer = "list")
    @ApiImplicitParam(name="userId", value = "用户ID", required = true, dataType = "String", paramType = "query")
    public JSONResult uploadUserBg (Integer userId, @RequestParam("file") MultipartFile file) throws Exception {

        if (userId == null) {
            return JSONResult.errorMsg("用户Id不能为空...");
        }

        //壁纸保存命名空间
        String fileSpace = "D:/item/user_detail";

        //保存到数据库的相对路径
        String uploadPathDB = "/" + userId + "/Bg";

        SavePic savePic = new SavePic(file, fileSpace, uploadPathDB).invoke();
        if (savePic.is()) return JSONResult.errorMsg("上传出错...");
        uploadPathDB = savePic.getUploadPathDB();

        User user = new User();
        user.setUserId(userId);
        user.setUserBg(uploadPathDB);
        userService.updateUserInfo(user);

        return JSONResult.ok(uploadPathDB);
    }

    @GetMapping(value = "/query")
    @ApiOperation(value = "查询用户信息", response = User.class, responseContainer = "list")
    @ApiImplicitParam(name="userId", value = "用户ID", required = true, dataType = "String", paramType = "query")
    public JSONResult query (Integer userId) throws Exception {

        if (userId == null) {
            return JSONResult.errorMsg("用户Id不能为空...");
        }

        User userInfo = userService.queryUserInfo(userId);
        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(userInfo,userVO);

        return JSONResult.ok(userVO);
    }


    private static class SavePic {
        private boolean myResult;
        private MultipartFile file;
        private String fileSpace;
        private String uploadPathDB;

        public SavePic(MultipartFile file, String fileSpace, String uploadPathDB) {
            this.file = file;
            this.fileSpace = fileSpace;
            this.uploadPathDB = uploadPathDB;
        }

        boolean is() {
            return myResult;
        }

        public String getUploadPathDB() {
            return uploadPathDB;
        }

        public SavePic invoke() throws IOException {
            FileOutputStream fileOutputStream = null;
            InputStream inputStream = null;
            try {
                if (file != null) {

                    String fileName = file.getOriginalFilename();
                    if (StringUtils.isNotBlank(fileName)) {

                        //文件上传的最终保存路径
                        String finalIconPath = fileSpace + uploadPathDB + "/" + fileName;

                        //设置数据库保存的路径
                        uploadPathDB += ( "/" + fileName);

                        File outFile = new File(finalIconPath);
                        if (outFile.getParentFile() != null || !outFile.getParentFile().isDirectory()) {
                            //创建父文件夹
                            outFile.getParentFile().mkdirs();
                        }
                        fileOutputStream = new FileOutputStream(outFile);
                        inputStream = file.getInputStream();
                        IOUtils.copy(inputStream,fileOutputStream);
                    }

                } else {
                    myResult = true;
                    return this;
                }
            } catch (Exception e) {
                e.printStackTrace();
                myResult = true;
                return this;
            } finally {
                if (fileOutputStream != null) {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
            }
            myResult = false;
            return this;
        }
    }
}
