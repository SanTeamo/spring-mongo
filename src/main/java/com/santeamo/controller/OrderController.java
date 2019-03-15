package com.santeamo.controller;

import com.santeamo.model.Order;
import com.santeamo.model.User;
import com.santeamo.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
        Page<Order> page = orderService.findOrdersByUserId(user.getId(),pageRequest);
        model.addAttribute("page",page);
        return "order_list";
    }

    @RequestMapping("/notdone")
    public String notDoneOrder(@PageableDefault(value = 3) Pageable pageable, Model model, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,3);
        Page<Order> page = orderService.findnotDoneOrders(user.getId(),pageRequest);
        model.addAttribute("page",page);
        return "order_list";
    }

    @RequestMapping("/done")
    public String doneOrder(@PageableDefault(value = 3) Pageable pageable, Model model, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,3);
        Page<Order> page = orderService.findDoneOrders(user.getId(),pageRequest);
        model.addAttribute("page",page);
        return "order_list";
    }

    @RequestMapping("/createOrder")
    public String createOrder(Order order, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        order.setUserId(user.getId());
        order.setStatus(0);
        order.setOrderTime(new Date());
        //System.out.println(order);

        orderService.createOrder(order);

        return "redirect:/Home/Order";
    }

    @RequestMapping("/id/{id}")
    public String findOrderByOrderId(@PathVariable String id,Model model){

        Order order = orderService.findOrderByOrderId(id);
        model.addAttribute("order",order);

        return "order_info";
    }

    @RequestMapping("/confirmOrder")
    public String confirmOrder(Order order){

        order.setStatus(1);
        orderService.confirmOrder(order);

        return "redirect:/Home/Order";
    }

    @RequestMapping("/payOrder")
    public String payOrder(String orderId, HttpSession session){
        User user = (User) session.getAttribute("loginUser");

        return "redirect:/Home/Order";
    }

}
