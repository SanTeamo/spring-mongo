package com.santeamo.model;
/**
 *
 * 农产品实体类
 *  Created by santeamo on 2019/03/02
 */
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Document(collection = "product")
public class Product implements Serializable {

    private static final long serialVersionUID = 5976714395596053072L;

    @Id
    private String id;

    private String pname;//产品名称
    private String pimage;//产品图片
    private Double price;//产品价格
    private String pdesc;//产品描述
    private String pdescImage;//产品描述图片
    private Integer catId;//产品分类ID
    private Integer sales;//产品销量
    private String owner;//产品所有者
    private String evalId;//产品评论ID

    public Product() {
    }

    public Product(String id, String pname, String pimage, Double price, String pdesc, String pdescImage, Integer catId, Integer sales, String owner, String evalId) {
        this.id = id;
        this.pname = pname;
        this.pimage = pimage;
        this.price = price;
        this.pdesc = pdesc;
        this.pdescImage = pdescImage;
        this.catId = catId;
        this.sales = sales;
        this.owner = owner;
        this.evalId = evalId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public String getPdescImage() {
        return pdescImage;
    }

    public void setPdescImage(String pdescImage) {
        this.pdescImage = pdescImage;
    }

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getEvalId() {
        return evalId;
    }

    public void setEvalId(String evalId) {
        this.evalId = evalId;
    }
}
