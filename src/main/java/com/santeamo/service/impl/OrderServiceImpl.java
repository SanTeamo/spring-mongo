package com.santeamo.service.impl;

import com.mongodb.WriteResult;
import com.santeamo.model.User;
import com.santeamo.myenum.OrderStatus;
import com.santeamo.dao.OrderDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Order;
import com.santeamo.model.Product;
import com.santeamo.model.ProductWrapper;
import com.santeamo.myenum.UserType;
import com.santeamo.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    @Resource
    private ProductDao productDao;

    @Override
    public Page<Order> findOrders(User user, Pageable pageable) {
        if (user.getType() == UserType.USER.getType()){
            Query query = new Query(Criteria.where("userId").is(user.getId()));
            return orderDao.findOrdersByQuery(query,pageable);
        }
        if (user.getType()  == UserType.SELLER.getType()){
            Query query = new Query(Criteria.where("sellerUserName").is(user.getUsername()));
            return orderDao.findOrdersByQuery(query,pageable);
        }
        return null;
    }

    /*
    查询未完成订单
     */
    @Override
    public Page<Order> findnotDoneOrders(User user, Pageable pageable) {
        if (user.getType() == UserType.USER.getType()){
            Query query = new Query(Criteria.where("userId").is(user.getId()).and("status").lt(OrderStatus.SIGNED.getStatus()));
            return orderDao.findOrdersByQuery(query,pageable);
        }
        if (user.getType() == UserType.SELLER.getType()){
            Query query = new Query(Criteria.where("sellerUserName").is(user.getUsername()).and("status").lt(OrderStatus.SIGNED.getStatus()));
            return orderDao.findOrdersByQuery(query,pageable);
        }
        return null;
    }

    /*
    查询已完成订单
     */
    @Override
    public Page<Order> findDoneOrders(User user, Pageable pageable) {
        if (user.getType() == UserType.USER.getType()){
            Query query = new Query(Criteria.where("userId").is(user.getId()).and("status").gte(OrderStatus.SIGNED.getStatus()));
            return orderDao.findOrdersByQuery(query,pageable);
        }
        if (user.getType() == UserType.SELLER.getType()){
            Query query = new Query(Criteria.where("sellerUserName").is(user.getUsername()).and("status").gte(OrderStatus.SIGNED.getStatus()));
            return orderDao.findOrdersByQuery(query,pageable);
        }
        return null;
    }

    @Override
    public Order findOrderByOIdAndUser(String oid, User user) {
        if (user.getType() == UserType.USER.getType()){
            Query query = new Query(Criteria.where("id").is(oid).and("userId").is(user.getId()));
            return orderDao.findOrderByQuery(query);
        }
        if (user.getType() == UserType.SELLER.getType()){
            Query query = new Query(Criteria.where("id").is(oid).and("sellerUserName").is(user.getUsername()));
            return orderDao.findOrderByQuery(query);
        }
        return null;
    }


    @Override
    public Boolean createOrder(Order order) {
        List<ProductWrapper> productWrappers = order.getProductWrappers();
        Map<String,List<ProductWrapper>> map = new HashMap<>();
        for (ProductWrapper productWrapper : productWrappers){
            Product product = productDao.getProductByPid(productWrapper.getPid());
            productWrapper.setProduct(product);
            if (map.containsKey(productWrapper.getSellerUserName())){
                map.get(productWrapper.getSellerUserName()).add(productWrapper);
            }else {
                map.put(productWrapper.getSellerUserName(),new ArrayList<ProductWrapper>());
                map.get(productWrapper.getSellerUserName()).add(productWrapper);
            }
        }
        List<Order> orders = new ArrayList<>();
        for (String sellerUserName:map.keySet()){
            //System.out.println(sellerUserName);
            Order newOrder = new Order();
            newOrder.setUserId(order.getUserId());
            newOrder.setSellerUserName(sellerUserName);
            newOrder.setProductWrappers(map.get(sellerUserName));
            newOrder.setStatus(order.getStatus());
            List<ProductWrapper> wrappers = newOrder.getProductWrappers();
            Double totalPrice = 0D;
            for (ProductWrapper wrapper : wrappers){
                totalPrice = totalPrice + wrapper.getNum()*wrapper.getPrice();
            }
            newOrder.setTotalPrice(totalPrice);
            newOrder.setRecipient("未填写");
            newOrder.setPhone("未填写");
            newOrder.setAddress("未填写");
            newOrder.setOrderTime(order.getOrderTime());
            //System.out.println(newOrder);
            orders.add(newOrder);
        }
        //System.out.println(orders);
        orderDao.createOrder(orders);
        return true;

    }

    @Override
    public Boolean confirmOrder(Order order) {
        order.setStatus(OrderStatus.CONFIRMED.getStatus());
        WriteResult writeResult = orderDao.confirmOrder(order);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Boolean payOrder(String orderId) {
        WriteResult writeResult = orderDao.changeStatus(orderId, OrderStatus.PAYED);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Boolean signOrder(String orderId) {
        WriteResult writeResult = orderDao.changeStatus(orderId, OrderStatus.SIGNED);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Boolean sendOut(String orderId) {
        WriteResult writeResult = orderDao.changeStatus(orderId, OrderStatus.SENDOUT);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }
}
