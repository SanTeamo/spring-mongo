package com.santeamo.model;

import java.io.Serializable;
/**
 *  商品、数量包装类
 *  Created by santeamo on 2019/03/07
 */
public class ProductWrapper implements Serializable {
    private static final long serialVersionUID = -3821217455091765812L;
    private String pid;
    private String pname;//产品名称
    private String pimage;//产品图片
    private Double price;//产品价格
    private Integer catId;//产品分类ID
    private Integer num;//数量
    private String sellerUserName;

    public ProductWrapper() {
    }

    public ProductWrapper(Product product,User seller,Integer num){
        this.pid = product.getId();
        this.pname = product.getPname();
        this.pimage = product.getPimage();
        this.price = product.getPrice();
        this.catId = product.getCatId();
        this.num = num;
        this.sellerUserName = seller.getUsername();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public void setProduct(Product product){
        //this.pid = product.getId();
        this.pname = product.getPname();
        this.pimage = product.getPimage();
        this.price = product.getPrice();
        this.catId = product.getCatId();
        this.sellerUserName = product.getOwnerUserName();
    }

    @Override
    public String toString() {
        return "ProductWrapper{" +
                "pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", pimage='" + pimage + '\'' +
                ", price=" + price +
                ", catId=" + catId +
                ", num=" + num +
                ", sellerUserName='" + sellerUserName + '\'' +
                '}';
    }
}
