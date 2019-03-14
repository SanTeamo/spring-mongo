package com.santeamo.dao.impl;

import com.santeamo.dao.OrderDao;
import com.santeamo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDao")
public class OrderDaoImpl extends MongoDBBaseDao implements OrderDao {
    @Override
    public Page<Order> findOrderById(String userId, Pageable pageable) {
        Query query = new Query(Criteria.where("userId").is(userId));
        long total = mongoTemplate.count(query,Order.class);
        List<Order> list = mongoTemplate.find(query,Order.class);
        Page<Order> page = new PageImpl<>(list,pageable,total);
        return page;
    }
}
