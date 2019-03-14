package com.santeamo.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {
    private static final long serialVersionUID = -2658479125521407796L;
    //private String id;
    private int score;
    private String description;
    private String username;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date commentTime;

    /*public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }*/

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

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

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                //"id='" + id + '\'' +
                "score=" + score +
                ", description='" + description + '\'' +
                ", username='" + username + '\'' +
                ", commentTime=" + commentTime +
                '}';
    }
}
