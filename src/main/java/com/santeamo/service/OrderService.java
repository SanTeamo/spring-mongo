package com.santeamo.service;

import com.santeamo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface OrderService extends BaseService {
    Page<Order> findOrdersByUserId(String userId, Pageable pageable);

    void createOrder(Order order);

    Order findOrderByOrderId(String orderId);

    void confirmOrder(Order order);

    Page<Order> findnotDoneOrders(String userId, Pageable pageable);

    Page<Order> findDoneOrders(String userId, Pageable pageable);
}
