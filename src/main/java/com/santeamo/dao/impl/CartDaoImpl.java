package com.santeamo.dao.impl;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import com.santeamo.dao.CartDao;
import com.santeamo.model.Cart;
import com.santeamo.model.CartItem;
import org.springframework.data.mongodb.core.query.BasicQuery;
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
        update.pull("cartItems",new BasicDBObject("pid",pid));
        Query query = Query.query(Criteria.where("id").is(cartId));
        return mongoTemplate.updateFirst(query,update,Cart.class);
    }


    @Override
    public WriteResult changeCartItemNum(String pid, Integer num, String cartId) {

        System.out.println("changeCartItemNum, pid = "+pid+", num = "+num);

        Update update = Update.update("cartItems.$.num", num);
        Query query = new Query(Criteria.where("id").is(cartId).and("cartItems.pid").is(pid));
        return mongoTemplate.updateFirst(query, update, Cart.class);
    }

    @Override
    public WriteResult addToCart(CartItem cartItem, String userId) {

        Query queryOne = new Query(Criteria.where("userId").is(userId).and("cartItems.pid").is(cartItem.getPid()));

        Cart cart = mongoTemplate.findOne(queryOne,Cart.class);

        System.out.println(cart);

        //加入的商品已存在
        if (cart!=null){
            Integer num = cartItem.getNum();
            List<CartItem> cartItems = cart.getCartItems();
            for (int i = 0; i < cartItems.size(); i++) {
                CartItem item = cartItems.get(i);
                if (item.getPid().equals(cartItem.getPid())){
                    num = num + item.getNum();
                    break;
                }
            }

            Update update = Update.update("cartItems.$.num", num);
            Query updateQuery = new Query(Criteria.where("userId").is(userId).and("cartItems.pid").is(cartItem.getPid()));
            return mongoTemplate.updateFirst(updateQuery, update, Cart.class);

        }else {
            Query insertquery = new Query(Criteria.where("userId").is(userId));
            Update update = new Update();
            update.addToSet("cartItems",cartItem);
            return mongoTemplate.upsert(insertquery,update,Cart.class);
        }


    }

    @Override
    public WriteResult clearCart(String userId) {

        Query query = new Query(Criteria.where("userId").is(userId));
        Update update = new Update();
        update.pull("cartItems",new BasicDBObject());
        return mongoTemplate.updateFirst(query,update,Cart.class);
    }
}
