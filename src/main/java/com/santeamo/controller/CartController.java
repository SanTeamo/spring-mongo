package com.santeamo.controller;

import com.santeamo.model.Cart;
import com.santeamo.model.ProductWrapper;
import com.santeamo.model.User;
import com.santeamo.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Home/Cart")
public class CartController {

    @Resource
    private CartService cartService;

    @RequestMapping(value = {"","/"})
    public String myCart(HttpSession session){

        String userId = ((User) session.getAttribute("loginUser")).getId();
        Cart cart = cartService.findByUserId(userId);
        session.setAttribute("cart",cart);

        return "user/cart";
    }

    @RequestMapping("/addToCart")
    @ResponseBody
    public Boolean addToCart(ProductWrapper productWrapper, HttpSession session){

        //System.out.println(productWrapper);
        User user = (User) session.getAttribute("loginUser");

        return cartService.addToCart(productWrapper,user.getId());
    }

    @RequestMapping("/changeCartItemNum")
    @ResponseBody
    public Boolean changeCartItemNum(String pid,Integer num,HttpSession session){

        System.out.println("pid = "+pid + ", num = "+num);
        Cart cart = (Cart) session.getAttribute("cart");
        //session.getAttribute("loginUser");
        cartService.changeCartItemNum(pid,num,cart.getId());
        return true;
    }

    @RequestMapping("/removeCartItemById")
    @ResponseBody
    public Boolean removeCartItemById(String pid,HttpSession session){

        //System.out.println("收到"+pid);
        Cart cart = (Cart) session.getAttribute("cart");

        return cartService.removeCartItemById(pid,cart.getId());
    }

    @RequestMapping("/clearCart")
    @ResponseBody
    public Boolean clearCart(HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        return cartService.clearCart(user.getId());
    }

}
