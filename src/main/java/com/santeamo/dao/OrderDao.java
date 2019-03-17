package com.santeamo.dao;

import com.mongodb.WriteResult;
import com.santeamo.myenum.OrderStatus;
import com.santeamo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Query;

import java.util.List;

public interface OrderDao extends BaseDao {

    Page<Order> findOrdersByQuery(Query query, Pageable pageable);

    WriteResult confirmOrder(Order order);

    void createOrder(List<Order> orders);

    WriteResult changeStatus(String orderId, OrderStatus status);

    Order findOrderByQuery(Query query);
}
