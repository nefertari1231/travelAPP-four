package com.example.four.service;

import com.example.four.entity.Discuss;
import com.example.four.mapper.DiscussMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscussService {

    @Autowired
    private DiscussMapper discussMapper;

    public void insertComment(Discuss discuss) {
        discussMapper.insert(discuss);
    }

    public List<Discuss> getAllComment(Integer userId) {
        return discussMapper.getAllByUser(userId);
    }

}
