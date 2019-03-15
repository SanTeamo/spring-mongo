package com.santeamo.service.impl;

import com.mongodb.WriteResult;
import com.santeamo.dao.CartDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.*;
import com.santeamo.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CartServiceImpl extends BaseServiceImpl implements CartService {

    @Resource
    private CartDao cartDao;

    @Resource
    private ProductDao productDao;

    @Override
    public Cart findByUserId(String userId) {

        Cart cart = cartDao.findByUserId(userId);

        if (cart==null){
            cart = new Cart();
            cart.setUserId(userId);
            cartDao.insert(cart);
            return null;
        }
        return cart;
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
    public Boolean addToCart(ProductWrapper productWrapper, String userId) {

        Cart cart = cartDao.findByUserId(userId);

        if (cart==null){
            cart = new Cart();
            cart.setUserId(userId);
            cartDao.insert(cart);
        }

        Product product = productDao.getProductByPid(productWrapper.getPid());
        productWrapper.setProduct(product);

        WriteResult writeResult = cartDao.addToCart(productWrapper,userId);
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
