package com.example.four.service;

import com.example.four.entity.Server;
import com.example.four.mapper.ServerMapper;
import com.example.four.utils.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ServerServiceImpl extends BaseService<ServerMapper, Server> implements ServerService{

    @Autowired
    private ServerMapper serverMapper;

    @Autowired
    private Sid sid;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void saveServer(Server server) {

        String serverId = sid.nextShort();

            server.setServerId(serverId);

            serverMapper.insert(server);

    }
}
