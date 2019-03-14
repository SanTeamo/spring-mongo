package com.santeamo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    //打开首页
    @RequestMapping({"/index","/"})
    public String pageIndex(){
        return "index";
    }

}
