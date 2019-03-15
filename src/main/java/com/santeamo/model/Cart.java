package com.santeamo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 *  购物车映射
 *  Created by santeamo on 2019/03/07
 */
@Document(collection = "cart")
public class Cart implements Serializable {

    private static final long serialVersionUID = 5897287819409534970L;

    @Id
    private String id;

    private String userId;

    private List<ProductWrapper> productWrappers = new ArrayList<>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<ProductWrapper> getProductWrappers() {
        return productWrappers;
    }

    public void setProductWrappers(List<ProductWrapper> productWrappers) {
        this.productWrappers = productWrappers;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", productWrappers=" + productWrappers +
                '}';
    }
}
