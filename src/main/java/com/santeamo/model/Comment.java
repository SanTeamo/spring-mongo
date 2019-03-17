package com.santeamo.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {
    private static final long serialVersionUID = -2658479125521407796L;
    //private String id;
    private String description;
    private String username;
    private Integer descScore;//描述相符
    private Integer serviceScore;//卖家服务
    private Integer logisticsScore;//物流服务

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date commentTime;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getDescScore() {
        return descScore;
    }

    public void setDescScore(Integer descScore) {
        this.descScore = descScore;
    }

    public Integer getServiceScore() {
        return serviceScore;
    }

    public void setServiceScore(Integer serviceScore) {
        this.serviceScore = serviceScore;
    }

    public Integer getLogisticsScore() {
        return logisticsScore;
    }

    public void setLogisticsScore(Integer logisticsScore) {
        this.logisticsScore = logisticsScore;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "description='" + description + '\'' +
                ", username='" + username + '\'' +
                ", descScore=" + descScore +
                ", serviceScore=" + serviceScore +
                ", logisticsScore=" + logisticsScore +
                ", commentTime=" + commentTime +
                '}';
    }
}
