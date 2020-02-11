package com.santeamo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 农产品评价实体类
 *  Created by santeamo on 2019/03/02
 */
@Document(collection = "evaluation")
public class Evaluation implements Serializable {
    private static final long serialVersionUID = -2375565523409189395L;
    @Id
    private String id;//评价ID
    private String pid;//产品ID
    private List<Comment> comments = new ArrayList<>();

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Evaluation{" +
                "id='" + id + '\'' +
                ", pid='" + pid + '\'' +
                ", comments=" + comments +
                '}';
    }
}
