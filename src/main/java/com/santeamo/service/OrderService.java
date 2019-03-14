package com.santeamo.service;

import com.santeamo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface OrderService extends BaseService {
    Page<Order> findOrderById(String userId, Pageable pageable);
}
