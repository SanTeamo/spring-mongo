package com.santeamo.dao;

import com.mongodb.WriteResult;
import com.santeamo.model.Cart;
import com.santeamo.model.CartItem;

public interface CartDao extends BaseDao {

    Cart findByUserId(String userId);

    WriteResult removeCartItemById(String id, String cartId);

    WriteResult changeCartItemNum(String pid, Integer num, String cartId);

    WriteResult addToCart(CartItem cartItem, String userId);

    WriteResult clearCart(String userId);
}
