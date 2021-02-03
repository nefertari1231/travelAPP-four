package com.example.four.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.Date;

public class Share {
    @Id
    @Column(name = "share_id")
    private String shareId;

    /**
     * 分享内容
     */
    @Column(name = "share_content")
    private String shareContent;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 修改时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "share_img")
    private String shareImg;

    /**
     * @return share_id
     */
    public String getShareId() {
        return shareId;
    }

    /**
     * @param shareId
     */
    public void setShareId(String shareId) {
        this.shareId = shareId;
    }

    /**
     * 获取分享内容
     *
     * @return share_content - 分享内容
     */
    public String getShareContent() {
        return shareContent;
    }

    /**
     * 设置分享内容
     *
     * @param shareContent 分享内容
     */
    public void setShareContent(String shareContent) {
        this.shareContent = shareContent;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取修改时间
     *
     * @return update_time - 修改时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置修改时间
     *
     * @param updateTime 修改时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getShareImg() {
        return shareImg;
    }

    public void setShareImg(String shareImg) {
        this.shareImg = shareImg;
    }
}