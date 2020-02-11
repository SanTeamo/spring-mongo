package com.santeamo.myenum;

/**
 * The enum Order status.
 * @author 沈玏
 */
public enum OrderStatus {
    /**
     * Notconfirm order status.
     */
    NOTCONFIRM(0),
    /**
     * Confirmed order status.
     */
    CONFIRMED(1),
    /**
     * Payed order status.
     */
    PAYED(2),
    /**
     * Sendout order status.
     */
    SENDOUT(3),
    /**
     * Signed order status.
     */
    SIGNED(4),
    /**
     * Commented order status.
     */
    COMMENTED(5);

    private Integer status;

    private OrderStatus(Integer status) {
        this.status = status;
    }

    /**
     * Get status integer.
     *
     * @return the integer
     * @author 沈玏
     */
    public Integer getStatus(){
        return status;
    }
}
