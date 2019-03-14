package com.santeamo.service.impl;

import com.mongodb.WriteResult;
import com.santeamo.dao.CartDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.*;
import com.santeamo.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl extends BaseServiceImpl implements CartService {

    @Resource
    private CartDao cartDao;

    @Resource
    private ProductDao productDao;

    @Override
    public CartWrapper findByUserId(String userId) {

        Cart cart = cartDao.findByUserId(userId);

        if (cart==null){
            cart = new Cart();
            cart.setUserId(userId);
            cartDao.insert(cart);
            return null;
        }else {
            List<CartItem> cartItems = cart.getCartItems();

            List<CartItemWrapper> cartItemWrappers = new ArrayList<>();

            for (int i = 0; i < cartItems.size(); i++) {

                CartItem cartItem = cartItems.get(i);

                Product product = productDao.getProductByPid(cartItem.getPid());
                Integer num = cartItem.getNum();

                CartItemWrapper cartItemWrapper = new CartItemWrapper(product,num);

                cartItemWrappers.add(cartItemWrapper);

            }

            CartWrapper cartWrapper = new CartWrapper(cart.getId(),cart.getUserId(),cartItemWrappers);

            return cartWrapper;
        }
    }

    @Override
    public void insertTest() {
        Cart cart = new Cart();
        cart.setUserId("5c7de970ca1029208745e904");

        CartItem cartItem1 = new CartItem("5c7dd4b2ca1040a612208ca4",8);
        CartItem cartItem2 = new CartItem("5c7dd542ca1040a612208ca5",8);

        cart.getCartItems().add(cartItem1);
        cart.getCartItems().add(cartItem2);

        cartDao.insert(cart);
    }

    @Override
    public Boolean removeCartItemById(String pid, String cartId) {
        WriteResult writeResult = cartDao.removeCartItemById(pid,cartId);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Boolean changeCartItemNum(String pid, Integer num, String cartId) {
        WriteResult writeResult = cartDao.changeCartItemNum(pid, num, cartId);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Boolean addToCart(CartItem cartItem, String userId) {

        Cart cart = cartDao.findByUserId(userId);

        if (cart==null){
            cart = new Cart();
            cart.setUserId(userId);
            cartDao.insert(cart);
        }
        WriteResult writeResult = cartDao.addToCart(cartItem,userId);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Boolean clearCart(String userId) {
        WriteResult writeResult = cartDao.clearCart(userId);
        if (writeResult.getN()>0){
            return true;
        }else {
            return false;
        }
    }
}
