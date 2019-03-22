package com.santeamo.controller;

import com.santeamo.model.Product;
import com.santeamo.model.User;
import com.santeamo.service.ShopService;
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

@Controller
@RequestMapping("/Shop")
public class ShopController {
    @Resource
    private ShopService shopService;

    @RequestMapping(value = {"","/"})
    public String myShop(HttpSession session, Model model, @PageableDefault(value = 10)Pageable pageable){
        User user = (User) session.getAttribute("loginUser");
        if(user.getType()==2){

            Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,12);

            Page<Product> page = shopService.getProductsByUserName(user.getUsername(),pageRequest);

            model.addAttribute("page",page);

            return "admin/shop";
        }else {
            return "shop";
        }
    }

    @RequestMapping("/{username}")
    public String browseShop(HttpSession session, Model model, @PathVariable String username, @PageableDefault(value = 10)Pageable pageable){
        User user = (User) session.getAttribute("loginUser");
        if(user.getType()==2){

            Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,12);

            Page<Product> page = shopService.getProductsByUserName(username,pageRequest);

            model.addAttribute("page",page);

            return "admin/shop";
        }else {

            //model.addAttribute("msg","店铺不存在！");

            //return "error";
            return "shop";
        }
    }

    @RequestMapping("/edit/{id}")
    public String product(@PathVariable String id,HttpSession session){

        Product product = shopService.getProductByPid(id);

        session.setAttribute("product",product);

        return "admin/product_info";
    }
}
