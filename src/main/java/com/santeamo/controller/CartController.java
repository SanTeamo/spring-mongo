package com.santeamo.controller;

import com.santeamo.model.CartItem;
import com.santeamo.model.CartWrapper;
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
        CartWrapper cart = cartService.findByUserId(userId);
        session.setAttribute("cart",cart);

        return "cart";
    }

    @RequestMapping("/cartTest")
    public String cartTest(){
        cartService.insertTest();
        return "成功";
    }

    @RequestMapping("/changeCartItemNum")
    @ResponseBody
    public Boolean changeCartItemNum(String pid,Integer num,HttpSession session){

        System.out.println("pid = "+pid + ", num = "+num);
        CartWrapper cart = (CartWrapper) session.getAttribute("cart");
        //session.getAttribute("loginUser");
        cartService.changeCartItemNum(pid,num,cart.getId());
        return true;
    }

    @RequestMapping("/removeCartItemById")
    @ResponseBody
    public Boolean removeCartItemById(String pid,HttpSession session){

        //System.out.println("收到"+pid);
        CartWrapper cart = (CartWrapper) session.getAttribute("cart");

        return cartService.removeCartItemById(pid,cart.getId());
    }

    @RequestMapping("/addToCart")
    @ResponseBody
    public Boolean addToCart(CartItem cartItem,HttpSession session){

        //System.out.println(cartItem);
        User user = (User) session.getAttribute("loginUser");

        return cartService.addToCart(cartItem,user.getId());
    }

    @RequestMapping("/clearCart")
    @ResponseBody
    public Boolean clearCart(HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        return cartService.clearCart(user.getId());
    }

}
