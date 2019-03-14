package com.santeamo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *  购物车实体类
 *  Created by santeamo on 2019/03/11
 */
public class CartWrapper implements Serializable {
    private static final long serialVersionUID = 8875602681930628848L;

    private String id;

    private String userId;

    private List<CartItemWrapper> cartItemWrappers = new ArrayList<>();

    public CartWrapper(String id, String userId, List<CartItemWrapper> cartItemWrappers) {
        this.id = id;
        this.userId = userId;
        this.cartItemWrappers = cartItemWrappers;
    }

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

    public List<CartItemWrapper> getCartItemWrappers() {
        return cartItemWrappers;
    }

    public void setCartItemWrappers(List<CartItemWrapper> cartItemWrappers) {
        this.cartItemWrappers = cartItemWrappers;
    }
}
