package com.santeamo.dao.impl;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.Product;
import com.santeamo.model.ProductWrapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import java.util.Iterator;
import java.util.List;

@Repository("productDao")
public class ProductDaoImpl extends MongoDBBaseDao implements ProductDao {

    @Override
    public Product getProductByPid(String id) {
        return mongoTemplate.findOne(new Query(Criteria.where("_id").is(id)),Product.class);
    }

    @Override
    public Page<Product> getProductsByQuery(Query query, Pageable pageable) {
        long total = mongoTemplate.count(query,Product.class);
        List<Product> list = mongoTemplate.find(query.with(pageable),Product.class);
        Page<Product> page = new PageImpl<>(list,pageable,total);
        return page;
    }

    @Override
    public void saleAdd(List<ProductWrapper> productWrappers) {

        for (ProductWrapper productWrapper : productWrappers){
            String pid = productWrapper.getPid();
            int num = productWrapper.getNum();
            Query query = new Query(Criteria.where("id").is(pid));
            Update update = new Update();
            update.inc("sales",num);
            mongoTemplate.updateFirst(query,update,Product.class);
        }
    }

}
