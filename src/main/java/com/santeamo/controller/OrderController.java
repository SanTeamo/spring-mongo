package com.santeamo.controller;

import com.santeamo.model.Order;
import com.santeamo.model.User;
import com.santeamo.myenum.OrderStatus;
import com.santeamo.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/Home/Order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @RequestMapping(value = {"","/"})
    public String myOrder(@PageableDefault(value = 3) Pageable pageable, Model model, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,3);
        Page<Order> page = orderService.findOrders(user,pageRequest);
        model.addAttribute("page",page);
        if (user.getType()==1){
            return "user/order_list";
        }
        if (user.getType()==2){
            return "seller/order_list";
        }
        return "redirect:/index";
    }

    @RequestMapping("/notdone")
    public String notDoneOrder(@PageableDefault(value = 3) Pageable pageable, Model model, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,3);
        Page<Order> page = orderService.findnotDoneOrders(user,pageRequest);
        model.addAttribute("page",page);
        if (user.getType()==1){
            return "user/order_list";
        }
        if (user.getType()==2){
            return "seller/order_list";
        }
        return "redirect:/index";
    }

    @RequestMapping("/done")
    public String doneOrder(@PageableDefault(value = 3) Pageable pageable, Model model, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,3);
        Page<Order> page = orderService.findDoneOrders(user,pageRequest);
        model.addAttribute("page",page);
        if (user.getType()==1){
            return "user/order_list";
        }
        if (user.getType()==2){
            return "seller/order_list";
        }
        return "redirect:/index";
    }

    @RequestMapping("/id/{id}")
    public String findOrderByOrderId(@PathVariable String id,Model model,HttpSession session){

        User user = (User) session.getAttribute("loginUser");
        Order order = orderService.findOrderByOIdAndUser(id,user);
        model.addAttribute("order",order);
        if (user.getType()==1){
            return "user/order_info";
        }
        if (user.getType()==2){
            return "seller/order_info";
        }
        return "redirect:/index";
    }

    @RequestMapping(value = {"/createOrder"},method = RequestMethod.POST)
    @ResponseBody
    public Boolean createOrder(Order order, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        order.setUserId(user.getId());
        order.setStatus(OrderStatus.NOTCONFIRM.getStatus());
        order.setOrderTime(new Date());
        //System.out.println(order);

        return orderService.createOrder(order);

        //return "redirect:/Home/Order";
    }

    @RequestMapping(value = {"/confirmOrder"},method = RequestMethod.POST)
    @ResponseBody
    public Boolean confirmOrder(Order order){
        return orderService.confirmOrder(order);
    }

    @RequestMapping(value = {"/payOrder"},method = RequestMethod.POST)
    @ResponseBody
    public Boolean payOrder(String orderId){

        return orderService.payOrder(orderId);
    }

    @RequestMapping(value = {"/signOrder"},method = RequestMethod.POST)
    @ResponseBody
    public Boolean signOrder(String orderId){

        return orderService.signOrder(orderId);
    }

    @RequestMapping(value = {"/sendOut"},method = RequestMethod.POST)
    @ResponseBody
    public Boolean sendOut(String orderId){

        return orderService.sendOut(orderId);

    }

}
