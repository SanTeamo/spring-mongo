package com.santeamo.model;

import java.io.Serializable;
/**
 *  购物车内商品映射
 *  Created by santeamo on 2019/03/07
 */
public class CartItem implements Serializable {
    private static final long serialVersionUID = -3821217455091765812L;
    private String pid;
    private Integer num;

    public CartItem() {
    }

    public CartItem(String pid, Integer num) {
        this.pid = pid;
        this.num = num;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "pid='" + pid + '\'' +
                ", num=" + num +
                '}';
    }
}
