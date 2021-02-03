package com.example.four.mapper;

import com.example.four.VO.ServerVO;
import com.example.four.entity.Server;
import com.example.four.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ServerMapper extends MyMapper<Server> {
    //更新服务状态
    int updateServerStatus(Server server);
}