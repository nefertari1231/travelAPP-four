package com.example.four.Controller;

import com.alibaba.fastjson.JSON;
import com.example.four.entity.Discuss;
import com.example.four.mapper.DiscussMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DiscussController {

    @Autowired
    private DiscussMapper discussMapper;

    @Test
    public void insertCommentTest() {
        Discuss discuss = new Discuss();
        discuss.setDiscussContent("评论内容评论内容");
        discuss.setDiscussImg("https////img.mukewang.com/szimg/5c32c05b085f95bf06000338-360-202.jpg,https////img.mukewang.com/szimg/5c32c05b085f95bf06000338-360-202.jpg");
        discuss.setDiscussValue(5);
        discuss.setOrderSn("190228A3F5W492NC");
        discussMapper.insert(discuss);
    }

    @Test
    public void CommentTest() {
        List<Discuss> allByUser = discussMapper.getAllByUser(5);
        System.out.println(JSON.toJSONString(allByUser));
    }
}
