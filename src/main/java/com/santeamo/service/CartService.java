package com.santeamo.service;

import com.santeamo.model.CartItem;
import com.santeamo.model.CartWrapper;

public interface CartService extends BaseService {

    CartWrapper findByUserId(String userId);

    void insertTest();

    Boolean removeCartItemById(String pid, String cartId);

    Boolean changeCartItemNum(String pid, Integer num, String cartId);

    Boolean addToCart(CartItem cartItem, String userId);

    Boolean clearCart(String id);
}
