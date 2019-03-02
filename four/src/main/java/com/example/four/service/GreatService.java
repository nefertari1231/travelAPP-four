package com.example.four.service;

import com.alibaba.fastjson.JSON;
import com.example.four.VO.GreatVO;
import com.example.four.entity.Great;
import com.example.four.entity.Server;
import com.example.four.entity.User;
import com.example.four.mapper.GreatMapper;
import com.example.four.mapper.ServerMapper;
import com.example.four.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GreatService extends BaseService<GreatMapper, Great> {

    @Autowired
    private GreatMapper greatMapper;

    @Autowired
    private ServerMapper serverMapper;

    @Autowired
    private UserMapper userMapper;

    /**
     * 用户对于服务的点赞
     */
    public void great(Great great){
        List<Great> select = greatMapper.select(great);
        if(select.size()>0) {
            //当点赞记录存在 则删除
            greatMapper.delete(select.get(0));
        } else {
            //当点赞记录不存在 则保存
            greatMapper.insert(great);
        }
    }

    /**
     * 获取某用户所有收到的点赞
     * @param userId
     * @return
     */
    public List<GreatVO> getAllGreats(Integer userId) {
        Server server = new Server();
        server.setUserId(userId);
        List<Server> select = serverMapper.select(server);//获取自己所有发布的服务
        List<Great> greatsList = new ArrayList<Great>(0);
        for (Server servers : select) {
            greatsList.addAll(greatMapper.select(new Great(servers.getServerId())));//获取发布过的所有服务的点赞列表
        }
        System.out.println(JSON.toJSONString(greatsList));
        List<GreatVO> greatVOList = new ArrayList<GreatVO>(0);
        for (Great great : greatsList) {
            User user = userMapper.getByUserId(great.getUserId());
            user.removeUser();
            Server server_r = serverMapper.selectOne(new Server(great.getServerId()));
            greatVOList.add(new GreatVO(server_r, user));
        }
        return greatVOList;
    }

    /**
     * 获取用户点赞状态
     * @return
     */
    public boolean getGreatStatus(Great great) {
        Great great_r = greatMapper.selectOne(great);
        if(great_r!=null) {
            return true;
        }
        return false;
    }
}
