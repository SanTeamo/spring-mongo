package com.santeamo.controller;

import com.santeamo.model.Product;
import com.santeamo.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;

@Controller
public class SearchController {
    @Resource
    ProductService productService;

    @RequestMapping(value = "/Search",method = RequestMethod.GET)
    public String search(Model model,String keyword,@PageableDefault(value = 12) Pageable pageable) throws UnsupportedEncodingException {
        //System.out.println(keyword);
        keyword = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
        //System.out.println(keyword);
        Pageable pageRequest = new PageRequest(pageable.getPageNumber()==0?0:pageable.getPageNumber()-1,12);

        Page<Product> page = productService.search(keyword,pageRequest);

        model.addAttribute("page",page);
        model.addAttribute("keyword",keyword);
        return "search";
    }
}
