package com.santeamo.service;

import com.santeamo.model.Cart;
import com.santeamo.model.ProductWrapper;

public interface CartService extends BaseService {

    Cart findByUserId(String userId);

    Boolean removeCartItemById(String pid, String cartId);

    Boolean changeCartItemNum(String pid, Integer num, String cartId);

    Boolean addToCart(ProductWrapper productWrapper, String userId);

    Boolean clearCart(String id);
}
