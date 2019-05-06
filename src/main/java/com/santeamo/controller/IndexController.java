package com.santeamo.controller;

import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    ProductService productService;

    //打开首页
    @RequestMapping({"/index","/"})
    public String pageIndex(){
        List<Product> hots = productService.getHots();
        return "index";
    }

}
