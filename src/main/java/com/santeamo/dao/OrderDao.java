package com.santeamo.dao;

import com.santeamo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface OrderDao extends BaseDao {
    Page<Order> findOrderById(String userId, Pageable pageable);
}
