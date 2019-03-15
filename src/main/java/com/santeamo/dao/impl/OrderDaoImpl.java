package com.santeamo.dao.impl;

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

    private final int doneStatus = 4;

    @Override
    public Page<Order> findOrdersByUserId(String userId, Pageable pageable) {
        Query query = new Query(Criteria.where("userId").is(userId));
        long total = mongoTemplate.count(query,Order.class);
        List<Order> list = mongoTemplate.find(query.with(pageable),Order.class);
        Page<Order> page = new PageImpl<>(list,pageable,total);
        return page;
    }

    @Override
    public void confirmOrder(Order order) {
        Query query = new Query(Criteria.where("id").is(order.getId()));
        Update update = new Update();
        update.set("recipient", order.getRecipient());
        update.set("phone", order.getPhone());
        update.set("address", order.getAddress());
        update.set("status", order.getStatus());
        mongoTemplate.updateFirst(query,update,Order.class);
    }

    @Override
    public Page<Order> findnotDoneOrders(String userId, Pageable pageable) {
        Query query = new Query(Criteria.where("userId").is(userId).and("status").lt(doneStatus));
        long total = mongoTemplate.count(query,Order.class);
        List<Order> list = mongoTemplate.find(query.with(pageable),Order.class);
        Page<Order> page = new PageImpl<>(list,pageable,total);
        return page;
    }

    @Override
    public Page<Order> findDoneOrders(String userId, Pageable pageable) {
        Query query = new Query(Criteria.where("userId").is(userId).and("status").gte(doneStatus));
        long total = mongoTemplate.count(query,Order.class);
        List<Order> list = mongoTemplate.find(query.with(pageable),Order.class);
        Page<Order> page = new PageImpl<>(list,pageable,total);
        return page;
    }
}
