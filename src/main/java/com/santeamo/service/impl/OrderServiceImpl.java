package com.santeamo.service.impl;

import com.santeamo.dao.OrderDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Order;
import com.santeamo.model.Product;
import com.santeamo.model.ProductWrapper;
import com.santeamo.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    @Resource
    private ProductDao productDao;

    @Override
    public Page<Order> findOrdersByUserId(String userId, Pageable pageable) {
        return orderDao.findOrdersByUserId(userId,pageable);
    }

    @Override
    public void createOrder(Order order) {
        List<ProductWrapper> productWrappers = order.getProductWrappers();
        for (ProductWrapper productWrapper : productWrappers){
            Product product = productDao.getProductByPid(productWrapper.getPid());
            productWrapper.setProduct(product);
        }
        orderDao.insert(order);
    }

    @Override
    public Order findOrderByOrderId(String orderId) {
        return orderDao.findById(Order.class,orderId);
    }

    @Override
    public void confirmOrder(Order order) {
        orderDao.confirmOrder(order);
    }

    @Override
    public Page<Order> findnotDoneOrders(String userId, Pageable pageable) {
        return orderDao.findnotDoneOrders(userId,pageable);
    }

    @Override
    public Page<Order> findDoneOrders(String userId, Pageable pageable) {
        return orderDao.findDoneOrders(userId,pageable);
    }
}
