package com.santeamo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
/**
 *  订单实体类
 *  Created by santeamo on 2019/03/07
 */
@Document(collection = "order")
public class Order implements Serializable {
    @Id
    private String id;
    private String userId;
    private String sellerUserName;
    private List<ProductWrapper> productWrappers;
    private int status;//订单状态：0未确认；1未付款；2已付款未发货；3已发货未签收；4已确认收货；5已评价
    private Double totalPrice;
    private String recipient = "未填写";
    private String phone = "未填写";
    private String address = "未填写";
    private Date orderTime;

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

    public String getSellerUserName() {
        return sellerUserName;
    }

    public void setSellerUserName(String sellerUserName) {
        this.sellerUserName = sellerUserName;
    }

    public List<ProductWrapper> getProductWrappers() {
        return productWrappers;
    }

    public void setProductWrappers(List<ProductWrapper> productWrappers) {
        this.productWrappers = productWrappers;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", sellerUserName='" + sellerUserName + '\'' +
                ", productWrappers=" + productWrappers +
                ", status=" + status +
                ", totalPrice=" + totalPrice +
                ", recipient='" + recipient + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", orderTime=" + orderTime +
                '}';
    }
}
