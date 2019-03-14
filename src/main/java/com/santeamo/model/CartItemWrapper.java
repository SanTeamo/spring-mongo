package com.santeamo.model;

import java.io.Serializable;
/**
 *  购物车内商品实体类
 *  Created by santeamo on 2019/03/11
 */
public class CartItemWrapper implements Serializable {

    private static final long serialVersionUID = 8764124538862615873L;

    private Product product;

    private Integer num;

    public CartItemWrapper(Product product, Integer num) {
        this.product = product;
        this.num = num;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
