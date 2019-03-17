package com.santeamo.service;

import com.santeamo.model.Order;
import com.santeamo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface OrderService extends BaseService {
    Page<Order> findOrders(User user, Pageable pageable);

    Page<Order> findnotDoneOrders(User user, Pageable pageable);

    Page<Order> findDoneOrders(User user, Pageable pageable);

    Order findOrderByOIdAndUser(String oid, User user);

    Boolean createOrder(Order order);

    Boolean confirmOrder(Order order);

    Boolean payOrder(String orderId);

    Boolean signOrder(String orderId);

    Boolean sendOut(String orderId);
}
