package com.example.four.service;

import com.example.four.entity.Collect;

import com.example.four.mapper.CollectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollectService extends BaseService<CollectMapper, Collect> {

    @Autowired
    private CollectMapper collectMapper;

    public void insertCollect (Collect collect) {

        collectMapper.insertCollect(collect);

    }
    public int deleteByCollectName(String collectName) {

        return collectMapper.deleteByCollectName(collectName);
    }

}
