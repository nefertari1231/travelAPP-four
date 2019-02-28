package com.example.four.service;

import com.example.four.entity.Server;
import com.example.four.entity.Share;
import com.example.four.mapper.ServerMapper;
import com.example.four.mapper.ShareMapper;
import com.example.four.utils.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ShareService extends BaseService<ShareMapper, Share>{

    @Autowired
    private ShareMapper shareMapper;

    @Autowired
    private Sid sid;

    public void saveShare(Share share) {

        String shareId = sid.nextShort();

        share.setShareId(shareId);

        shareMapper.insert(share);

    }

    public List<Server> query() {
        return null;
    }
}
