package com.example.four.mapper;

import com.example.four.entity.Collect;
import com.example.four.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CollectMapper extends MyMapper<Collect> {
    void insertCollect(Collect collect);

    int deleteByCollectName(String collectName);
}
