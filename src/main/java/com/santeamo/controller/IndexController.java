package com.santeamo.controller;

import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    ProductService productService;

    //打开首页
    @RequestMapping({"/index","/"})
    public String pageIndex(HttpSession session){
        List<Product> hots = productService.getHots();
        session.setAttribute("hots",hots);
        return "index";
    }

}
