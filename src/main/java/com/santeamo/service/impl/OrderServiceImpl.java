package com.santeamo.service.impl;

import com.santeamo.dao.OrderDao;
import com.santeamo.model.Order;
import com.santeamo.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    @Override
    public Page<Order> findOrderById(String userId, Pageable pageable) {
        return orderDao.findOrderById(userId,pageable);
    }
}
