package com.santeamo.dao.impl;

import com.mongodb.BasicDBObject;
import com.mongodb.WriteResult;
import com.santeamo.dao.CartDao;
import com.santeamo.model.Cart;
import com.santeamo.model.ProductWrapper;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("cartDao")
public class CartDaoImpl extends MongoDBBaseDao implements CartDao {
    @Override
    public Cart findByUserId(String userId) {
        return mongoTemplate.findOne(new Query(Criteria.where("userId").is(userId)),Cart.class);
    }

    @Override
    public WriteResult removeCartItemById(String pid, String cartId) {

        Update update = new Update();
        update.pull("productWrappers",new BasicDBObject("pid",pid));
        Query query = Query.query(Criteria.where("id").is(cartId));
        return mongoTemplate.updateFirst(query,update,Cart.class);
    }


    @Override
    public WriteResult changeCartItemNum(String pid, Integer num, String cartId) {

        //System.out.println("changeCartItemNum, pid = "+pid+", num = "+num);

        Update update = Update.update("productWrappers.$.num", num);
        Query query = new Query(Criteria.where("id").is(cartId).and("productWrappers.pid").is(pid));
        return mongoTemplate.updateFirst(query, update, Cart.class);
    }

    @Override
    public WriteResult addToCart(ProductWrapper productWrapper, String userId) {

        Query queryOne = new Query(Criteria.where("userId").is(userId).and("productWrappers.pid").is(productWrapper.getPid()));

        Cart cart = mongoTemplate.findOne(queryOne,Cart.class);

        //System.out.println(cart);

        //加入的商品已存在
        if (cart!=null){
            Integer num = productWrapper.getNum();
            List<ProductWrapper> productWrappers = cart.getProductWrappers();
            for (int i = 0; i < productWrappers.size(); i++) {
                ProductWrapper item = productWrappers.get(i);
                if (item.getPid().equals(productWrapper.getPid())){
                    num = num + item.getNum();
                    break;
                }
            }

            Update update = Update.update("productWrappers.$.num", num);
            Query updateQuery = new Query(Criteria.where("userId").is(userId).and("productWrappers.pid").is(productWrapper.getPid()));
            return mongoTemplate.updateFirst(updateQuery, update, Cart.class);

        }else {
            Query insertquery = new Query(Criteria.where("userId").is(userId));
            Update update = new Update();
            update.addToSet("productWrappers", productWrapper);
            return mongoTemplate.upsert(insertquery,update,Cart.class);
        }


    }

    @Override
    public WriteResult clearCart(String userId) {

        Query query = new Query(Criteria.where("userId").is(userId));
        Update update = new Update();
        update.pull("productWrappers",new BasicDBObject());
        return mongoTemplate.updateFirst(query,update,Cart.class);
    }
}
