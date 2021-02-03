package com.example.four.service;

import com.example.four.VO.ServerVO;
import com.example.four.entity.Server;
import com.example.four.mapper.ServerMapper;
import com.example.four.utils.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class ServerService extends BaseService<ServerMapper, Server> {

    @Autowired
    private ServerMapper serverMapper;

    @Autowired
    private Sid sid;

    public void saveServer(Server server) {

        String serverId = sid.nextShort();

            server.setServerId(serverId);

            serverMapper.insert(server);
    }

    /**
     *  获取全部服务
     * @return {@link Server}
     */
    public List<Server> getAllServers() {
        return serverMapper.select(new Server(0));
    }

    /**
     * 更新服务状态
     */
    public int updateServers(Server server) {
        System.out.println(server);
        return serverMapper.updateServerStatus(server);
    }
}
