package com.santeamo.controller;

import com.santeamo.model.CartItem;
import com.santeamo.model.Order;
import com.santeamo.model.User;
import com.santeamo.service.OrderService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/Home/Order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @RequestMapping(value = {"","/"})
    public String myOrder(@PageableDefault(value = 5) Pageable pageable, Model model, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        Page<Order> page = orderService.findOrderById(user.getId(),pageable);
        model.addAttribute("page",page);
        return "order_list";
    }

    @RequestMapping("/createOrder")
    public String createOrder(Order order, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        order.setUserId(user.getId());
        order.setStatus(0);
        //System.out.println(order);

        orderService.insert(order);

        return "redirect:/Home/Cart";
    }
}
