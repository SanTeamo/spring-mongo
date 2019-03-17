package com.santeamo.myenum;

public enum OrderStatus {
    NOTCONFIRM(0),CONFIRMED(1),PAYED(2),SENDOUT(3),SIGNED(4),COMMENTED(5);

    private Integer status;

    private OrderStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus(){
        return status;
    }
}
