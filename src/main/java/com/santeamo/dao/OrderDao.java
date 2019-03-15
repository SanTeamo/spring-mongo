package com.santeamo.dao;

import com.santeamo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface OrderDao extends BaseDao {
    Page<Order> findOrdersByUserId(String userId, Pageable pageable);

    void confirmOrder(Order order);

    Page<Order> findnotDoneOrders(String userId, Pageable pageable);

    Page<Order> findDoneOrders(String userId, Pageable pageable);
}
