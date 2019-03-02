package com.example.four.VO;

import com.example.four.entity.Server;
import com.example.four.entity.User;

public class GreatVO {
    /**服务**/
    private Server server;

    /**用户**/
    private User user;

    public Server getServer() {
        return server;
    }

    public GreatVO() {
    }

    public GreatVO(Server server, User user) {
        this.server = server;
        this.user = user;
    }

    public void setServer(Server server) {
        this.server = server;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
