package com.santeamo.dao.impl;

import com.mongodb.WriteResult;
import com.santeamo.myenum.OrderStatus;
import com.santeamo.dao.OrderDao;
import com.santeamo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDao")
public class OrderDaoImpl extends MongoDBBaseDao implements OrderDao {

    @Override
    public Page<Order> findOrdersByQuery(Query query, Pageable pageable) {
        //System.out.println(query);
        long total = mongoTemplate.count(query,Order.class);
        List<Order> list = mongoTemplate.find(query.with(pageable),Order.class);
        Page<Order> page = new PageImpl<>(list,pageable,total);
        return page;
    }

    @Override
    public void createOrder(List<Order> orders) {
        mongoTemplate.insert(orders,Order.class);
    }

    @Override
    public WriteResult confirmOrder(Order order) {
        Query query = new Query(Criteria.where("id").is(order.getId()));
        Update update = new Update();
        update.set("recipient", order.getRecipient());
        update.set("phone", order.getPhone());
        update.set("address", order.getAddress());
        update.set("status", order.getStatus());
        return  mongoTemplate.updateFirst(query,update,Order.class);
    }

    @Override
    public WriteResult changeStatus(String orderId, OrderStatus status) {
        Query query = new Query(Criteria.where("id").is(orderId));
        Update update = new Update();
        update.set("status",status.getStatus());
        return mongoTemplate.updateFirst(query,update,Order.class);
    }

    @Override
    public Order findOrderByQuery(Query query) {
        return mongoTemplate.findOne(query,Order.class);
    }
}
