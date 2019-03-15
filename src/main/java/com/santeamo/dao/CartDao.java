package com.santeamo.dao;

import com.mongodb.WriteResult;
import com.santeamo.model.Cart;
import com.santeamo.model.ProductWrapper;

public interface CartDao extends BaseDao {

    Cart findByUserId(String userId);

    WriteResult removeCartItemById(String id, String cartId);

    WriteResult changeCartItemNum(String pid, Integer num, String cartId);

    WriteResult addToCart(ProductWrapper productWrapper, String userId);

    WriteResult clearCart(String userId);
}
