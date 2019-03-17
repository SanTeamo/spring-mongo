package com.santeamo.controller;

import com.santeamo.model.Evaluation;
import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/Product")
public class ProductController {

    @Resource
    private ProductService productService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView ProductIndex(){

        ModelAndView modelAndView = new ModelAndView();

        List<Product> list = productService.getProducts();

        modelAndView.addObject("list",list);
        modelAndView.setViewName("product_list");

        return modelAndView;
    }

    @RequestMapping("addProductTest")
    public String addProductTest(){
        for (int i = 0; i < 10; i++) {
            Product product = new Product();
            product.setPname("西瓜"+i);
            product.setPrice(3.99D);
            product.setPdesc("很甜");
            product.setCatId(1);
            product.setEvalId("5c7dd18aca104dd40c159847");
            product.setPimage("testPimage.jpg");
            product.setPdescImage("testDescImage.JPG");
            product.setOwnerUserName("bbbb");
            product.setSales(2000);
            productService.insert(product);
        }

        return "redirect:/index";
    }

    @RequestMapping("/catId/{catId}")
    //@ResponseBody
    public String getProductsByCatId(@PathVariable Integer catId, Model model,@PageableDefault(value = 12) Pageable pageable){

        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,12);

        Page<Product> page = productService.getProductsByCatId(catId,pageRequest);

        model.addAttribute("page",page);
        //model.addAttribute("catId",null);
        return "product_list";
        //return page;
    }

    @RequestMapping("/catId/{catId}/id/{id}")
    public String getProductByCatIdAndPid(@PathVariable String id, Model model){

        Product product = productService.getProductByPid(id);

        Evaluation evaluation = productService.getEvaluationByEvalId(product.getEvalId());

        model.addAttribute("product",product);
        model.addAttribute("comments",evaluation.getComments());

        return "product_info";
    }

}
