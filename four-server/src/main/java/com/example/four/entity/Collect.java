package com.example.four.entity;

import lombok.Data;

/**
 * order
 * @author 
 */
@Data
public class Collect {
    /**
     * 收藏id
     */
    private Integer collectId;

    /**
     * 用户Id
     */
    private Integer userId;

    /**
     * 收藏名称
     */
    private String collectName;


}