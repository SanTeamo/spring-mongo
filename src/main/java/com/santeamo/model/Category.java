package com.santeamo.model;
/**
 * 农产品分类实体类
 *  Created by santeamo on 2019/03/02
 */
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Document(collection = "category")
public class Category implements Serializable {

    private static final long serialVersionUID = -1662501886792143394L;

    @Id
    private String id;

    private Integer catId;

    private String catName;

    public Category() {
    }

    public Category(String id, Integer catId, String catName) {
        this.id = id;
        this.catId = catId;
        this.catName = catName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id='" + id + '\'' +
                ", catId=" + catId +
                ", catName='" + catName + '\'' +
                '}';
    }
}
