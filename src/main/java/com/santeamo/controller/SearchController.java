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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class SearchController {
    @Resource
    ProductService productService;

    @RequestMapping(value = "/Search",method = RequestMethod.GET)
    public String search(Model model,String keyword,@PageableDefault(value = 12) Pageable pageable) throws UnsupportedEncodingException {
        //System.out.println(keyword);
        keyword = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
        //System.out.println(keyword);

        Page<Product> page = productService.search(keyword,pageable);

        model.addAttribute("page",page);
        model.addAttribute("keyword",keyword);
        return "search";
    }

    @RequestMapping(value = "/Same",method = RequestMethod.GET)
    @ResponseBody
    public List<Product> same(String pname,String pid,Integer catId,@PageableDefault(value = 3) Pageable pageable) throws UnsupportedEncodingException {

        pname = new String(pname.getBytes("ISO-8859-1"),"UTF-8");

        Page<Product> page = productService.sameProduct(pname,pid,catId,pageable);

        return page.getContent();
    }
}
