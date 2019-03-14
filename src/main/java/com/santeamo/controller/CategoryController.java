package com.santeamo.controller;

import com.santeamo.model.Category;
import com.santeamo.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("Category")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    @RequestMapping(value = "findAllCats",produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Category> findAllCats(){

        List<Category> list = new ArrayList<>();
        list = categoryService.findAll();
        /*for (int i =0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }*/
        return list;
    }


}
